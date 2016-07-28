# = Class: pulledpork::params
#
class pulledpork::params {
  $baseurl         = 'https://pulledpork.googlecode.com/files'
  $version         = '0.7.0'
  $prefix          = '/usr/local'
  $rule_path       = '/etc/snort/rules/snort.rules'
  $local_rule_path = '/etc/snort/rules/local.rules'
  $rules           = [
    'https://www.snort.org/reg-rules/|snortrules-snapshot.tar.gz|36cce5ab118e133b13bb9aa8b08c45abca23c6dc',
    'https://s3.amazonaws.com/snort-org/www/rules/community/|community-rules.tar.gz|Community',
  ]
  $sid_changelog   = '/var/log/pulledpork/sid_changes.log'
  $sid_msg_map     = '/etc/snort/sid-msg.map'
  $sid_msg_version = 2
  $snort           = true
  $black_list      = '/usr/local/etc/snort/rules/iplists/default.blacklist'
  $ipr_version     = '/usr/local/etc/snort/rules/iplists'
  $manage_cron     = true

  if $::osfamily == 'RedHat' {
    $pkgs = $::operatingsystemmajrelease ? {
      '5' => ['perl-LWP-Protocol-https','perl-Crypt-SSLeay','perl-Sys-Syslog','perl-Archive-Tar'],
      /6|7/ => ['perl-Crypt-SSLeay','perl-Archive-Tar'],
    }
  }
  else {
    fail ("OSFamily ${::osfamily} not supported by module")
  }
}
