class SensitiveDataExposureController < ApplicationController
  layout 'demo'

  def password_leak
    render :password_leak
  end

  def post_password_leak
    username = params[:username].downcase
    password = EncryptionService.encrypt(params[:password].to_s)

    @user = User.find_by(username: username, encrypted_password: password)

    render :password_leak_logged
  end
end
