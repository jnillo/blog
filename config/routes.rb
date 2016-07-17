Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  namespace :administration do
  	get '/', to: 'posts#index'
    resources :posts
    post 'posts/generate_internal_link', to: 'posts#generate_internal_link'
    resources :categories
  end

  constraints subdomain: 'm' do
    root to: 'home#mobile_index'
    get ':slug', to: 'posts#mobile_show'
  end

  post 'subscribe', to: 'subscriptions#create', as: :subscribe
  resource :contact do
    post 'send', to: 'contact#send_message', as: :send
  end
  post '/home/load_info', to: 'home#load_info'
  post '/post/social-stats', to: 'posts#social_stats'
  root to: 'home#index'
  get ':slug', to: 'posts#show', as: 'show_post'
end
