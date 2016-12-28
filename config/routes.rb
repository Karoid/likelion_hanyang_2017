Rails.application.routes.draw do
  root 'home#index'
  devise_for :members
  post '/comment/:id' => 'board#write_comment'
  get '/board/:category/:board' => 'board#showBoard'
  get '/board/:category/:board/:id' => 'board#showArticle', :constraints => { :id => /[0-9]+(\%7C[0-9]+)*/ }
  get '/board/:category/:board/create' => 'home#create_post', :constraints => { :id => /[0-9]+(\%7C[0-9]+)*/ }
  post '/board/:category/:board/write' => 'board#pagelogic_write'
  post '/board/:category/:board/:post_id/create' => 'home#create_post', :constraints => { :id => /[0-9]+(\%7C[0-9]+)*/ }
  post '/board/:category/:board/:post_id/write' => 'board#pagelogic_write', :constraints => { :post_id => /[0-9]+(\%7C[0-9]+)*/ }
  #home routes
  get 'create' => 'home#create_post'
  post 'create' => 'home#create_post'
  get 'profile' => 'home#your_profile'
  #file management
  post 'upload_image' => 'home#upload_image'
  post 'upload_file' => 'home#upload_file'
  #board routes
  get 'board/:senior_number' => 'board#sameage', :constraints => { :senior_number =>  /[0-9]+(\%7C[0-9]+)*/}
  get 'board/:senior_number'+'/:id' => 'board#sameage', :constraints => { :id => /[0-9]+(\%7C[0-9]+)*/, :senior_number =>  /[0-9]+(\%7C[0-9]+)*/}
  post 'board/:senior_number'+'/write' => 'board#sameage'+'_write', :constraints => { :senior_number =>  /[0-9]+(\%7C[0-9]+)*/}
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
