class dev::tools
{
    if $operatingsystem  == 'Darwin' {
        exec { '/usr/local/bin/brew install git':
            creates => '/usr/local/bin/git'
        }
        exec { '/usr/local/bin/brew install vim':
            creates => '/usr/local/bin/vim'
        }
    }
    else {
        require repos::tools
        package { 'git': }
        package { 'vim-enhanced': }
        package { 'rpmdevtools': }
        package { 'apache-maven': }
    }
}
