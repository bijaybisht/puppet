define iptables::fragment (
    $order = 'use name'
){
    include iptables

    Concat::Fragment { target => $iptables::file }

    if $order == 'use name' {
        concat::fragment { "iptables_$name":
            order => $name,
            source => "puppet:///modules/iptables/iptables_$name",
        }
    }
    else {
        concat::fragment { $name:
            order => $order,
            content => "$name\n",
        }
    }
}
