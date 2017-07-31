# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'utility/version'

Gem::Specification.new do |spec|
  spec.name          = "utility"
  spec.version       = Utility::VERSION
  spec.authors       = ["Cenxky"]
  spec.email         = ["cenxky@gmail.com"]

  spec.summary       = %q{The useful utilities which made in ruby ways.}
  spec.description   = %q{The useful utilities which made in ruby ways.}
  spec.homepage      = "https://github.com/cenxky/utility"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
