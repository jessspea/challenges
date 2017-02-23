file { 'motd':
  path    => '/etc/motd',
  content => 'This is my test custom message',
}