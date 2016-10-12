Rails.application.routes.draw do
  root 'home#index'
  devise_for :members
  mount Commontator::Engine => '/commontator'
  def route_rule(category,useage)
    get category+'/'+useage => category+'#'+useage
    get category+'/'+useage+'/:id' => category+'#'+useage, :constraints => { :id => /[0-9]+(\%7C[0-9]+)*/ }
    post category+'/'+useage+'/write' => category+'#'+useage+'_write'
  end
  #home routes
  get 'create' => 'home#create_post'
  post 'create' => 'home#create_post'
  get 'profile' => 'home#your_profile'
  #file management
  post 'upload_image' => 'home#upload_image'
  post 'upload_file' => 'home#upload_file'
  #introduce routes
  get 'introduce/history' => 'introduce#history'
  get 'introduce/history/:id' => 'introduce#history'
  post 'introduce/history/write' => 'introduce#history_write'
  get 'introduce/staff' => 'introduce#staff'
  get 'introduce/staff/:id' => 'introduce#staff'
  post 'introduce/staff/write' => 'introduce#staff_write'
  get 'introduce/song' => 'introduce#song'
  get 'introduce/song/:id' => 'introduce#song'
  post 'introduce/song/write' => 'introduce#song_write'
  get 'introduce/rules' => 'introduce#rules'
  get 'introduce/rules/:id' => 'introduce#rules'
  post 'introduce/rules/write' => 'introduce#rules_write'
  #board routes
  route_rule('board','notice')
  route_rule('board','free')
  route_rule('board','member')
  route_rule('board','graduate')
  route_rule('board','sameage')
  get 'board/:senior_number' => 'board#sameage', :constraints => { :senior_number =>  /[0-9]+(\%7C[0-9]+)*/}
  get 'board/:senior_number'+'/:id' => 'board#sameage', :constraints => { :id => /[0-9]+(\%7C[0-9]+)*/, :senior_number =>  /[0-9]+(\%7C[0-9]+)*/}
  post 'board/:senior_number'+'/write' => 'board#sameage'+'_write', :constraints => { :senior_number =>  /[0-9]+(\%7C[0-9]+)*/}
  #old data restore, #database:/rails/db
  get 'db/restore' => 'home#insert_old_huhs_net'
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
