# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'TESTTHESESHIZ-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "TESTTHESESHIZ-rails"
  gem.version       = "1.4.2"
  gem.authors       = "bersar"
  gem.email         = "yangsunwoo@gmail.com"
  gem.description   = "This is a test gem for the testjs jquery plugin."
  gem.summary       = "This is a test gem for the testjs jquery plugin.asdgasdgadsg"
  gem.homepage      = "http://ww.github.com/sunwooz"
  gem.license       = "MIT"

  gem.add_runtime_dependency 'railties', '~> 0'
  gem.add_runtime_dependency 'thor', '~> 0'
  gem.add_development_dependency 'rake', '~> 0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
