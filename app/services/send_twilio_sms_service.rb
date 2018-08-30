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
    account_sid = Rails.application.credentials.twilio_sid
    auth_token = Rails.application.credentials.twilio_token
    Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_sms
    from = '+15005550006'
    to = '+48725577014'
    twilio_client.messages.create(
      from: from,
      to: to,
      body: message.content
    )
  end

  attr_reader :message
end
