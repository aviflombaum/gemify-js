require "this-is-the-last-test-i-hope112fs/version"

module Thisisthelasttestihope112fs
  module Rails
    if ::Rails.version < "3.1"
      require "this-is-the-last-test-i-hope112fs/railtie"
    else
      require "this-is-the-last-test-i-hope112fs/engine"
    end
  end
end
