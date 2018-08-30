require 'twilio-ruby'

class SendTwilioSmsService
  def initialize(message)
    @message = message
  end

  def call
    send_sms
  end

  private

  def twilio_client
    
  end

  def send_sms
    @client = Twilio::REST::Client.new(
      Rails.application.credentials.twilio_sid,
      Rails.application.credentials.twilio_token
    )
    # client = twilio_client
    p @client.api.account.messages.create(
      from: '+15005550006',
      to: '+48725577014',
      body: 'Hey there!',
      status_callback: 'https://149be62c.ngrok.io'
    )
  end

  attr_reader :message
end
