class openssl {

  apt::source { 'puppetlabs':
    location   => 'http://puppet.pulsarplatform.com/debs',
    release => 'trusty',
    repos      => 'main',
    include_src => false,
  }

}