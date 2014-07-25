class yumserver::params
{
    include services::params
    include http::params

    $base_r = 'yumrepo'
    $base = "${http::params::docroot}/$base_r"

    $fqdn_parts = fromcertname($::clientcert)
    $url = "http://${services::params::services_fqdnbydomainandname[$fqdn_parts["domain"]]['yumserver']}/$base_r"
}
