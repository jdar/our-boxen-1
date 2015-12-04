class projects::abs {
  ruby::version { '2.2.2': }
  include redis

  
  $abs_dir = "${boxen::config::srcdir}/abs-tmp"
  repository { $abs_dir:
    source => "git@gitlab.powerauctions.com:fcc-abs-spectrum-auctions/fcc-smra.git"
  } 
}