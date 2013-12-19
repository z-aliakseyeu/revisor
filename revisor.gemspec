# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'revisor/version'

Gem::Specification.new do |spec|
  spec.name          = "revisor"
  spec.version       = Revisor::VERSION
  spec.authors       = ["acin91"]
  spec.email         = ["z.aliakseyeu@gmail.com"]
  spec.description   = %q{Revisor site watcher}
  spec.summary       = %q{This library allows will notify you if your site down and if it again works great.}
  spec.homepage      = "https://github.com/acin91/revisor"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "nexmo"
end
