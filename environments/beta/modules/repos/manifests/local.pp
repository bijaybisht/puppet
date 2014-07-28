class repos::tools
{
    include yumserver::params
    require services
    if $yumserver::params::url {
        #
        # This check is for when the service is not up
        #
        yumrepo { 'local':
            baseurl => $yumserver::params::url,
            gpgcheck => False,
        }
    }
}
