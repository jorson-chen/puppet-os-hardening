# == Class: os_hardening
#
# Pulls in all manifests for os_hardening.
#
# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
#
class os_hardening(
  $allow_core_dumps         = false,

  $extra_user_paths         = [],
  $umask                    = "027",
  $password_max_age         = 60,
  $password_min_age         = 7,
  $login_retries            = 5,
  $login_timeout            = 60,
  $chfn_restrict            = "",
  $allow_login_without_home = false,

  $allow_change_user        = false,

  $enable_module_loading    = true,
  $cpu_vendor               = "intel",
  $desktop_enabled          = false,
  $passwdqc_enabled         = true,
  $auth_retries             = 5,
  $auth_lockout_time        = 600,
  $passwdqc_options         = 'min=disabled,disabled,16,12,8',

  $root_ttys                = ["console","tty1","tty2","tty3","tty4","tty5","tty6"],

  $enable_module_loading    = true,
  $cpu_vendor               = "intel",
  $enable_ipv4_forwarding   = false,
  $enable_ipv6              = false,
  $enable_ipv6_forwarding   = false,
  $arp_restricted           = true,
  $enable_sysrq             = false,
  $enable_core_dump         = false,
) {
  class {'os_hardening::limits':
    allow_core_dumps         => $allow_core_dumps,
  }
  class {'os_hardening::login_defs':
    extra_user_paths         => $extra_user_paths,
    umask                    => $umask,
    password_max_age         => $password_max_age,
    password_min_age         => $password_min_age,
    login_retries            => $login_retries,
    login_timeout            => $login_timeout,
    chfn_restrict            => $chfn_restrict,
    allow_login_without_home => $allow_login_without_home,
  }
  class {'os_hardening::minimize_access':
    allow_change_user        => $allow_change_user,
  }
  class {'os_hardening::pam':
    enable_module_loading    => $enable_module_loading,
    cpu_vendor               => $cpu_vendor,
    desktop_enabled          => $desktop_enabled,
    passwdqc_enabled         => $passwdqc_enabled,
    auth_retries             => $auth_retries,
    auth_lockout_time        => $auth_lockout_time,
    passwdqc_options         => $passwdqc_options,
  }
  class {'os_hardening::profile':
    allow_core_dumps         => $allow_core_dumps,
  }
  class {'os_hardening::securetty':
    root_ttys                => $root_ttys,
  }
  class {'os_hardening::sysctl':
    enable_module_loading    => $enable_module_loading,
    cpu_vendor               => $cpu_vendor,
    desktop_enabled          => $desktop_enabled,
    enable_ipv4_forwarding   => $enable_ipv4_forwarding,
    enable_ipv6              => $enable_ipv6,
    enable_ipv6_forwarding   => $enable_ipv6_forwarding,
    arp_restricted           => $arp_restricted,
    enable_sysrq             => $enable_sysrq,
    enable_core_dump         => $enable_core_dump,
  }
}