# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include nessus
class nessus (
  Optional[String] $activation_key,
  String $package_ensure,
  Boolean $package_manage,
  String $package_name,
  String $package_provider,
  String $package_source,
  Boolean $package_source_file_manage,
  String $package_source_file_source,
) {
  contain nessus::install
  contain nessus::config
  contain nessus::service

  Class['nessus::install']
  -> Class['nessus::config']
  ~> Class['nessus::service']
}
