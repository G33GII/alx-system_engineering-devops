# Update the soft ulimit in the Nginx default configuration file to 4096 using sed
# This is necessary to allow Nginx to handle a higher number of file descriptors,
# which helps to avoid "Too many open files" errors under high load.
exec { 'update_nginx_default_ulimit':
  command => "/bin/sed -i 's/15/4096/' /etc/default/nginx",
  path    => '/usr/local/bin/:/bin/',
}

# Restart the Nginx service to apply the updated configuration
# This ensures that the changes to the soft ulimit take effect immediately.
exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => '/etc/init.d/',
}
