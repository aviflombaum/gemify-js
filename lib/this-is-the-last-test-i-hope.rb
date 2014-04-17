require "this-is-the-last-test-i-hope/version"

module Thisisthelasttestihope
  module Rails
    if ::Rails.version < "3.1"
      require "this-is-the-last-test-i-hope/railtie"
    else
      require "this-is-the-last-test-i-hope/engine"
    end
  end
end
