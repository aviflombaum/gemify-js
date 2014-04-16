require "asfasdfsadfasdfadsfasdfdsf/version"

module Asfasdfsadfasdfadsfasdfdsf
  module Rails
    if ::Rails.version < "3.1"
      require "asfasdfsadfasdfadsfasdfdsf/railtie"
    else
      require "asfasdfsadfasdfadsfasdfdsf/engine"
    end
  end
end
