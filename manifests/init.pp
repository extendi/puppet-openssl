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
  }

  package { $openssl_pkgs:
    ensure => 'installed',
    install_options => "--force-yes"
  }

}