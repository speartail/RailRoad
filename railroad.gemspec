# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{railroad}
  s.version = "0.5.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Hoeg", "Javier Smaldone"]
  s.date = %q{2009-05-15}
  s.default_executable = %q{railroad}
  s.email = ["peter@hoeg.com", "p.hoeg@northwind.sg", "javier@smaldone.com.ar"]
  s.executables = ["railroad"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "AUTHORS.rdoc",
     "CHANGELOG.rdoc",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "bin/railroad",
     "lib/aasm_diagram.rb",
     "lib/app_diagram.rb",
     "lib/controllers_diagram.rb",
     "lib/diagram_graph.rb",
     "lib/models_diagram.rb",
     "lib/options_struct.rb",
     "railroad.gemspec",
     "spec/app_diagram_spec.rb",
     "spec/railroad_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/peterhoeg/RailRoad}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A DOT diagram generator for Ruby on Rail applications}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/app_diagram_spec.rb",
     "spec/railroad_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
