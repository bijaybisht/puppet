define nfs::export
{
    include nfs::server

    concat::fragment { $name:
        target => $nfs::server::file,
        content => inline_template('<%= @name %>    *(rw,sync,no_root_squash,no_subtree_check)')
    }
}
