# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'baze'
  s.version     = '1.1.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Pierre Carrier']
  s.email       = ['pc@rrier.ca']
  s.homepage    = 'https://github.com/pcarrier/baze'
  s.summary     = 'Base utilities for POSIX system'
  s.license     = 'ISC'

  s.required_rubygems_version = '>= 1.2.0'

  s.files        = Dir.glob('{bin,lib}/**/*') + %w(COPYING)
  s.executables  = Dir.entries('bin').reject {|e| e.start_with? '.'}
  s.require_path = 'lib'
end
