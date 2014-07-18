class dns::client inherits dns::params
{
    file { '/etc/resolv.conf':
        ensure => file,
        content => "search $domain\nnameserver ${nameserver['ip']}"
    }
}
