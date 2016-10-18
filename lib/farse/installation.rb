require 'farse/protocol'
require 'farse/client'
require 'farse/error'
require 'farse/object'

module Farse
  class Installation < Farse::Object

    def initialize(data = nil)
      super(Parse::Protocol::CLASS_INSTALLATION, data)
    end

    def uri
      Protocol.installation_uri @parse_object_id
    end

  end
end
