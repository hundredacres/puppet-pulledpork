class pulledpork::install (
  $version,
  $url,
  $prefix
) {

  package { $pulledpork::params::pkgs:
    ensure => present,
  }

  wget::fetch { 'download-pulledpork':
    source      => $url,
    destination => "/usr/src/pulledpork-${version}.tar.gz",
    timeout     => 0,
    verbose     => false,
  }

  file { '/var/log/pulledpork':
    ensure => directory,
  }

  exec { 'install-pulledpork':
    cwd     => $prefix,
    command => "/bin/tar zxf /usr/src/pulledpork-${version}.tar.gz",
    creates => "${prefix}/pulledpork-${version}",
    require => Wget::Fetch['download-pulledpork'],
  }
}
