Rails.application.routes.draw do
  # namespace the controllers without affecting the URI
  # scope module: :v1, constraints: ApiVersion.new('v1', true) do
  #   resources :parks
  # end
  namespace 'v1' do
    get '/parks/random' => 'parks#random'
    get '/parks/search' => 'parks#search'
    resources :parks
  end
end
