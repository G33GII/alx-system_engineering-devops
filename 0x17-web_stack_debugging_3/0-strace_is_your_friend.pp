# Using strace, find out why Apache is returning a 500 error. Once you find the issue,

# fix it and then automate it using Puppet

# (instead of using Bash as you were previously doing).

exec {'fix-Apache':
command => 'sed -i a/phpp/php/g /var/www/html/wp-setting.php'
path    => '/usr/bin/:/bin'
}
