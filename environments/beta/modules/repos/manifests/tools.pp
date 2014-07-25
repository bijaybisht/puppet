class repos::tools
{
    include http::params

    $base_r = 'tools'
    $base   = "${http::params::docroot}/$base_r"
    $url    = "http://$repos::tools::fqdn/$base_r"

    if $::clientcert == $repos::tools::fqdn {
        include http::server

        repos::create { $base: }
        ->
        yumrepo { 'tools':
            baseurl => "file://$base",
            gpgcheck => 0,
        }
        ->
        exec { "/usr/bin/yum clean metadata": }
    }
    else {
        notice("Ensure node repos::tools::fqdn [${repos::tools::fqdn}] is running repos::tools and serving $url")

        yumrepo { 'tools':
            baseurl => $url,
            gpgcheck => 0,
        }
        ->
        exec { "/usr/bin/yum clean metadata": }
    }
}
