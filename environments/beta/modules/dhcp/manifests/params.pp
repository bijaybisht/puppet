class dhcp::params
{
    include network
    include dns::params

    $secret             = $dns::params::secret

    $fqdn_parts         = fromcertname($::clientcert)
    $zone               = $network::domains_byname[$fqdn_parts['domain']]
    $dhcpserver         = $zone['dhcpserver']
}
