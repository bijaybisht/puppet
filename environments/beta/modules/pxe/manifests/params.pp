class pxe::params (
    $isos,
)
{
    include http::params
    include pxe::ro
    
    $tftpboot   = $pxe::ro::tftpboot
    $docroot    = $http::params::docroot

    $isos_name  = parseyaml(inline_template('<%= @isos.inject([]) {|a, e| a << e["name"]; a}.to_yaml %>'))
}
