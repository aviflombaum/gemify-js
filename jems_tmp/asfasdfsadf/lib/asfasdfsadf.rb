require "asfasdfsadf/version"

module Asfasdfsadf
  module Rails
    if ::Rails.version < "3.1"
      require "asfasdfsadf/railtie"
    else
      require "asfasdfsadf/engine"
    end
  end
end
