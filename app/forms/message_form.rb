class MessageForm < Reform::Form
  property :sender
  property :phone_number
  property :content
  validates :content, presence: true

  def submit
    create_message if valid?
    model
  end

  def create_message
    model.save
  end
end
