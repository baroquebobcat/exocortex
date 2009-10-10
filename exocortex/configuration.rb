require 'yaml'
require 'singleton'

module ExoCortex
  class Configuration
    include Singleton
    
    def initialize(options = {})
      begin
      @conf = YAML.load_file('config.yaml')
      rescue Exception => e
        @conf = {}
        File.open( 'config.yaml', 'w' ) do |out|
          YAML.dump(@conf, out)
        end
      end
    end  
    
    def hash
      @conf
    end
    
    def dump
      File.open( 'config.yaml', 'w' ) do |out|
        YAML.dump(@conf, out)
      end
    end
    
    def update_value(category, key, value)
      @conf[category][key] = value
    end
    
  end
end