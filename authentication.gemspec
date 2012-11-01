# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'authentication/version'

Gem::Specification.new do |gem|
  gem.name          = "authentication"
  gem.version       = Authentication::VERSION
  gem.authors       = ["Fujimura Daisuke"]
  gem.email         = ["me@fujimuradaisuke.com"]
  gem.description   = %q{Minimalist authentication library for Ruby}
  gem.summary        = %q{Minimalist authentication library for Ruby}
  gem.homepage      = "https://github.com/fujimura/authentication"

  #gem.rubyforge_project = "authentication"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
