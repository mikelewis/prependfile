# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "prependfile/version"

Gem::Specification.new do |s|
  s.name        = "prependfile"
  s.version     = Prependfile::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mike Lewis"]
  s.email       = ["ft.mikelewis@gmail.com"]
  s.homepage    = "http://github.com/mikelewis/prependfile"
  s.summary     = %q{Prepend any file with text}
  s.description = %q{Prepend any file with text}

  s.rubyforge_project = "prependfile"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
