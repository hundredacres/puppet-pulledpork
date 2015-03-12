class pulledpork::config (
  $version,
  $url,
  $prefix,
  $oinkcode,
  $rule_path,
  $local_rule_path,
  $sid_msg_map
) {

  file { "${prefix}/pulledpork-${version}/etc/pulledpork.conf":
    ensure  => file,
    mode    => '0600',
    content => template('pulledpork/pulledpork.conf.erb'),
  }

}
