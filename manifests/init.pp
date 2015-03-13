class pulledpork (
  $version         = $pulledpork::params::version,
  $baseurl         = $pulledpork::params::baseurl, 
  $prefix          = $pulledpork::params::prefix,
  $rule_path       = $pulledpork::params::rule_path,
  $local_rule_path = $pulledpork::params::local_rule_path,
  $sid_msg_map     = $pulledpork::params::sid_msg_map,
  $oinkcode,
) inherits pulledpork::params {

  include wget

  Class['pulledpork::install'] -> Class['pulledpork::config']

  class { 'pulledpork::install':
    version => $version,
    url     => "${baseurl}/pulledpork-${version}.tar.gz",
    prefix  => $prefix,
  }

  class { 'pulledpork::config':
    version         => $version,
    prefix          => $prefix,
    oinkcode        => $oinkcode,
    rule_path       => $rule_path,
    local_rule_path => $local_rule_path,
    sid_msg_map     => $sid_msg_map,
  }

}
