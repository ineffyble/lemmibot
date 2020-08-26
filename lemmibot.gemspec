# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lemmibot/version'

Gem::Specification.new do |spec|
  spec.name                  = 'lemmibot'
  spec.version               = Lemmibot::VERSION
  spec.authors               = ['Effy Elden']
  spec.email                 = ['git@effy.is']

  spec.summary               = 'A toy robot with better self-preservation instincts than a lemming'
  spec.homepage              = 'https://github.com/ineffyble/lemmibot'
  spec.license               = 'MIT'

  spec.required_ruby_version = '>= 2.0.0'

  spec.files                 = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir                = 'exe'
  spec.executables           = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths         = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.49'
  spec.add_development_dependency 'aruba', '~> 0.14'
end
