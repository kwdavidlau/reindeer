require 'twilio-ruby'
require 'sinatra'

post '/receive_sms' do
  content_type 'text/xml'
  response = Twilio::TwiML::Response.new do |r|
    r.Message 'Test received message'
  end

  response.to_xml
end
