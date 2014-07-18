module Puppet::Parser::Functions
    newfunction(:certnameto, :type => :rvalue) do |args|
        puts args[0]
        array = args[0].split('.')
        {'alias' => array[0], 'domain' => array[1..-1].join('.')}
    end
end
