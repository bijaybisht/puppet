class dns::params (
    $secret             = "ONktz0u8IMbbGZ/1kCKKfA==",
    $forwarders         = ['8.8.8.8', '8.8.4.4'],
){
    include network

    $domains        = $network::domains
    $domains_byname = $network::domains_byname

    $fqdn_parts     = fromcertname($::clientcert)
    $alias          = $fqdn_parts['host']
    $domain         = $fqdn_parts['domain']

    $nameserver     = $domains_byname[$domain]['nameserver']
}
