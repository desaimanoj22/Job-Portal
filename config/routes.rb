JobPortal::Application.routes.draw do
  namespace :agencies do resources :fetch_resumes_agency_settings end

  devise_for :users

  resources :skillsets
  resources :states
  resources :cities
  
  match "/candidates/apply" => 'candidates#apply'
  match "/position_apply" => 'candidates#position_apply'
  match "/applied" => 'candidates#applied'
  

  resources :candidates do
    resources :contactinfos
  end
  resources :agencies do
    resources :contactinfos
    resources :email_settings
    resources :emails
  end
  resources :companies do 
    resources :contactinfos
    resources :email_settings
    resources :emails
  end
  #resources :companies do
   resources :positions
  #end

  #positions
  match "/positions/:id/show" => 'positions#show'
  match "/positions/:company_id/new" => 'positions#new'
  match "/positions/new/:agency_id" => 'positions#new'
  match "/positions/:company_id/index" => "positions#index"
  match "/create_position" => 'positions#create'
  match "/destroy_positions" => 'positions#destroy'
  match "/positions/:id/edit" => 'positions#edit'
  match "/savepublish" => 'positions#savepublish'
  match "/updatepublish" => 'positions#updatepublish'
  match "/publish_agency" => 'positions#publish_agency'
  
  
  
  #candidates
  match "/candidates/:id/show" => 'candidates#show'
  match "/candidates/:id/welcome" => "candidates#welcome", :as=> :candidate_welcome
  match "/candidates/:id/search" => "candidates#search"
  match "/destroy_candidates" => 'candidates#destroy'
  match '/my_cities_list' => 'candidates#update_cities'
  match "/joblist/search" => 'joblist#search'
  match "/joblist/show" => 'joblist#show'
  match "/savecontinue"  => 'candidates#savecontinue'
  match "/updatecontinue"  => 'candidates#updatecontinue'
  match "/contactinfo"  => 'candidates#contactinfo'
  match "/contactinfo_update"  => 'candidates#contactinfo_update'
 
  #companies
  match "/companies/:id/welcome" => "companies#welcome", :as=> :company_welcome
  match "/companies/:id/fetch_resumes_settings" => "companies#fetch_resumes_settings", :as => :fetch_resumes_settings
  match "/companies/:id/company_resumes" => "companies#company_resumes", :as => :company_resumes
  match "/companies/:id/fetch_resumes" => "companies#fetch_resumes"
  match "/companies/:id/resumes_list" => "companies#resumes_list"
  match '/companies/resume_download/:id/:type/:attached_file_name(.:format)' => 'companies#resume_download', :as => 'resume_download'
  match "/destroy_companies" => 'companies#destroy' 
  match "/companies/:id/show" => 'companies#show'
  match '/my_cities_list' => 'companies#update_cities'
  
  #agencies
   match '/my_cities_list' => 'agencies#update_cities'
   match "/destroy_agencies" => 'agencies#destroy' 
   match "/published" => 'agencies#published'
   match "/agencies/:id/welcome" => 'agencies#welcome', :as=> :agency_welcome
   match "/agencies/:id/fetch_resumes_agency_settings" => "agencies#fetch_resumes_agency_settings", :as => :fetch_resumes_agency_settings
   match "/agencies/:id/agency_resumes" => "agencies#agency_resumes", :as => :agency_resumes
   match "/agencies/:id/fetch_resumes_agency" => "agencies#fetch_resumes_agency"
   match "/agencies/:id/resumes_agency_list" => "agencies#resumes_agency_list"
   match '/agencies/resume_download/:id/:type/:attached_file_name(.:format)' => 'agencies#resume_download', :as => 'resume_download'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id(.:format)))'
end
