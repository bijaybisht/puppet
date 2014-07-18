define pxe::setup_iso
{
    file { "${pxe::server::iso}/$name":
        source => "puppet:///modules/pxe/$name",
    }
    ->
    file { "${pxe::server::mnt}/$name":
        ensure => directory,
    }
    ->
    mount { "${pxe::server::mnt}/$name":
        device => "${pxe::server::iso}/$name",
        options => loop,
        fstype => iso9660,
        ensure => mounted,
        atboot => true,
    }
    ->
    file { "${pxe::server::isolinux}/$name":
        source => "${pxe::server::mnt}/$name/isolinux",
        recurse => true,
    }

    file { "${pxe::server::ks}/$name":
        content => template('pxe/ks.cfg.1.erb'),
    }
}
