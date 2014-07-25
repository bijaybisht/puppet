class repos::local
{
    include yumserver::params

    yumrepo { 'local':
        baseurl => $yumserver::params::url,
        gpgcheck => False,
    }
}
