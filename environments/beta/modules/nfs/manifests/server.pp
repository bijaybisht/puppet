class nfs::server
{
    $file = '/etc/exports'

    package { ['nfs-utils', 'nfs-utils-lib']: }
    ->
    concat { $file: }
    ~>
    service { ['rpcbind', 'nfs']: 
        ensure => running,
        enable => true,
        subscribe => File[$file]
    }

    file { ['/nfs', '/nfs/export']:
        ensure => directory,
    } 
    ->
    nfs::export { '/nfs/export': }

    exec { '/usr/sbin/exportfs -ra':
        refreshonly => true,
        subscribe => File[$file]
    }
}
