# frozen_string_literal: true

require 'sinatra'
require 'json'
require 'byebug'

set :bind, '0.0.0.0'

get '/' do
  'hello world'
end

post '/' do
  status, headers, body = call!(env.merge('PATH_INFO' => '/launch_request'))
end

post '/launch_request' do
  event = JSON.parse(request.body.read, symbolize_names: true)
  version, session, context, _request = event.values_at(*event.keys)

  {
    version: '1.0',
    response: {
      outputSpeech: {
        type: 'PlainText',
        text: 'Hello World'
      }
    }
  }.to_json
end
