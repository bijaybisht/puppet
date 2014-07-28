define repos::create 
{
    package { 'createrepo': }
    ->
    file { $name:
        ensure => directory,
    }
    ->
    exec { "/usr/bin/createrepo $name": }
}
