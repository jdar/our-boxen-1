# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.11.0"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "3.0.2"
github "git",         "2.7.92"
github "go",          "2.1.0"
github "homebrew",    "1.13.0"
github "hub",         "1.4.1"
github "inifile",     "1.4.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.6.0"
github "nodejs",      "5.0.0"


#GOTCHA: brew link openssl --force
# https://github.com/eventmachine/eventmachine/issues/643 
github "openssl",     "1.0.0"

github "phantomjs",   "3.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.3"
github "stdlib",      "4.7.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"
github "openssl",     "1.0.0"

github "sublime_text", "1.1.0"
github "ohmyzsh", "1.0.0", :repo => "erivello/puppet-ohmyzsh"


github "dashlane", "1.0.1"
github "chrome", "1.2.0"
github "firefox", "1.2.3"


#github "mongodb", "1.4.0", :repo=>"richardtoner/puppet-virtualbox"
github "mongodb", "2.6.1"


# Optional/custom modules. There are tons available at
# https://github.com/boxen.
# github "elasticsearch", "2.8.0"
# github "mysql",         "2.0.1"
# github "postgresql",  "4.0.1"
github "redis",       "3.2.0"
# github "sysctl",      "1.0.1"

github "virtualbox", "1.0.14", :repo=>"richardtoner/puppet-virtualbox"

github "heroku", "2.1.1"
#github "foreman", "1.2.0"
#github "gcc", "3.0.2"
github "osx", "2.8.0"
github "gitx", "1.2.0"
github "automake", "1.0.0"
github "vagrant", "3.3.3"
github "wget", "1.0.1"
github "tmux", "1.0.2"
github "iterm2", "1.2.5"
github "watts", "1.0.0"
github "onyx", "1.2.0"
github "screen", "1.0.0"

github 'joinme', '1.0.1', :repo=>'brianvans/puppet-joinme'
github "skype", "1.1.0" #<-- this doesn't have a url to stay on stable. boo.
github "vlc", "1.1.0"
github "picasa", "1.0.0"
github "dockutil", "0.2.1"
github "sonos", "1.0.4"
github "googledrive", "1.0.2"
github "gcc", "3.0.2"
github "gpgtools", "1.1.0"
