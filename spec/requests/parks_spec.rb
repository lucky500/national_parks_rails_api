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

  # Test suite for GET /parks/:id
  describe 'GET /parks/:id' do
    before { get '/parks/#{id}' }

    context 'when the record exists' do
      it 'returns the park' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exists' do
      let(:id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Park/)
      end
    end
  end

  # Test suite for POST /parks
  describe 'POST /parks' do
    # valid payload
    let(:valid_attributes) { { name: 'Central Park', address: 'New York, NY', description: 'Central Park is an urban park in Manhattan, New York City. It comprises 843 acres between the Upper West Side and Upper East Side, roughly bounded by Fifth Avenue on the east, Central Park West on the ...'} }

    context 'when the request is valid' do
      before { post '/parks', params: valid_attributes }

      it 'creates a park' do
        expect(json['name']).to eq('Central Park')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/parks', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Address can't be blank/)
      end
    end
  end

  # Test suite for PUT /parks/:id
  describe 'PUT  /parks/:id' do
    let(:valid_attributes) { { name: 'Elm Park'} }

    context 'when the record exists' do
      before { put "/parks/#{id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /parks/:id
  describe 'DELETE /parks/:id' do
    before { delete "/parks/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end













