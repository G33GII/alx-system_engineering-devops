# Define the ulimit command
$ulimit_command = 'ulimit -n 2048'

# Execute sed command to add ulimit command to ~/.bashrc file
exec { 'add_ulimit_to_bashrc':
  command     => "/bin/sed -i '/# Add custom configurations/a ${ulimit_command}' /home/holberton/.bashrc",
  user        => 'holberton',
  path        => '/bin',
  onlyif      => "grep -v '^#' /home/holberton/.bashrc | grep -q '${ulimit_command}'",
}
