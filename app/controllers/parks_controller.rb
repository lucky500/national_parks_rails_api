class ParksController < ApplicationController
  before_action :find_park, only: [:show, :update, :destroy]

  # GET /parks
  def index
    @parks = Park.all
    json_response(@parks)
  end

  # POST /parks
  def create
    @park = Park.create!(park_params)
    json_response(@park, :created)
  end

  # Get /parks/:id

  # PUT /parks/:id

  # DELETE /parks/:id

  private

  def park_params
    # whitelist params
    params.permit(:name, :address, :description)
  end

  def find_park
    @park = Park.find(params[:id])
  end
end