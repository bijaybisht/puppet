module Puppet::Parser::Functions
    newfunction(:subpaths, :type => :rvalue) do |args|
        path = args[0]
        path.split('/').inject([]) { |h, x| h << (h.size == 0  ? x : h[-1] + '/' + x) }.delete_if { |x| x == '' }
    end
end
