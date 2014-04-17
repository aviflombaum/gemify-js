require "this-is-the-last-test-i-hope112fsj/version"

module Thisisthelasttestihope112fsj
  module Rails
    if ::Rails.version < "3.1"
      require "this-is-the-last-test-i-hope112fsj/railtie"
    else
      require "this-is-the-last-test-i-hope112fsj/engine"
    end
  end
end
