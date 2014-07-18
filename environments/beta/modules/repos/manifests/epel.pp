class repos::epel
{
    package { 'epel-release':
        source => 'http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
        provider => rpm,
    }
}
