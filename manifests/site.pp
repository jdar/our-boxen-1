require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx
  include openssl

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  #REMOVED. trying to install 2.6.0, which is not adequate. not adequate at all.
  #include mongodb

  # node versions
  nodejs::version { '0.12': }
  class { 'nodejs::global':
    version => '0.12'
  }

  # default ruby versions
  ruby::version { '2.2.3': }
  ruby::version { '2.2.2': }
  ruby::version { '2.1.7': }
  class { 'ruby::global':
    version => '2.2.3'
  } 

  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '*',
  }
  #ruby::rbenv::plugin { 'rbenv-vars':
  #  ensure => 'v1.2.0',
  #  source  => 'sstephenson/rbenv-vars'
  #}

# gem install eventmachine -v '1.0.7' -- --with-cppflags=-I/opt/boxen//homebrew/opt/openssl/include/ 
#  ruby_gem { 'eventmachine for all rubies':
#      gem          => 'eventmachine',
#      ruby_version => '*',
#      option => '--with-cppflags=-I/opt/boxen//homebrew/opt/openssl/include/'
#    }
#gem install libv8 -v '3.16.14.7' -- --with-system-v8
#ruby_gem { 'libv8 for all rubies':
#    gem          => 'eventmachine',
#    ruby_version => '*',
#    option => '--with-system-v8'
#  }

  # common, useful packages
  package {
    [
      'ack',
      'tree',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
