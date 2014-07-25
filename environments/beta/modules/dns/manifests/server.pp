class dns::server
{
    include dns::params
    include dns::client

    $forwarders     = $dns::params::forwarders
    $secret         = $dns::params::secret
    $alias          = $dns::params::alias
    $domain         = $dns::params::domain
    $domains        = $dns::params::domains
    $domains_byname = $dns::params::domains_byname


    package { 'bind': }
    ->
    File <| tag == 'dns::server' |>
    ~>
    service { 'named':
        ensure => running,
        enable => true,
    }

    file { '/etc/named.conf':
        content => template('dns/named.conf.1.erb'),
    }

    file { '/var/named/data/forward.db':
        content => template('dns/forward.db.1.erb'),
    }

    file { '/var/named/data/reverse.db':
        content => template('dns/reverse.db.1.erb'),
    }

    iptables::filter { '-A INPUT -p udp -m state --state NEW -m udp --dport 53 -j ACCEPT': }
}
