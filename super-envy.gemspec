# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "super-envy/version"

Gem::Specification.new do |s|
  s.name        = "super-envy"
  s.version     = SuperEnvy::VERSION
  s.authors     = ["Łukasz Korecki"]
  s.email       = ["lukasz@coffeesounds.com"]
  s.homepage    = ""
  s.summary     = %q{Convenience wrapper around ENV}
  s.description = %q{If you find youself using ENVironment variables very often, you really want to use SuperEnvy}

  s.rubyforge_project = "super-envy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
end
