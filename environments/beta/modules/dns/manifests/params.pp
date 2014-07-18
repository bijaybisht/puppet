class dns::params
{
    include ::params::network

    $secret         = $::params::network::secret
    $forwarders     = $::params::network::forwarders
    $domains        = $::params::network::domains
    $domains_hash   = $::params::network::domains_hash

    notice($clientcert)

    $fqdn           = certnameto($::clientcert)
    $alias          = $fqdn['alias']
    $domain         = $fqdn['domain']

    $nameserver     = $domains_hash[$domain]['nameserver']
}
