class pxe::server inherits pxe::params
{
    include tftp::server, http::server, rsyslog

    #
    # FixMe: server url, currentlys using fqdn
    #

    $isolinux_r = 'isolinux'
    $pxe_r      = 'pxe'
    $iso_r      = 'pxe/iso'
    $mnt_r      = 'pxe/mnt'
    $ks_r       = 'pxe/ks'

    $pxe        = "$docroot/$pxe_r"
    $mnt        = "$docroot/$mnt_r"
    $iso        = "$docroot/$iso_r"
    $ks         = "$docroot/$ks_r"
    $isolinux   = "$tftpboot/$isolinux_r"

    package { 'syslinux-tftpboot': }
    ->
    file { ["$tftpboot/pxelinux.cfg", "$isolinux" ]:
        ensure => directory,
    }

    file { "$tftpboot/pxelinux.cfg/default":
        content => template('pxe/default.1.erb')
    }

    file { [ "$pxe", "$mnt", "$iso", "$ks" ]:
        ensure => 'directory'
    }

    pxe::setup_iso { $isos_name: }
}
