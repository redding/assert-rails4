# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "assert-rails4/version"

Gem::Specification.new do |gem|
  gem.name        = "assert-rails4"
  gem.version     = AssertRails4::VERSION
  gem.authors     = ["Kelly Redding", "Collin Redding"]
  gem.email       = ["kelly@kellyredding.com", "collin.redding@me.com"]
  gem.summary     = "AssertRails adapter for Rails 4."
  gem.description = "AssertRails adapter for Rails 4."
  gem.homepage    = "https://github.com/redding/assert-rails4"
  gem.license     = "MIT"

  gem.files         = `git ls-files | grep "^[^.]"`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = '> 1.8'

  gem.add_dependency("assert",       ["~> 2.17.0"])
  gem.add_dependency("rails",        ["~> 4.0"])
  gem.add_dependency("assert-rails", ["~> 0.0.1"])

end
