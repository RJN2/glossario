Glossario::Application.routes.draw do

  # Authentication
  devise_for :users, skip: [:sessions, :passwords, :confirmations, :registrations]
  as :user do
    # session handling
    get     '/signin'  => 'devise/sessions#new',     as: 'new_user_session'
    post    '/signin'  => 'devise/sessions#create',  as: 'user_session'
    delete  '/signout' => 'devise/sessions#destroy', as: 'destroy_user_session'

    # joining
    get   '/signup' => 'devise/registrations#new',    as: 'new_user_registration'
    post  '/signup' => 'devise/registrations#create', as: 'user_registration'

    scope '/settings' do
      # password reset
      get   '/reset-password'        => 'devise/passwords#new',    as: 'new_user_password'
      put   '/reset-password'        => 'devise/passwords#update', as: 'user_password'
      post  '/reset-password'        => 'devise/passwords#create'
      get   '/reset-password/change' => 'devise/passwords#edit',   as: 'edit_user_password'

      # confirmation
      get   '/confirm'        => 'devise/confirmations#show',   as: 'user_confirmation'
      post  '/confirm'        => 'devise/confirmations#create'
      get   '/confirm/resend' => 'devise/confirmations#new',    as: 'new_user_confirmation'

      # settings & cancellation
      get '/cancel'   => 'devise/registrations#cancel', as: 'cancel_user_registration'
      get '' => 'devise/registrations#edit',   as: 'edit_user_registration'
      put '' => 'devise/registrations#update'

      # account deletion
      delete '' => 'devise/registrations#destroy'
    end
  end

  authenticated :user do
    root to: 'glossaries#index', as: :authenticated_root
  end

  root to: 'static_pages#home'
  
  match '/help', to: 'static_pages#help', via: 'get'

  resources :glossaries do
    resources :terms, except: [:index]
  end
end
