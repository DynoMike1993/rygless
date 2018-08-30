require 'twilio-ruby'

class ReceiveTwilioSmsService
  def initialize(response)
    @response = response
  end

  def call
    save_response
  end

  private

  def save_response
  end

  attr_reader :response
end