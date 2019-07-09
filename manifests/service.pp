# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include nessus::service
class nessus::service {
  if $nessus::service_manage == true {
    service { $nessus::service_name:
      ensure     => $nessus::service_ensure,
      enable     => $nessus::service_enable,
      provider   => $nessus::service_provider,
      hasstatus  => $nessus::service_hasstatus,
      hasrestart => $nessus::service_hasrestart,
    }
  }
}
