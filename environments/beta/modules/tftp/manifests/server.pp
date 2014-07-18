class tftp::server inherits tftp::params
{
    package { 'tftp-server': }
    ->
    file { '/etc/xinetd.d/tftp':
        content => template('tftp/tftp.1.erb'),
    }
    ~>
    service { 'xinetd':
        ensure => running,
        enable => true,
    }

    iptables::filter { '-A INPUT -p udp -m state --state NEW -m udp --dport 69 -j ACCEPT': }
}
