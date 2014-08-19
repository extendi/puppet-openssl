class openssl {

  apt::source { 'puppetlabs':
    location   => 'ftp://puppet.pulsarplatform.com/debs',
    repos      => './',
  }
  
}