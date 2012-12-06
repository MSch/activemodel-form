# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_model/form/version'

Gem::Specification.new do |gem|
  gem.name          = "activemodel-form"
  gem.version       = ActiveModel::Form::VERSION
  gem.authors       = ["Martin Schürrer"]
  gem.email         = ["martin@schuerrer.org"]
  gem.description   = %q{ActiveModel with support for booleans and datetimes in form helpers}
  gem.summary       = %q{}
  gem.homepage      = "https://github.com/MSch/activemodel-form"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'activemodel', '~> 3.2.7'
  gem.add_runtime_dependency 'activesupport', '~> 3.2.7'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'minitest'
end
