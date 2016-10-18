# -*- encoding : utf-8 -*-
module Farse

  # Base exception class for errors thrown by the Parse
  # client library. ParseError will be raised by any
  # network operation if Farse.init() has not been called.
  class FarseError < StandardError #Exception ... why? A:http://www.skorks.com/2009/09/ruby-exceptions-and-exception-handling/
  end

  # An exception class raised when the REST API returns an error.
  # The error code and message will be parsed out of the HTTP response,
  # which is also included in the response attribute.
  class FarseProtocolError < FarseError
    attr_accessor :code
    attr_accessor :error
    attr_accessor :response

    def initialize(response)
      @response = response
      if response
        @code   = response["code"]
        @error  = response["error"]
      end

      super("#{@code}: #{@error}")
    end

    def to_s
      @message || super
    end

    def message=(msg)
      @message = msg
    end
  end

  class FarseProtocolRetry < FarseProtocolError
  end

end
