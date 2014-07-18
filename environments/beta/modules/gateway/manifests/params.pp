class gateway::params
{
    include ::params::network

    $fqdn = certnameto($::clientcert)
    $zone = $::params::network::domains_hash[$fqdn['domain']]
}
