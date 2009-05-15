module RailRoad
  module VERSION #:nodoc:
    if File.exist?('../VERSION.yml')
      config = YAML.load(File.read('../VERSION.yml'))
      MAJOR = config[:major]
      MINOR = config[:minor]
      PATCH = config[:patch]
    else
      MAJOR = MINOR = PATCH = 0
    end
    STRING = [MAJOR, MINOR, PATCH].join('.')
  end
end
