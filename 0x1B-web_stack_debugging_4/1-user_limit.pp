# Define the ulimit command

# Define the path to the ulimit script
exec { 'add-user-hard-limit':
  command => "/bin/sed -i '/^holberton hard/s/5/50000/' /etc/security/limits.conf",
  path    => '/usr/local/bin/:/bin',
}

# Define the path to the ulimit script
exec { 'add-user-soft-limit':
  command => "/bin/sed -i '/^holberton soft/s/4/50000/' /etc/security/limits.conf",
  path    => '/usr/local/bin/:/bin',
}
