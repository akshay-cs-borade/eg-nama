Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "namantarans#index"


  resources :namantarans do
    collection do 
      post :copy_namantaran
    end  
    resources :steps, only: [:show, :update]
  end

  # custom para usar cells
  post 'namantarans/:namantaran_id/steps/:step' => 'steps#update'
end
