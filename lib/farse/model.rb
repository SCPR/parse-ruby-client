# -*- encoding : utf-8 -*-
module Farse
  class Model < Farse::Object
    def initialize
      super(self.class.to_s)
    end
  end
end
