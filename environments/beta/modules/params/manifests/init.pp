class params (
    $docroot = '/var/www/html'
)
{
    include pxe::ro
    $tftpboot = $pxe::ro::tftpboot
}
