require "this-is-tfSADSsdfAdf/version"

module Thisistfsadssdfadf
  module Rails
    if ::Rails.version < "3.1"
      require "this-is-tfSADSsdfAdf/railtie"
    else
      require "this-is-tfSADSsdfAdf/engine"
    end
  end
end
