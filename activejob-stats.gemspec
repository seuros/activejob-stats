# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_job/stats/version'

Gem::Specification.new do |spec|
  spec.name          = 'activejob-stats'
  spec.version       = Activejob::Stats.gem_version
  spec.authors       = ['Abdelkader Boudih']
  spec.email         = ['terminale@gmail.com']
  spec.summary       = %q(Activejob Stats is an Activejob addon that will collect and send data samples from your Jobs to various stat servers)
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/seuros/activejob-stats.git'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activejob'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'statsd-ruby'
end
