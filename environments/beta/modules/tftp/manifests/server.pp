class tftp::server
{
    include tftp::params

    $tftpboot = $tftp::params::tftpboot

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
