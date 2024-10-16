# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include nessus
class nessus (
  Optional[String] $activation_key,
  Optional[String] $server_certificate,
  Optional[String] $server_certificate_key,
  Optional[String] $server_certificate_chain,
  String $package_ensure,
  Boolean $package_manage,
  String $package_name,
  String $package_provider,
  String $package_source,
  Boolean $package_source_file_manage,
  String $package_source_file_source,
  String $config_nessuscli_path,
  Boolean $service_enable,
  Enum['running', 'stopped'] $service_ensure,
  Boolean $service_manage,
  String $service_name,
  Optional[String] $service_provider,
  Boolean $service_hasstatus,
  Boolean $service_hasrestart,
  String $config_servercert_path,
  String $config_serverchain_path,
  String $config_serverkey_path,
) {
  contain nessus::install
  contain nessus::config
  contain nessus::service

  Class['nessus::install']
  -> Class['nessus::config']
  ~> Class['nessus::service']
}
