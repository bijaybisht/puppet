define iptables::nat
{
    iptables::fragment { $name:
        order => 05,
    }
}
