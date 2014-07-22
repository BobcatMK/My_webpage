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
  get '/mains/new/(:parent_id)/(:post_id)/(:post_motivation_id)', to: "mains#new", as: :new_main
  get "admin/all_comments", to: "mains#view_all_comments", as: :view_all_comments
	# Routes for contact page only
	match "create_subscriber", to: "mains#create_subscriber", via: "post"
	match "send_contact", to: "mains#send_contact", via: "post"
	# Route for form of mystory
	patch "admin/mystory/(:id)", to: "mains#edit_mystory_admin",as: :edit_mystory_admin
	# END OF MAINS CONTROLLER
	
	
	# POSTS CONTROLLER
  resources :posts
  match "create_post", to: "posts#create_post", via: "get"
  match "create_motivation", to: "posts#create_motivation", via: "get"
  match "save_motivation", to: "posts#save_motivation", via: "post"
  get "/web development/(:id)", to: "posts#learn_showpost", as: :learn_showpost
  get "motivation/(:id)", to: "posts#motivation_showpost", as: :motivation_showpost
  # FOR ADMIN WEBPAGE
  get "/admin/web development/(:id)/(:ahojmarynarzu)", to: "posts#admin_webdev", as: :admin_webdev
  get "/admin/delete_post/(:id)/(:alibaba)", to: "posts#delete_post", as: :delete_post
  get "/admin/edit_poscik/(:id)/(:alibaba)", to: "posts#edit_poscik", as: :edit_poscik
  patch "/admin/edit(:id)/(:alibaba)", to: "posts#apdejt", as: :apdejt
  get "/admin/delete_post_comment/(:comment_id)", to: "posts#delete_post_comment", as: :delete_post_comment
  get "/admin/edit_post_comment/(:comment_id)", to: "posts#edit_post_comment", as: :edit_post_comment
  patch "/admin/update_edit_post_comment/(:comment_id)", to: "posts#update_edit_post_comment", as: :update_edit_post_comment
	# END OF POSTS CONTROLLER


	# RESTS CONTROLLER
	get "projects/(:id)/(:name)", to: "rests#show_project", as: :show_project
	get "admin_show_projects/(:id)", to: "rests#admin_show_project", as: :admin_show_project
	get "admin_show_projects_delete/(:id)", to: "rests#admin_show_project_delete", as: :admin_show_project_delete
	get "creating_project", to: "rests#creating_project", as: :creating_project
	post "create_project_final", to: "rests#create_project_final", as: :create_project_final
	get "editing_project/(:id)", to: "rests#editing_project",as: :editing_project
	patch "edit_project_final/(:id)", to: "rests#edit_project_final", as: :edit_project_final
	#PRODUCT'S ROUTES
	get "admin/show_all_products", to: "rests#admin_all_products",as: :admin_all_products
	get "admin/create_new_product", to: "rests#create_new_product",as: :create_new_product
	post "admin/create_product_final", to: "rests#create_product_final",as: :create_product_final
	get "admin/edit_product/(:id)", to: "rests#edit_product", as: :edit_product
	patch "admin/final_product", to: "rests#edit_final_product", as: :edit_final_product
	patch "admin/delete_product", to: "rests#delete_product", as: :delete_product
	#CONTACT INFORMATIONS ROUTES
	get "admin/contact_information", to: "rests#contact_information",as: :contact_information
	patch "admin/contact_information_edit", to: "rests#contact_information_edit", as: :contact_information_edit
	#END OF CONTACT INFORMATIONS ROUTES 
	# END OF RESTS CONTROLLER
end
