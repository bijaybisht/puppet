class dns::client
{
    include dns::params
    $domain     = $dns::params::domain
    $nameserver = $dns::params::nameserver

    file { '/etc/resolv.conf':
        ensure => file,
        content => "search $domain\nnameserver ${nameserver['ip']}"
    }
}
