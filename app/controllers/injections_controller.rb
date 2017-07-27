class InjectionsController < ApplicationController
  layout 'demo'

  def code_injection
    @result = `man #{params[:cmd]}`.tr("\b", '').gsub(/(.)\1/, '\1')
  end

  def sql_injection
    username = params[:username]
    password = params[:password]

    @user = User.find_by(<<-SQL)
      username = "#{username}" AND encrypted_password = "#{password}"
    SQL
  rescue StandardError => e
    @error = e.message.gsub(/ +/, ' ')
  end

  def blind_sql_injection
    username = params[:username]
    password = params[:password]

    @user = User.find_by(<<-SQL)
      username = "#{username}" AND encrypted_password = "#{password}"
    SQL
  rescue StandardError
    redirect_to '/demos/blind-sql-injection'
  end
end
