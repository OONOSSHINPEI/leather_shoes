Rails.application.routes.draw do
    
  get 'homes/index' => 'homes#index'
  #post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
    scope module: :public do
        resources :articles, only: [:new, :create, :index, :show]
    end
    
    #namespace :admin do
     
    #end
   
 # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

 # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
