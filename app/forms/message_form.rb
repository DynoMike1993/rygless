class MessageForm < Reform::Form
  property :sender
  property :phone_number
  property :content
  validates :content, presence: true

  def submit
    if valid?
      create_message
      send_message
    end
    model
  end
  
  private

  def create_message
    model.save
  end

  def send_message
    SendTwilioSmsService.new(model).call
  end
end
