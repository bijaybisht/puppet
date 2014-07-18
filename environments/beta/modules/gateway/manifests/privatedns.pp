define gateway::privatedns
{
    package { 'dhclient': }
    ->
    file { '/etc/dhcp/dhclient.conf':
        content => template('gateway/dhclient.conf.1.erb'),
    }
}
