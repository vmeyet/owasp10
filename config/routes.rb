Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: 'json' } do
    resources :todos

    resources :users do
      resources :chat_messages, shallow: true
    end
  end

  get '', to: 'pages#home'
  get 'questions', to: 'pages#questions'

  scope :'owasp-top-ten', controller: :pages do
    get 'injections', action: :injections
    get 'broken-auth-and-session-management', action: :broken_auth_and_session_management
    get 'xss', action: :xss
    get 'broken-access-control', action: :broken_access_control
    get 'security-misconfiguration', action: :security_misconfiguration
    get 'sensitive-data-exposure', action: :sensitive_data_exposure
    get 'insufficient-attack-protection', action: :insufficient_attack_protection
    get 'csrf', action: :csrf
    get 'using-component-with-known-vuln', action: :using_component_with_known_vuln
    get 'underprotected-apis', action: :underprotected_apis
  end

  namespace :demos do
    get 'code-injection', action: :code_injection
    get 'sql-injection', action: :sql_injection

    get 'broken-session-management', to: redirect('/broken-auth-and-session-management/broken-session-management')
    get 'directory-traversal', to: redirect('/broken-access-control/directory-traversal/cats')
    get 'client-reflected-xss', to: redirect('/xss/client-reflected-xss')
    get 'insecure-direct-object-reference', to: redirect('/broken-access-control/insecure-direct-object-reference')
    get 'password-leak', to: redirect('/sensitive-data-exposure/password-leak')
    get 'csrf', to: redirect('/csrf/login')
  end

  namespace :injections do
    post '/code-injection', action: :code_injection
    post '/sql-injection', action: :sql_injection
  end

  scope :'broken-auth-and-session-management', controller: :broken_auth_and_session_management do
    get 'broken-session-management', action: :broken_session_management
  end

  namespace :xss do
    get 'client-reflected-xss', action: :client_reflected_xss
  end

  scope :'broken-access-control', controller: :broken_access_control do
    get 'directory-traversal/(*path)', action: :directory_traversal
    get 'insecure-direct-object-reference', action: :insecure_direct_object_reference
  end

  scope :'sensitive-data-exposure', controller: :sensitive_data_exposure do
    get 'password-leak', action: :password_leak
    post 'password-leak', action: :post_password_leak
  end

  scope :'csrf', controller: :csrf do
    get 'login', action: :login
    post 'login', action: :post_login
    get 'bank-account', action: :bank_account
    get 'bank-transfer', action: :bank_transfer
  end
end
