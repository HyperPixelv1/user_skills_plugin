Rails.application.routes.draw do
  resources :issues do
    member do
      post "update_skills", to: "user_skills#update_skills"
    end
  end

  resources :users do
    member do
      get "skills", to: "users#show" # Kullanıcı detayları için UsersController'daki show metodunu çağır
      resources :user_skills, only: [:index]
    end
  end
end
