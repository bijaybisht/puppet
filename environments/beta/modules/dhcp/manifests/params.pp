class dhcp::params
{
    include ::params::network

    $secret             = $::params::network::secret

    $fqdn               = certnameto($::clientcert)
    $zone               = $::params::network::domains_hash[$fqdn['domain']]
    $dhcpserver         = $zone['dhcpserver']
}
