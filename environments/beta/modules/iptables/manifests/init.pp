class iptables
{
    $file = '/etc/sysconfig/iptables'

    concat { $file: }

    iptables::fragment { ['00', '10', '20']: }

    if $fqdn == $servername {
        #
        # Ensures that if the agent is run on master, the master port is kept open
        #
        iptables::filter { '-A INPUT -p tcp -m state --state NEW -m tcp --dport 8140': }
    }

    exec { "/sbin/iptables-restore < $file":
        refreshonly => true,
        subscribe => File[$file],
    }
}
