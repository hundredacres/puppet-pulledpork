class pulledpork::config (
  $version,
  $prefix,
  $oinkcode,
  $rule_path,
  $local_rule_path,
  $sid_changelog,
  $sid_msg_map,
  $sid_msg_version,
  $black_list,
  $ipr_version
) {

  file { "${prefix}/pulledpork-${version}/etc/pulledpork.conf":
    ensure  => file,
    mode    => '0600',
    content => template('pulledpork/pulledpork.conf.erb'),
  }

}
