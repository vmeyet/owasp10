class CsrfController < ApplicationController
  layout 'demo'

  def login
    return redirect_to :bank_account if session[:user_id]
    render :login
  end

  def post_login
    username = params[:username].downcase
    password = EncryptionService.encrypt(params[:password].to_s)

    @user = User.find_by(username: username, encrypted_password: password)

    return head :forbidden unless @user

    session[:user_id] = @user.id

    redirect_to :bank_account
  end

  def bank_account
    @user = User.find_by_id(session[:user_id])

    return head :forbidden unless @user

    render :bank_account
  end

  def bank_transfer
    user = User.find_by_id(session[:user_id])
    to_user = User.find_by_id(params[:to])
    amount = params[:amount]

    return head :forbidden unless user && to_user && amount

    Deposit.create!(
      user: user,
      to_user: to_user,
      amount: amount.to_i,
      comment: params[:comment],
      created_at: Time.now
    )

    head :no_content
  end
end
