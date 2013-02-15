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

  exec { 'wget_precise':
    timeout => 3600, # This can take a while... Usually Not ;-)
    command     => '/usr/bin/wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb'
  }

  exec { 'dpkg_precise':
    command     => '/usr/bin/dpkg -i puppetlabs-release-precise.deb',
    require => Exec["wget_precise"]
  }

  exec { 'apt_update':
    command     => '/usr/bin/apt-get update',
	  require => Exec["dpkg_precise"]
  }

}
