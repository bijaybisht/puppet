class dns::params
{
    include network

    $domains        = $network::domains
    $domains_byname = $network::domains_byname

    $fqdn_parts     = fromcertname($::clientcert)
    $alias          = $fqdn_parts['host']
    $domain         = $fqdn_parts['domain']

    $nameserver     = $domains_byname[$domain]['nameserver']

    $secret         = hiera('dns::params::secret', 'ONktz0u8IMbbGZ/1kCKKfA==')
    $forwarders     = hiera('dns::params::forwarders', ['8.8.8.8', '8.8.4.4'])
}
