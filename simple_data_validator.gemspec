# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_data_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_data_validator"
  spec.version       = SimpleDataValidator::VERSION
  spec.authors       = ["Maksim Petrov"]
  spec.email         = ["petrovmp89@gmail.com"]

  spec.summary       = %q{Simple solution for validate all data in database}
  spec.homepage      = "https://github.com/petrovmp89/simple_data_validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
