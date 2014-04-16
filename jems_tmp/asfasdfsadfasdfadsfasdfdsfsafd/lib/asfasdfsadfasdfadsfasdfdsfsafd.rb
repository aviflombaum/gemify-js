require "asfasdfsadfasdfadsfasdfdsfsafd/version"

module Asfasdfsadfasdfadsfasdfdsfsafd
  module Rails
    if ::Rails.version < "3.1"
      require "asfasdfsadfasdfadsfasdfdsfsafd/railtie"
    else
      require "asfasdfsadfasdfadsfasdfdsfsafd/engine"
    end
  end
end
