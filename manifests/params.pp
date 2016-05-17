class pulledpork::params {
  $baseurl         = 'https://pulledpork.googlecode.com/files'
  $version         = '0.7.0'
  $prefix          = '/usr/local'
  $rule_path       = '/etc/snort/rules/snort.rules'
  $local_rule_path = '/etc/snort/rules/local.rules'
  $sid_changelog   = '/var/log/pulledpork/sid_changes.log'
  $sid_msg_map     = '/etc/snort/sid-msg.map'
  $sid_msg_version = 2
  $snort           = true
  $black_list      = '/usr/local/etc/snort/rules/iplists/default.blacklist'
  $ipr_version     = '/usr/local/etc/snort/rules/iplists'

  if $::osfamily == 'RedHat' {
    $pkgs = [
      'perl-LWP-Protocol-https',
      'perl-Crypt-SSLeay',
      'perl-Sys-Syslog',
      'perl-Archive-Tar'
    ]
  }
  else {
    fail ("OSFamily ${::osfamily} not supported by module")
  }
}
