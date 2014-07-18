puppet
======

Puppet infrastructure to manage environments.

## Install on master using 
```
sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install puppet-server
```
or the instructions http://docs.puppetlabs.com/guides/install_puppet/pre_install.html
* Checkout this repo to /etc/puppet
* Generate the ssl keys for the ca
```
puppet master --no-daemonize --verbose
```

## On the agent install using
```
sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install puppet
```
or the instructions http://docs.puppetlabs.com/guides/install_puppet/pre_install.html
* Checkout this repo to /etc/puppet
* Generate the ssl keys for the ca
```
puppet agent --no-daemonize --verbose --config <puppet.conf>
```

## Known Issues:
* On MAC OS use 
```
LANG=en_US.UTF-8  puppet agent --no-daemonize --verbose --config <puppet.conf>
```
