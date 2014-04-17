require "this-is-the-last-test-i-hope112fsjadf/version"

module Thisisthelasttestihope112fsjadf
  module Rails
    if ::Rails.version < "3.1"
      require "this-is-the-last-test-i-hope112fsjadf/railtie"
    else
      require "this-is-the-last-test-i-hope112fsjadf/engine"
    end
  end
end
