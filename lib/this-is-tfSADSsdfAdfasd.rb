require "this-is-tfSADSsdfAdfasd/version"

module Thisistfsadssdfadfasd
  module Rails
    if ::Rails.version < "3.1"
      require "this-is-tfSADSsdfAdfasd/railtie"
    else
      require "this-is-tfSADSsdfAdfasd/engine"
    end
  end
end
