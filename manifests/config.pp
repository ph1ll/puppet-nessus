# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include nessus::config
class nessus::config {
  if $nessus::activation_key {
    exec { 'activate nessus':
      unless  => "${nessus::config_nessuscli_path} fetch --check | /bin/grep -q \"Updates are configured properly\"",
      command => "${nessus::config_nessuscli_path} fetch --register ${nessus::activation_key}",
      notify  => Service[$nessus::service_name],
    }
  }

  if $nessus::server_certificate {
    file { $nessus::config_servercert_path:
      ensure  => file,
      content => $nessus::server_certificate,
      notify  => Service[$nessus::service_name],
    }
  }

  if $nessus::server_certificate_key {
    file { $nessus::config_serverkey_path:
      ensure  => file,
      content => $nessus::server_certificate_key,
      notify  => Service[$nessus::service_name],
    }
  }

  if $nessus::server_certificate_chain {
    file { $nessus::config_serverchain_path:
      ensure  => file,
      content => $nessus::server_certificate_chain,
      notify  => Service[$nessus::service_name],
    }
  }
}
