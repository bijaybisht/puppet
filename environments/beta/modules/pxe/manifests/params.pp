class pxe::params
{
    include ::params
    
    $docroot  = $::params::docroot
    $tftpboot = $::params::tftpboot

    $isolinux_r = 'isolinux'
    $pxe_r      = 'pxe'
    $iso_r      = 'pxe/iso'
    $mnt_r      = 'pxe/mnt'
    $ks_r       = 'pxe/ks'
}
