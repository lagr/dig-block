lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dig/block/version"

Gem::Specification.new do |spec|
  spec.name          = "dig-block"
  spec.version       = Dig::Block::VERSION
  spec.authors       = ["Timo Schilling"]
  spec.email         = ["timo@schilling.io"]

  spec.summary       = %q{Block support for Ruby's dig method.}
  spec.description   = %q{Block support for Ruby's dig method.}
  spec.homepage      = "https://github.com/timoschilling/dig-block"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.3.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
