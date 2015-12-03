class people::jdar {
 
  notify { 'class people::jdar declared': }
  
  #include osx
  #osx::recovery_message {
  #  'phone 202 630 5327':
  #}

  git::config::global { 'user.email':
    value  => 'darius.roberts@gmail.com'
  }
  git::config::global { 'user.name':
    value  => 'Darius Roberts'
  }
  git::config::global { 'core.editor':
    value  => 'subl'
  }
  git::config::global { 'push.default': 
    value  => 'simple'
  }
  git::config::global { 'alias.st': value => 'status' }
  git::config::global { 'alias.br': value => 'branch' }
  git::config::global { 'alias.co': value => 'checkout' }
  git::config::global { 'alias.lol': 
    value => "log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(white)- %an, %ar%Creset' --abbrev-commit --all --decorate" 
  }

  git::config::global { 'alias.sup': value => 'submodule update --init' }
  include gitx::dev

  include automake
  include dnsmasq
  class { 'git' : version => '2.5.0' }
  include hub
  include nginx
  include vagrant
  include wget
  #include tree 
  #include docker

  include heroku
  #heroku::plugin { 'accounts':
  #  source => 'ddollar/heroku-accounts'
  #}


  include chrome #todo: make dev setup, for testing chrome extensions
  #include chromedriver
  include iterm2::stable

  include ohmyzsh
  include sublime_text
  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }
  #include sublime_text_3::package_control

  #sublime_text::package { 'Ctags':
  #  source => 'SublimeText/CTags'
  #}


  include gpgme
  include skype


  include sonos
  include picasa
  include vlc

#communication
  include tmux

  require power::admin

  include dockutil
  dockutil::item { 'Add iTerm':
        item     => "/Applications/iTerm.app",
        label    => "iTerm",
        action   => "add",
        position => 2,
  }

$dotfiles_dir = "${boxen::config::srcdir}/dotfiles"
repository { $dotfiles_dir:
  #source => "${::github_user}/dotfiles"
  source => "jdar/dotfiles"
}

# DOTFILE INSTALLATION:
# would do this:
#file { "${home}/.tmux.conf":
#  ensure  => link,
#  mode    => '0644',
#  target  => "${dotfiles_dir}/tmux.conf",
#  require => Repository["${dotfiles_dir}"],
#}
# but this is easier:
#exec { "install dotfiles":
#  cwd      => $dotfiles_dir,
#  command  => "./script/bootstrap",
#  provider => shell,
#  creates  => "${home}/.zshrc",
#  require  => Repository[$dotfiles_dir]
#}


  include virtualbox

  #utils
  include watts
#  include onyx
#  include xpdf
  include dashlane

  class osx::safari::homepage($page) {
    boxen::osx_defaults { 'Set the Default Safari Homepage':
      user   => $::boxen_user,
      domain => 'com.apple.Safari',
      key    => 'HomePage',
      value  => $page,
    }
  }
  class { 'osx::safari::homepage': page => "https://google.com" }

  boxen::osx_defaults { "require pass at screensaver":
    ensure => present,
    domain => 'com.apple.screensaver',
    key    => 'askForPassword',
    value  => 0,
    user   => 'jdar'
  }

  include screen
  include googledrive
#  include google_music_manager
#  include android_file_transfer
#  include tmux
#  include java

  #class { 'osx::dock::position':
  #  position => 'right'
  #}
  include bash
  include bash::completion

  #include osx::global::enable_keyboard_control_access
  include gcc
  class { 'gpgtools': }

  include projects::all
}
