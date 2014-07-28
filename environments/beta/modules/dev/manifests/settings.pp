class dev::settings (
    $home = $::home
){
    require dev::tools

    concat { "$home/.vimrc": }

    define vimrc {
        concat::fragment { $name:
            target => "$home/.vimrc",
            content => "$name\n"
        }
    }
    
    vimrc { "set tabstop=4 shiftwidth=4 expandtab": }
    vimrc { "set mouse=a": }

    file { ["$home/.vim", "$home/.vim/autoload", "$home/.vim/bundle"]:
        ensure => directory,
    }
    ->
    exec { "pathogen":
        command => "/usr/bin/curl -LSso $home/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim",
        creates => "$home/.vim/autoload/pathogen.vim",
    }
    ->
    vimrc { "execute pathogen#infect()": }
    ->
    exec { "nerdtree":
        command => "/usr/bin/git clone https://github.com/scrooloose/nerdtree.git $home/.vim/bundle/nerdtree",
        creates => "$home/.vim/bundle/nerdtree",
    }
    ->
    vimrc { "let g:NERDTreeDirArrows=0": }

    file { "$home/.ssh" :
        ensure => directory,
        mode => 700,
    }

    file { "$home/.ssh/authorized_keys":
        content => "ssh-dss AAAAB3NzaC1kc3MAAACBAKXj7KcuapVt/lTVhsnC3dQh6AG5m/5EtJF08pPpvNIyy5BWn+OdOmZLoqKJvaYAFVRoikTU3t2oUHgT4WPbtF7fK7QK94U75CswqNRQmpT1Kvf497PDag3Ez3xgx3X/Z7aDBtALgheEeuQ4uXWNiyi9POwPYSqcxRsI6zp9SWlDAAAAFQDhXndeoxV67fr7Nw62NipHu0hxIwAAAIEAg8Y2K8pL4YiC9ZqsI9/ObYxjKrlX6CvSn8wmqW7vfYvUgpfCfThrjd2ZapomaPMAtbFC1yVqEkZ4uEeVS/bfl9y8+y8WeB1Nk7NqTTH2ZiNqkoGK0qI1iyeUmsXBtvH5qzKADPEWdnfFgBvAMp7nx0nV1LHWGgZq89cOKnhRivwAAACAK3odnTWzAEPuvf669JsvALzOVzL/Powd4a12eBQzWQzOcL7oi6fMcHa/aPS+GVtSZPg8P1p8ravqo+my4DE21cdE2Gqw+21aiSxseXPC2NNrEKUe5MbOpM9L9YMwPeTQBdtKi4tH4uoqGUVL0Hg9hLO1hOouQbpfTf+24bQTHCo= bijaysingh@Bijays-MacBook-Pro-2.local",
        mode => 600,
    }
}
