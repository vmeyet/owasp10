module Api
  class TodosController < ApplicationController
    def index
      render json: broken_session.data['todos']
    end

    def create
      broken_session.data['todos'] << { 'note' => params[:note] }
      broken_session.save
    end
  end
end
