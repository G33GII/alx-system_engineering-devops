oft ulimit value and hard ulimit value
$soft_ulimit = 'soft_ulimit_value'
$hard_ulimit = 'hard_ulimit_value'

# Update the soft ulimit in the nginx configuration file using sed
exec { 'update_nginx_ulimit':
  command     => "/bin/sed -i 's/^\(\s*ulimit\s*\).*$/\\1 $hard_ulimit/' /etc/nginx/nginx.conf",
  path        => '/bin',
  refreshonly => true,
}

# Restart nginx service if the configuration file has been updated
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Exec['update_nginx_ulimit'],
}
