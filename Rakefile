require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "railroad"
    gem.executables = "railroad"
    gem.email = ['peter@hoeg.com', 'p.hoeg@northwind.sg', 'javier@smaldone.com.ar']
    gem.homepage = "http://github.com/peterhoeg/RailRoad"
    gem.authors = ["Peter Hoeg", "Javier Smaldone"]
    gem.summary = "A DOT diagram generator for Ruby on Rail applications"
    gem.description = gem.summary
    gem.files = FileList["[A-Z]*", "{autotest,bin,lib,spec}/**/*", ".document"]
    gem.extra_rdoc_files = FileList["*.rdoc"]
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
require 'lib/version'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "railroad #{RailRoad::VERSION::STRING}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('CHANGELOG*')
  rdoc.rdoc_files.include('AUTHORS*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
