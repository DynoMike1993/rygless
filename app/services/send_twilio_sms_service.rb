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
    account_sid = 'AC1aafe6a5f06223114092c33f386a5815'
    auth_token = 'f57398263ee610b2dea1a1e667c6a0d1'
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
