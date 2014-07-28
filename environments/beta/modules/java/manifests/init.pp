class java 
{
    #package { ['java-1.7.0-openjdk', 'java-1.7.0-openjdk-devel']: }

    #exec { '/usr/bin/wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.rpm"': }

    #exec { '/usr/bin/wget wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u60-b19/jdk-7u60-linux-x64.rpm"': }
    package {
        source => "https://bitbucket.org/bijaybisht/binary/src/e0cc01390c4cb23b4395075a7f847493e4f0e059/rpms/jdk-7u60-linux-x64.rpm?at=master",
        provider => rpm
    }
}
