class openssl {

  file {"/etc/apt/apt.conf.d/unauthorized_source":
    content => 'APT::Get::AllowUnauthenticated "true";',
    notify => Apt::Source['puppetlabs']
  }

  class { 'apt':
    always_apt_update    => false,
  }

  apt::source { 'puppetlabs':
    location   => 'http://puppet.pulsarplatform.com/debs',
    release => 'trusty',
    repos      => 'main',
    include_src => false,
  }

  $openssl_pkgs = ["openssl", "libssl1.0.0", "libssl1.0.0-dbg", "libssl-dev", "libssl-doc"]

  apt::hold { $openssl_pkgs:
    version => '1.0.1f-1ubuntu2.6sslv2',
  }

  package { $openssl_pkgs:
    ensure => '1.0.1f-1ubuntu2.6sslv2',
    require => Class['apt']
  }

}