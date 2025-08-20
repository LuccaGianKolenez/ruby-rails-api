Rails.application.routes.draw do
  post "auth/sign_in", to: "auth#sign_in"

  resources :users, only: [:create, :index, :show]
  resources :tasks

  get "/health", to: proc { [200, {"Content-Type"=>"application/json"}, [{ status: "ok" }.to_json]] }
end
