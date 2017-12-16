require 'rails_helper'

describe 'Parks API', type: :request do
  # Initialize test data
  let!(:parks) { create_list(:park, 10) }
  let(:id) { parks.first.id }

  # Test suite for GET / Parks
  describe 'GET /parks' do
    #  Mkae HTTP get request before each example
    before { get '/parks' }

    it 'returns parks' do
      # Note 'json is a custom helper to parse JSON responses'
      expect(json).not_to be_empty
      exppect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  
end