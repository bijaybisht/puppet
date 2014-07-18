class tftp::params
{
    include ::params
    $tftpboot = $::params::tftpboot
}
