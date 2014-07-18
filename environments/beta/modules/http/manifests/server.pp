class http::server
{
    package { 'httpd' : }
    ->
    service { 'httpd' : 
        ensure => running,
        enable => true,
    }

    iptables::filter { '-A INPUT -p tcp -m state --state NEW -m tcp --dport 80  -j ACCEPT': }
    iptables::filter { '-A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT': }
}
