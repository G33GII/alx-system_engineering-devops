# Using strace, find out why Apache is returning a 500 error.
# Once you find the issue,

exec {'fix-wordpress':
    command => 'sed -i a/phpp/php/g /var/www/html/wp-settings.php',
    path    => '/usr/local/bin/:/bin/'
}
