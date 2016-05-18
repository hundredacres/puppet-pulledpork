class pulledpork::install (
  $url,
) {

  package { $pulledpork::params::pkgs:
    ensure => present,
  }

  wget::fetch { 'download-pulledpork':
    source      => $url,
    destination => "/usr/src/pulledpork-${pulledpork::version}.tar.gz",
    timeout     => 0,
    verbose     => false,
  }

  file { '/var/log/pulledpork':
    ensure => directory,
  }

  exec { 'install-pulledpork':
    cwd     => $pulledpork::prefix,
    command => "/bin/tar zxf /usr/src/pulledpork-${pulledpork::version}.tar.gz",
    creates => "${pulledpork::prefix}/pulledpork-${pulledpork::version}",
    require => Wget::Fetch['download-pulledpork'],
  }
}
