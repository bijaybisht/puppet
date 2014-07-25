class yumserver 
{
    include yumserver::params
    include http::server

    $base = $yumserver::params::base

    package { 'createrepo': }
    ->
    file { $base:
        ensure => directory,
    }
    ->
    exec { "/usr/bin/createrepo $base": }
}
