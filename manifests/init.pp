class pulledpork (
  $version         = $pulledpork::params::version,
  $baseurl         = $pulledpork::params::baseurl,
  $prefix          = $pulledpork::params::prefix,
  $rule_path       = $pulledpork::params::rule_path,
  $local_rule_path = $pulledpork::params::local_rule_path,
  $rules           = $pulledpork::params::rules,
  $sid_changelog   = $pulledpork::params::sid_changelog,
  $sid_msg_map     = $pulledpork::params::sid_msg_map,
  $sid_msg_version = $pulledpork::params::sid_msg_version,
  $snort           = $pulledpork::params::snort,
  $black_list      = $pulledpork::params::black_list,
  $ipr_version     = $pulledpork::params::ipr_version,
  $manage_cron     = $pulledpork::params::manage_cron,
  $oinkcode,
) inherits pulledpork::params {

  if $pulledpork::manage_cron {
    class { '::pulledpork::cron':}
  }

  class { 'pulledpork::install':
    url     => "${baseurl}/pulledpork-${version}.tar.gz",
  } ->

  class { 'pulledpork::config':
    oinkcode        => $oinkcode,
    rule_path       => $rule_path,
    local_rule_path => $local_rule_path,
    rules           => $rules,
    sid_changelog   => $sid_changelog,
    sid_msg_map     => $sid_msg_map,
    sid_msg_version => $sid_msg_version,
    snort           => $snort,
    black_list      => $black_list,
    ipr_version     => $ipr_version,
  } ->
  Class['::pulledpork']
}
