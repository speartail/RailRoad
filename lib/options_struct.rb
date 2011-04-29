# RailRoad - RoR diagrams generator
# http://railroad.rubyforge.org
#
# Copyright 2007-2008 - Javier Smaldone (http://www.smaldone.com.ar)
# See COPYING for more details

require 'ostruct'

# RailRoad command line options parser
class OptionsStruct < OpenStruct

  require 'optparse'

  def initialize
    init_options = { :all => false,
                     :brief => false,
                     :exclude => [],
                     :inheritance => false,
                     :join => false,
                     :label => false,
                     :modules => false,
                     :hide_magic => false,
                     :hide_types => false,
                     :hide_public => false,
                     :hide_protected => false,
                     :hide_private => false,
                     :plugins_models => false,
                     :root => '',
                     :show_belongs_to => false,
                     :transitive => false,
                     :verbose => false,
                     :xmi => false,
                     :command => '' }
    super(init_options)
  end # initialize

  def parse(args)
    @opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: #{RailRoad::APP_NAME} [options] command"
      opts.separator ""
      opts.separator "Common options:"
      opts.on("-b", "--brief", "Generate compact diagram", 
              "  (no attributes nor methods)") do |b|
        self.brief = b
      end
      opts.on("-e", "--exclude file1[,fileN]", Array, "Exclude given files") do |list|
        self.exclude = list
      end
      opts.on("-i", "--inheritance", "Include inheritance relations") do |i|
        self.inheritance = i
      end
      opts.on("-l", "--label", "Add a label with diagram information", 
              "  (type, date, migration, version)") do |l|
        self.label = l
      end
      opts.on("-o", "--output FILE", "Write diagram to file FILE") do |f|
        self.output = f
      end
      opts.on("-r", "--root PATH", "Set PATH as the application root") do |r|
        self.root = r
      end
      opts.on("-v", "--verbose", "Enable verbose output", 
              "  (produce messages to STDOUT)") do |v|
        self.verbose = v
      end
      opts.on("-x", "--xmi", "Produce XMI instead of DOT", 
              "  (for UML tools)") do |x|
        self.xmi = x
      end
      opts.separator ""
      opts.separator "Models diagram options:"
      opts.on("-a", "--all", "Include all models", 
              "  (not only ActiveRecord::Base derived)") do |a|
        self.all = a
      end
      opts.on("--show-belongs_to", "Show belongs_to associations") do |s|
        self.show_belongs_to = s
      end
      opts.on("--hide-magic", "Hide magic field names") do |h|
        self.hide_magic = h
      end
      opts.on("--hide-types", "Hide attributes type") do |h|
        self.hide_types = h
      end
      opts.on("-j", "--join", "Concentrate edges") do |j|
        self.join = j
      end
      opts.on("-m", "--modules", "Include modules") do |m|
        self.modules = m
      end
      opts.on("-p", "--plugins-models", "Include plugins models") do |p|
        self.plugins_models = p
      end
      opts.on("-t", "--transitive", "Include transitive associations",
              "(through inheritance)") do |t|
        self.transitive = t
      end
      opts.separator ""
      opts.separator "Controllers diagram options:"
      opts.on("--hide-public", "Hide public methods") do |h|
        self.hide_public = h
      end
      opts.on("--hide-protected", "Hide protected methods") do |h|
        self.hide_protected = h
      end
      opts.on("--hide-private", "Hide private methods") do |h|
        self.hide_private = h
      end
      opts.separator ""
      opts.separator "Other options:"
      opts.on("-h", "--help", "Show this message") do
        STDOUT.print "#{opts}\n"
        exit
      end
      opts.on("--version", "Show version and copyright") do
        STDOUT.print "#{RailRoad::APP_HUMAN_NAME} version #{RailRoad::APP_VERSION.join('.')}\n\n" +
                     "#{RailRoad::COPYRIGHT}\nThis is free software; see the source " +
                     "for copying conditions.\n\n"
        exit
      end
      opts.separator ""
      opts.separator "Commands (you must supply one of these):"
      opts.on("-M", "--models", "Generate models diagram") do |c|
        if self.command != ''
          STDERR.print "Error: Can only generate one diagram type\n\n"
          exit 1
        else 
          self.command = 'models'        
        end
      end 
      opts.on("-C", "--controllers", "Generate controllers diagram") do |c|
        if self.command != ''
          STDERR.print "Error: Can only generate one diagram type\n\n"
          exit 1
        else 
          self.command = 'controllers'        
        end
      end
      # From Ana Nelson's patch
      opts.on("-A", "--aasm", "Generate \"acts as state machine\" diagram") do |c|
        if self.command == 'controllers'
          STDERR.print "Error: Can only generate one diagram type\n\n"
          exit 1
        else    
          self.command = 'aasm'
        end
      end        
      opts.separator ""
      opts.separator "For bug reporting and additional information, please see:"
      opts.separator "http://railroad.rubyforge.org/"
    end # do

    begin
      @opt_parser.parse!(args)
    rescue OptionParser::AmbiguousOption
      option_error "Ambiguous option"
    rescue OptionParser::InvalidOption
      option_error "Invalid option"
    rescue OptionParser::InvalidArgument
      option_error "Invalid argument"
    rescue OptionParser::MissingArgument
      option_error "Missing argument"
    end
  end  # parse

  private 

  def option_error(msg)
    STDERR.print "Error: #{msg}\n\n #{@opt_parser}\n"
    exit 1
  end

end  # class OptionsStruct
