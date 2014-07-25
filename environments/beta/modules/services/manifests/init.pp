class services
{
    include services::params

    $services_namebyfqdn = $services::params::services_namebyfqdn

    define service {
        include $name
    }
    
    service { $services_namebyfqdn[$::clientcert]: }
}
