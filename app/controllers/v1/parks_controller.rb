module V1
  class ParksController < ApplicationController
    before_action :find_park, only: [:show, :update, :destroy]

    # GET /parks
    def index
      # get paginated parks
      @parks = Park.paginate(:page => params[:page], :per_page => 30)
      @parks = Park.by_name(params[:name]) if params[:name].present?
      @parks = Park.by_address(params[:address]) if params[:address].present?
      json_response(@parks)
    end

    # POST /parks
    def create
      @park = Park.create!(park_params)
      json_response(@park, :created)
    end

    # GET /parks/:id
    def show
      json_response(@park)
    end

    def random
      @park = Park.random
      json_response(@park)
    end

    # PUT /parks/:id
    def update
      @park.update(park_params)
      head :no_content
    end

    # DELETE /parks/:id
    def destroy
      @park.destroy
      head :no_content
    end
    

    private

    def park_params
      # whitelist params
      params.permit(:name, :address, :description)
    end

    def find_park
      @park = Park.find(params[:id])
    end
  end
end