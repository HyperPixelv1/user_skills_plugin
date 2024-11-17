Rails.application.routes.draw do
  resources :issues, only: [:index, :show] do
    member do
      post "update_skills", to: "user_skills#update_skills"
    end
  end
end
