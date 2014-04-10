require "asdgasd/version"

module Gasdgasdg
  module Rails
    if ::Rails.version < "3.1"
      require "asdgasd/railtie"
    else
      require "asdgasd/engine"
    end
  end
end
