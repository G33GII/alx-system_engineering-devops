
# Ensure NGINX package is installed
package { 'nginx':
  ensure => installed,
}

# Define custom HTTP response header configuration
$hostname = $facts['hostname']
$custom_header = "add_header X-Served-By ${hostname};"

# Modify NGINX default site configuration to include the custom header
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => template('nginx/default.erb'),
  notify  => Service['nginx'],
}

# Restart NGINX service if configuration changes
service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  subscribe  => File['/etc/nginx/sites-available/default'],
}
