class Message < ActiveRecord::Base

  def self.text_chef(signup)
    number = signup.post.chef.phone_number
    twilio_client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    twilio_client.account.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: number,
      body: "#{signup.cook.full_name} has signed up for one of your job posts! https://backburner.herokuapp.com/"
    )
  end

  def self.text_cook(signup)
    number = signup.cook.phone_number
    twilio_client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    twilio_client.account.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: number,
      body: "The Chef has made a decision: https://backburner.herokuapp.com/"
    )
  end

end
