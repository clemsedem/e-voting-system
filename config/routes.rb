Rails.application.routes.draw do
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
  
 root to: 'home#index'
   
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
 
 # Enable and disable candidat
 get       'enable_candidate'   =>  'candidate_masters#enable_candidate'
 get       'disable_candidate'   =>  'candidate_masters#disable_candidate'
 
 
 
 
  
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
 
  
end
