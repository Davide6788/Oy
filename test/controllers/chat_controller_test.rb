require "test_helper"

class ChatControllerTest < ActionDispatch::IntegrationTest
  def show
    @chat = Chat.find(params[:id])
  end
end
