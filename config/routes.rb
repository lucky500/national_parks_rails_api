Rails.application.routes.draw do
  # namespace the controllers without affecting the URI
  # scope module: :v1, constraints: ApiVersion.new('v1', true) do
  #   resources :parks
  # end
  namespace 'v1' do
    resources :parks
  end
end
