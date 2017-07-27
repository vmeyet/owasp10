Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope :'owasp-top-ten', controller: :pages do
    get '/injections', action: :injections
    get '/broken-auth-and-session-management', action: :broken_auth_and_session_management
    get '/xss', action: :xss
    get '/broken-access-control', action: :broken_access_control
    get '/security-misconfiguration', action: :security_misconfiguration
    get '/sensitive-data-exposure', action: :sensitive_data_exposure
    get '/insufficient-attack-protection', action: :insufficient_attack_protection
    get '/csrf', action: :csrf
    get '/using-component-with-known-vuln', action: :using_component_with_known_vuln
    get '/underprotected-apis', action: :underprotected_apis
  end

  namespace :demos do
    get '/code-injection', action: :code_injection
    get '/sql-injection', action: :sql_injection
    get '/blind-sql-injection', action: :blind_sql_injection

    get '/directory-traversal', to: redirect('/broken-access-control/directory-traversal/cats')

    # get '/url-session-id', action: :url_session_id
  end

  namespace :injections do
    post '/code-injection', action: :code_injection
    post '/sql-injection', action: :sql_injection
    post '/blind-sql-injection', action: :blind_sql_injection
  end

  scope :'broken-access-control', controller: :broken_access_control do
    get '/directory-traversal/(*path)', action: :directory_traversal
  end
end
