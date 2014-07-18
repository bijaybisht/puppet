class pxe::server (
    $isos,
) inherits pxe::params
{
    include tftp::server, http::server, rsyslog

    $isos_name = parseyaml(inline_template('<%= @isos.inject([]) {|a, e| a << e["name"]; a}.to_yaml %>'))

    $isolinux = "$tftpboot/$isolinux_r"

    $mnt    = "$docroot/$mnt_r"
    $iso    = "$docroot/$iso_r"
    $ks     = "$docroot/$ks_r"
    $pxe    = "$docroot/$pxe_r"

    package { 'syslinux-tftpboot': }
    ->
    file { ["$tftpboot/pxelinux.cfg", $isolinux]:
        ensure => directory,
    }

    file { "$tftpboot/pxelinux.cfg/default":
        content => template('pxe/default.1.erb')
    }

    file { [$pxe, $ks, $iso, $mnt]:
        ensure => 'directory'
    }

    pxe::setup_iso { $isos_name: }
}
