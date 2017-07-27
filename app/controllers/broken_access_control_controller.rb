class BrokenAccessControlController < ApplicationController
  layout 'demo'

  def directory_traversal
    @files = Dir.glob("public/images/#{params[:path]}/*").map { |f| f.gsub('public', '') }
    render :directory_traversal
  end
end
