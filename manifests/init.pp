class openssl {

  apt::source { 'puppetlabs':
    location   => 'http://puppet.pulsarplatform.com/debs',
    release => 'trusty',
    repos      => 'main',
    include_src => false,
  }

  $openssl_pkgs = ["openssl", "libssl1.0.0", "libssl1.0.0-dbg", "libssl-dev", "libssl-doc", ]

  apt::hold { $openssl_pkgs:
    version => '1.0.1f-1ubuntu2.6',
    notify => Package['install open ssl']
  }

  package { "install open ssl":
    name => "openssl"
    ensure => 'installed'
  }

  package { "install open ssl1":
    name => "libssl1.0.0"
    ensure => 'installed'
  }

  package { "install open ssl dbg":
    name => "libssl1.0.0-dbg"
    ensure => 'installed'
  }

  package { "install open ssl dev":
    name => "libssl-dev"
    ensure => 'installed'
  }
  package { "install open ssl doc":
    name => "libssl-doc"
    ensure => 'installed'
  }

  Package['install open ssl'] -> Package['install open ssl1'] -> Package['install open ssl dbg'] -> Package['install open ssl dev'] -> Package['install open ssl doc']

}