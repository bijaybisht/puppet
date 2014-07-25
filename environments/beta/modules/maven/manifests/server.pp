class maven::server 
{
    include java

    package { 'artifactory':
        source => 'http://dl.bintray.com/jfrog/artifactory-rpms/artifactory-3.3.0.rpm',
        provider => rpm,
    }
    ->
    service { 'artifactory':
        ensure => running,
        enable => true,
    }

    iptables::filter { '-A INPUT -p tcp -m state --state NEW -m tcp --dport 8081 -j ACCEPT': }
}
