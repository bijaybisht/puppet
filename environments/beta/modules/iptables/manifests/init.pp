class iptables
{
    $file = '/etc/sysconfig/iptables'

    concat { $file: }

    iptables::fragment { ['00', '10', '20']: }

    exec {  "/sbin/iptables-restore < $file":
        refreshonly => true,
        subscribe => File[$file],
    }
}
