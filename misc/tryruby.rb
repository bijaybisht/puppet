require 'yaml'

data = YAML.load_file('/etc/puppet/hieradata/beta/common.yaml')['params::network::domains']

puts YAML.dump(data)
