require "this-is-the-last-test-i-hope112f/version"

module Thisisthelasttestihope112f
  module Rails
    if ::Rails.version < "3.1"
      require "this-is-the-last-test-i-hope112f/railtie"
    else
      require "this-is-the-last-test-i-hope112f/engine"
    end
  end
end
