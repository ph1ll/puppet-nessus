# @summary
#   This class handles Nessus packages
#
# @api private
#
class nessus::install {
  if $nessus::package_source_file_manage {
    file { $nessus::package_source:
      ensure => file,
      source => $nessus::package_source_file_source,
    }
  }

  if $nessus::package_manage {
    package { $nessus::package_name:
      ensure   => $nessus::package_ensure,
      provider => $nessus::package_provider,
      source   => $nessus::package_source,
    }
  }
}
