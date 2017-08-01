class XssController < ApplicationController
  layout 'demo'

  def client_reflected_xss
    render :client_reflected_xss
  end
end
