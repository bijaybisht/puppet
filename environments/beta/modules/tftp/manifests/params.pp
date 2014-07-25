class tftp::params
{
    include pxe::params
    $tftpboot = $pxe::params::tftpboot
}
