# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'emacs-ruby/version'

Gem::Specification.new do |s|
  s.name        = 'emacs-ruby'
  s.version     = EmacsRuby::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Xiaoxing Hu']
  s.email       = ['dawnstar.hu@gmail.com']
  s.homepage    = 'http://github.com/xiaoxinghu/emacs-ruby'
  s.summary     = %q{emacs wrapper in ruby}
  s.description = %q{An emacs wrapper written in ruby.}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.license = 'MIT'
  # s.add_runtime_dependency('middleman-core', ['~> 3.3'])
end
