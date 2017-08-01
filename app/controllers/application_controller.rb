# Mother of all controllers
class ApplicationController < ActionController::Base
  protected

  def broken_session
    sid = params[:sid]
    @user_session ||= ActiveRecord::SessionStore::Session.find_by_session_id(sid).tap do |s|
      s.data = s.data.merge('todos' => []) unless s.data['todos']
    end
  end
end
