define interface::config (
    $ip,
) {
    augeas { $name:
        context => "/files/etc/sysconfig/network-scripts/ifcfg-$name",
        changes => [
            "set IPADDR $ip",
            "set BOOTPROTO none",
        ]
    }
}
