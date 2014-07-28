class http::server inherits http::params
{
    package { 'httpd' : }
    ->
    file { $docroot:
        ensure => directory,
    }
    ->
    service { 'httpd' : 
        ensure => running,
        enable => true,
    }

    iptables::filter { '-A INPUT -p tcp -m state --state NEW -m tcp --dport 80  -j ACCEPT': }
}
