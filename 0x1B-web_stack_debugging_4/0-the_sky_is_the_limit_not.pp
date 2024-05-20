# Update the soft ulimit in the nginx default configuration file using sed
exec { 'update_nginx_default_ulimit':
  command => "/bin/sed -i 's/15/4096/' /etc/default/nginx",
  path    => '/usr/local/bin/:/bin/',
}

# Restart nginx service if the configuration file has been updated
exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => '/etc/init.d/',
}
