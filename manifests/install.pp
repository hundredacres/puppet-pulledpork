class pulledpork::install (
  $version,
  $url,
  $prefix
) {

  wget::fetch { $url:
    destination => '/usr/src',
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
    require => Wget::Fetch[$url],
  }
}
