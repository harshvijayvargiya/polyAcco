Rails.application.routes.draw do
  get 'resumes/index'
  get 'resumes/new'
  get 'resumes/create'
  get 'resumes/destroy'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        confirmations: 'users/confirmations'

      }

  resources :comments do
    member do
      patch :active
      patch :inactive
    end
    collection do
      get :comment_by_status
    end  
  end    
  resources :articles do
    member do
      patch :active
      patch :inactive
    end
    collection do 
      get :article_by_status
    end
  end    
  resources :pictures
  root 'articles#rootpage'
  #root 'home#index'
  #root 'users#sign_up'
  resources :resumes


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
