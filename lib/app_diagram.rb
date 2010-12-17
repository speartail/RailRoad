# RailRoad - RoR diagrams generator
# http://railroad.rubyforge.org
#
# Copyright 2007-2008 - Javier Smaldone (http://www.smaldone.com.ar)
# See COPYING for more details

require 'diagram_graph'

# Root class for RailRoad diagrams
class AppDiagram

  def initialize(options)
    @options = options
    @graph = DiagramGraph.new
    @graph.show_label = @options.label

    STDERR.print "Loading application environment\n" if @options.verbose
    load_environment

    STDERR.print "Loading application classes\n" if @options.verbose
    load_classes
  end

  # Print diagram
  def print
    if @options.output
      old_stdout = STDOUT.dup
      begin
        STDOUT.reopen(@options.output)
      rescue
        STDERR.print "Error: Cannot write diagram to #{@options.output}\n\n"
        exit 2
      end
    end
    
    if @options.xmi 
        STDERR.print "Generating XMI diagram\n" if @options.verbose
    	STDOUT.print @graph.to_xmi
    else
        STDERR.print "Generating DOT graph\n" if @options.verbose
        STDOUT.print @graph.to_dot 
    end

    if @options.output
      STDOUT.reopen(old_stdout)
    end
  end # print

  private 

  # Prevents Rails application from writing to STDOUT
  def disable_stdout
    @old_stdout = STDOUT.dup
    STDOUT.reopen(PLATFORM =~ /mswin/ ? "NUL" : "/dev/null")
  end

  # Restore STDOUT  
  def enable_stdout
    STDOUT.reopen(@old_stdout)
  end


  # Print error when loading Rails application
  def print_error(type)
    STDERR.print "Error loading #{type}.\n  (Are you running " +
                 "#{APP_NAME} on the aplication's root directory?)\n\n"
  end

  # Load Rails application's environment
  def load_environment
    begin
      disable_stdout
      require "config/environment"
      enable_stdout
    rescue LoadError
      enable_stdout
      print_error "application environment"
      raise
    end
  end

  # Extract class name from filename, respecting modules
  def extract_class_name(filename)
    class_name = File.basename(filename).chomp(".rb").camelize
    rooted_filename = filename.sub(Rails.root, '').sub(/^app\/\w+?\//, '').sub(/^lib/, '')
    module_names = rooted_filename.split('/')[0..-2].map(&:camelize).join('::')
    module_names.present? ? module_names << '::' << class_name : class_name
  end

end # class AppDiagram
