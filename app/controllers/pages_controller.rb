class PagesController < ApplicationController
  def injections
    render :injections
  end

  def broken_auth_and_session_management
    render :broken_auth_and_session_management
  end

  def xss
    render :xss
  end

  def broken_access_control
    render :broken_access_control
  end

  def security_misconfiguration
    render :security_misconfiguration
  end

  def sensitive_data_exposure
    render :sensitive_data_exposure
  end

  def insufficient_attack_protection
    render :insufficient_attack_protection
  end

  def csrf
    render :csrf
  end

  def using_component_with_known_vuln
    render :using_component_with_known_vuln
  end

  def underprotected_apis
    render :underprotected_apis
  end
end
