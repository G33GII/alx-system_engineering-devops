# Update the hard ulimit for the 'holberton' user in the limits.conf file
# This is necessary to allow the 'holberton' user to have a higher maximum number of file descriptors.
exec { 'add-user-hard-limit':
  command => "/bin/sed -i '/^holberton hard/s/5/50000/' /etc/security/limits.conf",
  path    => '/usr/local/bin/:/bin',
}

# Update the soft ulimit for the 'holberton' user in the limits.conf file
# This is necessary to allow the 'holberton' user to have a higher initial number of file descriptors.
exec { 'add-user-soft-limit':
  command => "/bin/sed -i '/^holberton soft/s/4/50000/' /etc/security/limits.conf",
  path    => '/usr/local/bin/:/bin',
}
