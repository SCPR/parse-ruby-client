# -*- encoding : utf-8 -*-
require 'farse/protocol'
require 'farse/client'
require 'farse/error'
require 'farse/object'

module Farse
  class User < Farse::Object

    def self.authenticate(username, password)
      body = {
        "username" => username,
        "password" => password
      }

      response = Farse.client.request(Farse::Protocol::USER_LOGIN_URI, :get, nil, body)
      Farse.client.session_token = response[Farse::Protocol::KEY_USER_SESSION_TOKEN]

      new(response)
    end

    def self.reset_password(email)
      body = {"email" => email}
      Farse.client.post(Farse::Protocol::PASSWORD_RESET_URI, body.to_json)
    end

    def initialize(data = nil)
      data["username"] = data[:username] if data[:username]
      data["password"] = data[:password] if data[:password]
      super(Farse::Protocol::CLASS_USER, data)
    end

    def uri
      Protocol.user_uri @parse_object_id
    end

  end
end
