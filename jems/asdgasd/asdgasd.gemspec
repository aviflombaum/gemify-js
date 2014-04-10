# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asdgasd/version'

Gem::Specification.new do |gem|
  gem.name          = "asdgasd"
  gem.version       = Gasdgasdg::Rails::VERSION
  gem.authors       = "asdgasd"
  gem.email         = "asdgasdg"
  gem.description   = "asdgasdg"
  gem.summary       = "cheese"
  gem.homepage      = "asdgasdg"
  gem.license       = "MIT"

  gem.add_dependency "railties"
  gem.add_dependency "thor"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
end
