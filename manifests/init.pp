class openssl {

  apt::source { 'puppetlabs':
    location   => 'ftp://puppet.pulsarplatform.com/debs',
    release => 'trusty',
    repos      => 'main',
    include_src => false,
  }

}