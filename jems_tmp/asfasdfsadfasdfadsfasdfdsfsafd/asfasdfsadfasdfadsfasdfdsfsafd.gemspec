# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asfasdfsadfasdfadsfasdfdsfsafd/version'

Gem::Specification.new do |gem|
  gem.name          = "asfasdfsadfasdfadsfasdfdsfsafd"
  gem.version       = "0.0.1"
  gem.authors       = "Wontae Yang"
  gem.email         = "wontaeyang@gmail.com"
  gem.description   = "asdfasdfasdf"
  gem.summary       = "asdfasdfasdf"
  gem.homepage      = "http://github.com"
  gem.license       = "MIT"

  gem.add_runtime_dependency 'railties', '~> 0'
  gem.add_runtime_dependency 'thor', '~> 0'
  gem.add_development_dependency 'rake', '~> 0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
