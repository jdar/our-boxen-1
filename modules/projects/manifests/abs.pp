class projects::abs {
  $app_dir = "${boxen::config::srcdir}/abs"
  repository { $app_dir:
    source => "git@gitlab.powerauctions.com:fcc-abs-spectrum-auctions/fcc-smra.git"
  } 
  ruby::local { $app_dir:
    version => '2.2.2'
  }
}
