# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yhsd_api/version'

Gem::Specification.new do |spec|
  spec.name          = "yhsd_api"
  spec.version       = YhsdApi::VERSION
  spec.authors       = ["jinhua"]
  spec.email         = ["kg19902933@gmail.com"]
  spec.summary       = %q{The youhaosuda API gem provide developers quick use public API, Just need to do the configuration section.}
  spec.description   = %q{The youhaosuda API gem provide developers quick use public API, Just need to do the configuration section.}
  spec.homepage      = "https://www.youhaosuda.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "rest-client"
  spec.add_runtime_dependency "oj"
end
