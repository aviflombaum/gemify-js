require "this-is-tfSADSFA/version"

module Thisistfsadsfa
  module Rails
    if ::Rails.version < "3.1"
      require "this-is-tfSADSFA/railtie"
    else
      require "this-is-tfSADSFA/engine"
    end
  end
end
