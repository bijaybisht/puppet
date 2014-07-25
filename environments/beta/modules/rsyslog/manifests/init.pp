class rsyslog
{
    package { 'rsyslog': }
    ->
    file { '/etc/rsyslog.conf':
        source => 'puppet:///modules/rsyslog/rsyslog.conf',
    }
    ~>
    service { 'rsyslog':
        ensure => running,
        enable => true,
    }

    iptables::filter { '-A INPUT -p udp -m state --state NEW -m udp --dport 514 -j ACCEPT': }
    iptables::filter { '-A INPUT -p tcp -m state --state NEW -m tcp --dport 514 -j ACCEPT': }
}
