class BrokenAuthAndSessionManagementController < ApplicationController
  layout 'demo'

  def broken_session_management
    session[:_setting_the_session] = true

    if params[:sid].blank?
      return redirect_to(
        controller: :broken_auth_and_session_management,
        action: :broken_session_management,
        sid: session.id
      )
    end

    @broken_session = broken_session
    render :broken_session_management
  end
end
