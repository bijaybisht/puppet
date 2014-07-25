class yumserver 
{
    include yumserver::params
    include http::server

    $base = $yumserver::params::base

    repos::create { $base: }
}
