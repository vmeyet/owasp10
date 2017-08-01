module Api
  class ChatMessagesController < ApplicationController
    def index
      render json: User.find(params[:user_id]).chat_messages
    end

    def show
      render json: ChatMessage.find(params[:id])
    end
  end
end
