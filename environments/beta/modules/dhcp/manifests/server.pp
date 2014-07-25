class dhcp::server
{
    include dhcp::params

    $dhcpserver = $dhcp::params::dhcpserver
    $zone       = $dhcp::params::zone
    $secret     = $dhcp::params::secret

    #
    # Note: It's possible that this interface is actualled dhcp'ed from another dhcp. Ignore for now.
    #
    interface::config { $dhcpserver['interface']:
        ip => $dhcpserver['ip']
    }
    ~> service { 'network':
        ensure => running,
        enable => true,
    }

    package { 'dhcp': }
    ->
    file { '/etc/dhcp/dhcpd.conf':
        content => template('dhcp/dhcpd.conf.1.erb'),
    }

    File<| tag == 'dhcp::server' |>
    ~>
    service { 'dhcpd':
        ensure => running,
        enable => true,
    }
    
    iptables::filter { '-A INPUT -p udp -m state --state NEW -m udp --dport 67 -j ACCEPT': }
}
