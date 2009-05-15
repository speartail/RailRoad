require 'rubygems'
SPEC = Gem::Specification.new do |s|
  s.name         = "railroad"
  s.version      = "0.4.0"
  s.author       = "Javier Smaldone"
  s.email        = "javier@smaldone.com.ar"
  s.homepage     = "http://railroad.rubyforge.org"
  s.platform     = Gem::Platform::RUBY
  s.summary      = "A DOT diagram generator for Ruby on Rail applications"
  s.files        = Dir.glob("lib/railroad/*.rb") + 
                   ["ChangeLog", "COPYING", "rake.gemspec"]
  s.bindir       = "bin"
  s.executables  = ["railroad"]
  s.default_executable = "railroad"
  s.has_rdoc     = true
  s.extra_rdoc_files = ["README", "COPYING"]
end
