class gateway::params
{
    include network

    $fqdn_parts = fromcertname($::clientcert)
    $zone       = $network::domains_byname[$fqdn_parts['domain']]
}
