class pulledpork::config (
  $oinkcode,
  $rule_path,
  $local_rule_path,
  $rules,
  $sid_changelog,
  $sid_msg_map,
  $sid_msg_version,
  $snort,
  $black_list,
  $ipr_version
) {

  file { "${pulledpork::prefix}/pulledpork-${pulledpork::version}/etc/pulledpork.conf":
    ensure  => file,
    mode    => '0600',
    content => template('pulledpork/pulledpork.conf.erb'),
  }

}
