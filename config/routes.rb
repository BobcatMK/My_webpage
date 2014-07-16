MyWebpage::Application.routes.draw do
  # MAINS CONTROLLER
  root 'mains#learn_webdeb'
	match "learn_webdeb", to:"mains#learn_webdeb", via: "get"
	match "learn_webdeb", to:"mains#learn_webdeb", via: "post"
	match "motivation", to:"mains#motivation", via: "get"
	match "about", to: "mains#about", via: "get"
	match "books_courses", to: "mains#books_courses", via: "get"
	match "contact", to: "mains#contact", via: "get"
	match "admin", to: "mains#admin", via: "get"
	resources "mains", only: [:create,:destroy,:update,:edit]
  get '/mains/new/(:parent_id)', to: "mains#new", as: :new_main
	# Routes for contact page only
	match "create_subscriber", to: "mains#create_subscriber", via: "post"
	match "send_contact", to: "mains#send_contact", via: "post"
	# END OF MAINS CONTROLLER
	
	
	
	# POSTS CONTROLLER
  resources :posts
  match "create_post", to: "posts#create_post", via: "get"
  match "create_motivation", to: "posts#create_motivation", via: "get"
  match "save_motivation", to: "posts#save_motivation", via: "post"
  get "/web development/(:id)", to: "posts#learn_showpost", as: :learn_showpost
  get "motivation/(:id)", to: "posts#motivation_showpost", as: :motivation_showpost
	# END OF POSTS CONTROLLER

	
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
