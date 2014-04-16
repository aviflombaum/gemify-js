require "aewagawe/version"

module Aewagawe
  module Rails
    if ::Rails.version < "3.1"
      require "aewagawe/railtie"
    else
      require "aewagawe/engine"
    end
  end
end
