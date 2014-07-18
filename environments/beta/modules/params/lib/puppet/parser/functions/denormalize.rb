require 'yaml'

module Puppet::Parser::Functions
    newfunction(:denormalize, :type => :rvalue) do |args|

        def last(mask, ip)
            #
            # Because int is signed cannot do a ~ on it
            #
            inverse = [255,255,255,255].zip(mask.split('.').map{|x| x.to_i}).map{|x| (x[0]^x[1])}
            inverse.zip(ip.split('.').map{|x| x.to_i}).map{|x| (x[0]|x[1]).to_s}.join('.')
        end

        def reverse(ip)
                ip.split('.').reverse().drop(1).join('.')
        end

        def hostid(ip)
                ip.split('.')[-1]
        end

        def ip2i(ip)
            #
            # Fix Me: For ip > 127.*.*.*
            #
            ip.split('.').inject(0){|i,v| i = i * 256 + v.to_i; i}
        end

        def i2ip(i)
            (0..3).inject([]) {|ip, ind| ip << i%256; i/=256; ip}.reverse().join('.')
        end

        args[0].each { |zone|

        def last(mask, ip)
            #
            # Note: Because int is signed cannot do a ~ on it
            #
            inverse = [255,255,255,255].zip(mask.split('.').map{|x| x.to_i}).map{|x| (x[0]^x[1])}
            inverse.zip(ip.split('.').map{|x| x.to_i}).map{|x| (x[0]|x[1]).to_s}.join('.')
        end

        def ip2i(ip)
            #
            # Fix Me: For ip > 127.*.*.*
            #
            ip.split('.').inject(0){|i,v| i = i * 256 + v.to_i; i}
        end

        def i2ip(i)
            (0..3).inject([]) {|ip, ind| ip << i%256; i/=256; ip}.reverse().join('.')
        end

            reserved = {}
            ns = zone['nameserver'] ||= {}

            gw = zone['gateway']
            ds = zone['dhcpserver']
            px = zone['pxeserver']

            if not ns['fixed']
                ns['fixed'] = []
            end

            #
            # Fix Me: validations for optional element
            #
            
            if zone['subnet']
                zone['mask']    ||= zone['subnet'].split('.').map{|o| o=='0'?'0':'255'}.join('.')
                zone['reverse']   = zone['subnet'].split('.').delete_if{|o| o == '0'}.reverse().join('.')

                dgw = zone['subnet'].split('.').tap{|o| o[-1]='1'}.join('.')

                ns['ip'] ||= dgw
                reserved[ns['ip']] = true

                if ds
                    ds['ip'] ||= ns['ip']
                    reserved[ds['ip']] = true

                    if px
                        px['ip'] ||= ds['ip']
                        reserved[px['ip']] = true
                    else
                        zone['pxeserver'] = {}
                        zone['pxeserver']['ip'] = ds['ip']
                    end
                    if gw
                        gw['ip'] ||= ds['ip']
                        reserved[gw['ip']] = true
                    end
                end
    
                zone['gw'] = gw ? gw['ip'] : dgw

                ns['hostid']  = hostid(ns['ip'])
                ns['reverse'] = reverse(ns['ip'])

                if ds
                    if not ds['ip'] == ns['ip']
                        ns['fixed'] << {'name' => 'dhcp', 'ip' => ds['ip'], 'reverse' => reverse(ds['ip']), 'octet' => octet(ds['ip'])}
                    end
                    srange = [zone['subnet'], last(zone['mask'],zone['subnet'])]

                    ds['range'] ||= srange.map{|x| ip2i(x)}[1..-2]

                    range = ds['range'].split(' ').map{|x| ip2i(x)}
                    start = range[0]

                    fixed = ds['fixed']

                    fixed.each{ |host| if host['ip'] then reserved[host['ip']] = true end }
                    fixed.each{ |host| 
                        if not host['ip']
                            while reserved[i2ip(start)]
                                start +=1
                            end
                            host['ip'] = i2ip(start)
                            start +=1
                         end
                    }
                    #
                    # Fix Me: Assumes that the fixed/reserved will all be in
                    # the lower range.
                    #
                    ds['pool'] = [i2ip((range[0]+range[1])/2 + 1),i2ip(range[1])].join(' ')
                end
            end
        }
        YAML.dump(args[0])
    end
end
