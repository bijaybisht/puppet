#!/bin/bash

#
# Usage: curl https://raw.githubusercontent.com/bijaybisht/puppet/master/puppet-agent-install.sh | bash
#

install() {
    rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
    yum install -y puppet
    yum install -y wget
    yum install -y git
    yum install -y ntp
    ntpdate pool.ntp.org
    rm /etc/puppet/puppet.conf
    wget https://raw.githubusercontent.com/bijaybisht/puppet/master/puppet.conf -O /etc/puppet/puppet.conf
    
    echo "puppet agent --no-daemonize --verbose --certname $(hostname)"
}

test -f /etc/redhat-release && install
