class varnish::server
{
    require repos::epel

    package { 'varnish': }
    ->
    service { 'varnish':
        ensure => running,
        enable => true,
    }
}
