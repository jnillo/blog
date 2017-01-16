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
    resources :comments
    post '/approve_comment/:id', to: 'comments#approve_comment', as: :approve_comment
    delete '/remove_comment/:id', to: 'comments#remove_comment', as: :remove_comment
    post '/reply_comment', to: 'comments#reply_comment', as: :reply_comment
  end

  constraints subdomain: 'm' do
    get '/blog', to: 'posts#mobile_index', as: :blog_mobile
    get '/services', to: 'home#services', as: :services_mobile
    get '/resources', to: 'resources#index', as: :mobile_resources
    get '/resources/filter_by/:category', to: 'resources#filter_by', as: :mobile_filter_resources
    root to: 'home#mobile_index'
    get ':slug', to: 'posts#mobile_show'
  end

  post '/subscribe', to: 'subscriptions#create', as: :subscribe
  resource :contact do
    post 'send', to: 'contact#send_message', as: :send
  end

  get '/filter_by_category/:category', to: 'posts#filter_by_category', as: :filter_by_category
  post '/home/load_info', to: 'home#load_info'
  post '/post/likes', to: 'posts#new_like'
  post '/post/social-stats', to: 'posts#social_stats'
  resources :comments
  get 'feed', to: 'posts#feed', :defaults => { :format => "xml" }
  get '/blog', to: 'posts#index', as: :blog
  get '/services', to: 'home#services'
  get '/resources', to: 'resources#index'
  get '/resources/filter_by/:category', to: 'resources#filter_by', as: :filter_resources
  get '/resources/download/:id', to: 'resources#increment_stats'
  post '/resources/likes', to: 'resources#new_like'
  get '/glossary', to: 'glossary#index'
  get '/sitemap.xml', to: 'sitemap#index', defaults: { format: 'xml' }
  root to: 'home#index'
  get ':slug', to: 'posts#show', as: 'show_post'
end
