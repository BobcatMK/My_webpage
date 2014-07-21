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
	# END OF RESTS CONTROLLER
end
