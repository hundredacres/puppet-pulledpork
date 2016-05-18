class pulledpork::cron {
  cron{ 'pulled pork rule update':
    ensure  => present,
    command => "${pulledpork::prefix}/pulledpork-${pulledpork::version}/pulledpork.pl -c ${pulledpork::prefix}/pulledpork-${pulledpork::version}/etc/pulledpork.conf -l",
    hour    => 12,
    minute  => 30,
  }
}
