Depot::Application.routes.draw do
  resources :comments

  resources :subcategories

  resources :categories

  get 'orders/ship'

  get 'admin' => 'admin#index'

  get 'permission' => 'permission#index'

  controller :sessions do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end
  
  scope '(:locale)' do

	  resources :users

	  resources :orders

	  resources :line_items

	  resources :carts
	  
	  resources :searches
	  
	  resources :help	  
	  resources :questions
	  resources :news
	  resources :contacts


	  resources :products do
		get :who_bought, :on => :member
	  end

	root :to => 'store#index', :as => 'store'
  end
  
  
end
