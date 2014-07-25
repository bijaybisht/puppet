require 'yaml'

module Puppet::Parser::Functions
    newfunction(:putyaml) do |args|
        puts YAML.dump(args[0])
    end
end
