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

  directory { '/var/log/pulledpork':
    ensure => directory,
  }

  exec { "tar zxvf /usr/src/pulledpork-${version}.tar.gz"
    cwd     => $prefix,
    creates => "${prefix}/pulledpork-${version}",
    require => Wget::Fetch[$url],
  }
}
