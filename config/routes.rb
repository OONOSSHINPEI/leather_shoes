Rails.application.routes.draw do
  
   # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'customers/sessions'
}
 # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
 devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  root to: "homes#top"
  get 'homes/index' => 'homes#index'
  
    namespace :public do
    
        resources :articles, only: [:new, :create, :index, :show]
        resources :customers
    end
    
    #namespace :admin do
     
    #end
   



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
