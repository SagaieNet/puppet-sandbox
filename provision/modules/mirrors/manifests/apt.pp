# == Class: mirrors::apt
#
# This class installs the Puppet Labs APT repository.
#
# === Parameters
#
# === Actions
#
# - Install puppetlabs repository
# - Perform initial sync to update package database
#
# === Requires
#
# === Sample Usage
#
#   class { 'mirrors::apt': }
#
class mirrors::apt {

  $puppetlabs_key = '4BD6EC30'

  exec { 'wget':
    command     => '/usr/bin/wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb',
    refreshonly => true,
  }

  exec { 'dpkg':
    command     => '/usr/bin/dpkg -i puppetlabs-release-precise.deb',
    refreshonly => true,
  }

  exec { 'apt_update':
    command     => '/usr/bin/apt-get update',
    refreshonly => true,
  }

}
