# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'utility/version'

Gem::Specification.new do |spec|
  spec.name          = "utility"
  spec.version       = Utility::VERSION
  spec.authors       = ["Cenxky"]
  spec.email         = ["cenxky@gmail.com"]

  spec.summary       = %q{A number of ruby useful utilities.}
  spec.description   = %q{A number of ruby useful utilities.}
  spec.homepage      = "https://github.com/cenxky/utility"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "macaddr", "~> 1.0"
  spec.add_dependency "nokogiri", "~> 1.8"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
