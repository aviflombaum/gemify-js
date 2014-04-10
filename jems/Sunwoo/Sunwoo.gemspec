# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Sunwoo/version'

Gem::Specification.new do |gem|
  gem.name          = "Sunwoo"
  gem.version       = Asdf::Rails::VERSION
  gem.authors       = "Wontae"
  gem.email         = "l;ksjdfiow"
  gem.description   = "wojfls"
  gem.summary       = ""
  gem.homepage      = "lkjwoilkdfj"
  gem.license       = "MIT"

  gem.add_dependency "railties"
  gem.add_dependency "thor"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
end
