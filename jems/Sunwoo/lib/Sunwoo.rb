require "Sunwoo/version"

module Asdf
  module Rails
    if ::Rails.version < "3.1"
      require "Sunwoo/railtie"
    else
      require "Sunwoo/engine"
    end
  end
end
