require "TESTTHESESHIZ-rails/version"

module Testtheseshizrails
  module Rails
    if ::Rails.version < "3.1"
      require "TESTTHESESHIZ-rails/railtie"
    else
      require "TESTTHESESHIZ-rails/engine"
    end
  end
end
