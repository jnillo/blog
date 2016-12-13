Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  namespace :administration do
  	get '/', to: 'posts#index'
    resources :posts
    post 'posts/generate_internal_link', to: 'posts#generate_internal_link'
    resources :categories
    resources :resources
  end

  constraints subdomain: 'm' do
    root to: 'home#mobile_index'
    get ':slug', to: 'posts#mobile_show'
  end

  post '/subscribe', to: 'subscriptions#create', as: :subscribe
  resource :contact do
    post 'send', to: 'contact#send_message', as: :send
  end
  get '/filter_by_category/:category', to: 'posts#filter_by_category', as: :filter_by_category
  post '/home/load_info', to: 'home#load_info'
  post '/post/social-stats', to: 'posts#social_stats'
  get 'feed', to: 'posts#feed'
  get '/blog', to: 'posts#index', as: :blog
  get '/services', to: 'home#services'
  get '/resources', to: 'resources#index'
  get '/resources/filter_by/:category', to: 'resources#filter_by', as: :filter_resources
  get '/resources/download/:id', to: 'resources#increment_stats'
  root to: 'home#index'
  get ':slug', to: 'posts#show', as: 'show_post'
end
