class squid::server
{
    package { 'squid': }
    ->
    service { 'squid':
        ensure => running,
        enable => true,
    }
}
