Rails.application.routes.draw do
  

  

  

  # get 'welcome/index'

  resources :add_voter_reasons
  # get 'verification_page/index'

  devise_for :users
  # devise_for :models
  resources :roles
  resources :vote_results
  resources :voter_tokens
  resources :registered_voters
  resources :candidate_masters
  resources :portfolio_masters
  resources :program_masters
  resources :gender_masters
  resources :department_masters
  resources :faculty_masters
  resources :session_masters
  resources :level_masters
  
 # root to: 'home#index'
 root to: 'welcome#welcome'
 
 # admin home page
 get '/home/index' => 'home#index', :as => 'admin_home'
 
 # voter home page
 get 'vote_cast_page/voter_valid' => 'vote_cast_page#voter_valid', :as => 'voter_page'
 
 # verification page
  get '/verification_page/index' => 'verification_page#index', :as => 'verification_page'
  
  # polling agents page
  get '/polling_agent_page/index' => 'polling_agent_page#index', :as => 'polling_agent'
  
  # verify voter
  get 'verify_voter'   =>  'verification_page#verify_voter'
  
  # Display token
  get 'token_show'   =>  'verification_page#token_show'
  
  
   # validate voter
  get 'validate_voter'   =>  'vote_cast_page#validate_voter'
  
  # vote pages
 
  get 'vote_page/president' => 'vote_page#president', :as => 'president_page'
  get 'vote_page/secretary' => 'vote_page#secretary', :as => 'secretary_page'
  get 'vote_page/treasurer' => 'vote_page#treasurer', :as => 'treasurer_page'
  get 'vote_page/finacial_secretary' => 'vote_page#finacial_secretary', :as => 'finacial_secretary_page'
  get 'vote_page/wocom' => 'vote_page#wocom', :as => 'wocom_page' 
  
  
 devise_scope :user do
    get '/users/sign_up' => 'users#sign_in'
  end

  get '/users' => 'users#index'

  get '/users/new' => 'users#new', :as => 'new_user'
  post 'create_user' => 'users#create', as: :create_user
  get '/users/:id/edit' => 'users#edit', :as => 'edit_user'

  get '/users/:id' => 'users#show', :as => 'user'
  delete 'users/:id' => 'users#destroy'
  patch '/users/:id' => 'users#update', :as => 'update_user'
 
   
 # Enable and disable faculty
 get       'enable_faculty'    =>  'faculty_masters#enable_faculty'
 get       'disable_faculty'   =>  'faculty_masters#disable_faculty'
 
 # Enable and disable department
 get       'enable_department'   =>  'department_masters#enable_department'
 get       'disable_department'   =>  'department_masters#disable_department'
 
 # Enable and disable program
 get       'enable_program'   =>  'program_masters#enable_program'
 get       'disable_program'   =>  'program_masters#disable_program'
 
 # Enable and disable portfolio
 get       'enable_portfolio'   =>  'portfolio_masters#enable_portfolio'
 get       'disable_portfolio'   =>  'portfolio_masters#disable_portfolio'
 
  # Enable and disable session
 get       'enable_session'   =>  'session_masters#enable_session'
 get       'disable_session'   =>  'session_masters#disable_session'
 
  # Enable and disable level
 get       'enable_level'   =>  'level_masters#enable_level'
 get       'disable_level'   =>  'level_masters#disable_level'
 
  # Enable and disable voter
 get       'enable_voter'   =>  'registered_voters#enable_voter'
 get       'disable_voter'   =>  'registered_voters#disable_voter'
 
 # Enable and disable candidate
 get       'enable_candidate_prez'   =>  'candidate_masters#enable_candidate_prez'
 get       'disable_candidate_prez'   =>  'candidate_masters#disable_candidate_prez'
 
 get       'enable_candidate_sec'   =>  'candidate_masters#enable_candidate_sec'
 get       'disable_candidate_sec'   =>  'candidate_masters#disable_candidate_sec'
 
 get       'enable_candidate_tr'   =>  'candidate_masters#enable_candidate_tr'
 get       'disable_candidate_tr'   =>  'candidate_masters#disable_candidate_tr'
 
 get       'enable_candidate_f_sec'   =>  'candidate_masters#enable_candidate_f_sec'
 get       'disable_candidate_f_sec'   =>  'candidate_masters#disable_candidate_f_sec'
 
 get       'enable_candidate_wocom'   =>  'candidate_masters#enable_candidate_wocom'
 get       'disable_candidate_wocom'   =>  'candidate_masters#disable_candidate_wocom'
 
 
 
 
 
 # Enable and disable user
 get       'enable_user'   =>  'users#enable_user'
 get       'disable_user'   =>  'users#disable_user'
 
  # Enable and disable role
 get       'enable_role'   =>  'roles#enable_role'
 get       'disable_role'   =>  'roles#disable_role'
 
 
 post 'submit_vote_result' => 'vote_page#submit_vote_result'
 
 
  
 # Download excel and cvs for faculty
 get 'all_faculty_excel' => 'faculty_masters#all_faculty_excel'
 
 # Download excel and cvs for department
 get 'all_department_excel' => 'department_masters#all_department_excel'
 
 # Download excel and cvs for programs
 get 'all_program_excel' => 'program_masters#all_program_excel'
 
 # Download excel and cvs for portfolios
 get 'all_portfolio_excel' => 'portfolio_masters#all_portfolio_excel'
 
 # Download excel and cvs for session
 get 'all_session_excel' => 'session_masters#all_session_excel'
 
  # Download excel and cvs for level
 get 'all_level_excel' => 'level_masters#all_level_excel'
 
 # Download excel and cvs for voters
 get 'all_voter_excel' => 'registered_voters#all_voter_excel'
 
 # Download excel and cvs for candidates
 get 'all_candidate_excel' => 'candidate_masters#all_candidate_excel'
 
  # Download excel and cvs for users
 get 'all_users_excel' => 'users#all_users_excel'
 
  # Download excel and cvs for roles
 get 'all_roles_excel' => 'roles#all_roles_excel'
 
 
 # filtering tabbed candidates
 get 'president' => 'candidate_masters#president'
 get 'secretary' => 'candidate_masters#secretary'
 get 'treasurer' => 'candidate_masters#treasurer'
 get 'finance_sec' => 'candidate_masters#finance_sec'
 get 'wocom' => 'candidate_masters#wocom'
  
end
