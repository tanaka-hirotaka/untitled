Rails.application.routes.draw do

#  get "/inform" => "inform#gamen_sentaku"
#  get "inform/hatsugen_inf"
#  get "inform/hatsugen_inf/:ht11" => "inform#toukou"
#  get "inform/hatsugen_inf/:re_id" => "inform#toukou"
#  get "inform/toukou" => "inform"
#  get "/b_inform/bosyuu_inf"
#  get "b_inform/:ht22" => "b_inform#toukou"
#  get "b_inform/:re_id" => "b_inform#toukou"
#  get "b_inform/toukou" => "b_inform"

  devise_for :accounts, :controllers =>{
      :registrations => :registrations
  }
  resources :recruitments, only: [ :create, :destroy ]
  resources :comments, only: [ :create, :destroy ]
  get '/comments/index/:p_com_id', to: 'comments#index', as: :comments_index, constraints: { p_com_id: /[0-9]+/ }
  get '/comments/index/add/:p_com_id/:size', to: 'comments#add_index', as: :comments_add, constraints: { size: /[0-9]+/ }
  resources :chat_comments
  resources :entry_chats
  root 'mains#index'

  get 'home/:acc_id', to: 'home#show', as: :account_show
  get '/home/button/:id', to: 'home#button', as: 'home_button'

  post '/'=> 'tags#update'#タグ検索フォーム
  post '/'=> 'tags#update'#履歴検索フォーム

  get '/mains/button/:id', to: 'mains#button', as: 'mains_button'
  get '/mains/index/add/:size', to: 'mains#add_index', as: :mains_add, constraints: { size: /[0-9]+/ }
  get '/members', to: 'members#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
