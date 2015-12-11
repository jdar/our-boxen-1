class projects::fabs {
  
  $app_dir = "${boxen::config::srcdir}/fabs"
  repository { $app_dir:
    source => "git@gitlab.powerauctions.com:fcc-incentive-auctions/fcctv-forward.git"
  } 
  ruby::local { $app_dir:
    version => '2.2.2'
  } 
}