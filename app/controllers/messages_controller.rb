class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end
  
  def create
    @message = MessageForm.new(Message.new(message_params)).submit
    SendTwilioSmsService.new(@message).call if @message
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end