class BrokenAccessControlController < ApplicationController
  layout 'demo'

  def directory_traversal
    @files = Dir.glob("public/images/#{params[:path]}/*").map { |f| f.gsub('public', '') }
    render :directory_traversal
  end

  def insecure_direct_object_reference
    session[:user_id] = 1
    render :insecure_direct_object_reference
  end
end
