class gateway 
{
    include gateway::params
    $zone = $gateway::params::zone

    gateway::privatedns { $zone['gateway']['interface']['ext']: }
    exec { '/bin/echo 1 > /proc/sys/net/ipv4/ip_forward': }
    
    iptables::filter { "-A FORWARD -i ${zone['gateway']['interface']['int']} -j ACCEPT": }
    iptables::nat { "-A POSTROUTING -o ${zone['gateway']['interface']['ext']} -j MASQUERADE": }
}
