# nessus

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with nessus](#setup)
    * [What nessus affects](#what-nessus-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with nessus](#beginning-with-nessus)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

The nessus module installs, configures, and manages the Nessus vulnerability scanner across a range of operating systems and distributions.

## Setup

### Beginning with nessus

`include nessus` is enough to get you up and running. To pass in your activation key:

```
class { 'nessus':
   activation_key => 'XXXX-XXXX-XXXX-XXXX',
}
```

## Usage

All parameters for the nessus module are contained within the main `nessus` class, so for any function of the module, set the options you want. See the common usages below for examples.

### Install and enable Nessus

```
include nessus
```

### Set an activation key

```
class { 'nessus':
   activation_key => 'XXXX-XXXX-XXXX-XXXX',
}
```

### Set custom TLS certificate

```
$cert = "-----BEGIN CERTIFICATE-----
  MIIGkjCCBHqgAwIBAgITXQAABw13wg1EWAmpzQAAAAAHDTANBgkqhkiG9w0BAQsF[...]
  -----END CERTIFICATE-----"
$key = "-----BEGIN PRIVATE KEY-----
  MIIGkjCCBHqgAwIBAgITXQAABw13wg1EWAmpzQAAAAAHDTANBgkqhkiG9w0BAQsF[...]
  -----END PRIVATE KEY-----"
$chain = "-----BEGIN CERTIFICATE-----
  MIIGkjCCBHqgAwIBAgITXQAABw13wg1EWAmpzQAAAAAHDTANBgkqhkiG9w0BAQsF[...]
  -----END CERTIFICATE-----"

class { 'nessus':
   server_certificate       => $cert,
   server_certificate_key   => $key,
   server_certificate_chain => $chain,
}
```

### Using Hiera

```
---
nessus:activation_key: 'XXXX-XXXX-XXXX-XXXX'
nessus::server_certificate: |
  -----BEGIN CERTIFICATE-----
  MIIGkjCCBHqgAwIBAgITXQAABw13wg1EWAmpzQAAAAAHDTANBgkqhkiG9w0BAQsF
  [...]
  HT61WMrx
  -----END CERTIFICATE-----
nessus::server_certificate_key: >
  ENC[PKCS7,[M[IIOPQYJKoZIhvcNAQcDoIIOLjCCDioCAQAxggEhMIIBHQIBADAFMAACAQEw
  [...]
  gDkAU]Q==]
```

## Reference

This section is deprecated. Instead, add reference information to your code as Puppet Strings comments, and then use Strings to generate a REFERENCE.md in your module. For details on how to add code comments and generate documentation with Strings, see the Puppet Strings [documentation](https://puppet.com/docs/puppet/latest/puppet_strings.html) and [style guide](https://puppet.com/docs/puppet/latest/puppet_strings_style.html)

If you aren't ready to use Strings yet, manually create a REFERENCE.md in the root of your module directory and list out each of your module's classes, defined types, facts, functions, Puppet tasks, task plans, and resource types and providers, along with the parameters for each.

For each element (class, defined type, function, and so on), list:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

For example:

```
### `pet::cat`

#### Parameters

##### `meow`

Enables vocalization in your cat. Valid options: 'string'.

Default: 'medium-loud'.
```

## Limitations

For an extensive list of supported operating systems, see [metadata.json](https://github.com/ph1ll/puppet-nessus/blob/master/metadata.json)

## Development

In the Development section, tell other users the ground rules for contributing to your project and how they should submit their work.
