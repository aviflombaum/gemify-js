require "this-is-tfSADSsdfA/version"

module Thisistfsadssdfa
  module Rails
    if ::Rails.version < "3.1"
      require "this-is-tfSADSsdfA/railtie"
    else
      require "this-is-tfSADSsdfA/engine"
    end
  end
end
