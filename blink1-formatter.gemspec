# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "blink1_formatter/version"

Gem::Specification.new do |s|
  s.name        = "blink1-formatter"
  s.version     = Blink1Formatter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Atsushi Nagase']
  s.email       = ['a@ngs.io']
  s.homepage    = "http://github.com/ngs/blink1-formatter"
  s.summary     = "blink(1) RSpec formatter"
  s.description = "Indicates RSpec status with blink(1)"

  s.rubyforge_project = "blink1_formatter"
  s.add_development_dependency  'bundler',     '~> 1.0'
  s.add_development_dependency  'rspec',       '~> 2.11'
  # s.add_development_dependency  'guard-rspec', '~> 1.2'

  s.files        = `git ls-files`.split("\n").reject{|f| f =~ /^\..+$/}
  s.require_paths = ["lib"]
end

