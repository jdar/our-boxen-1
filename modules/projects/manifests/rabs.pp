class projects::rabs {
  $app_dir = "${boxen::config::srcdir}/rabs"
   
  repository { $app_dir:
    source => "git@gitlab.powerauctions.com:fcc-incentive-auctions/fcctv-reverse.git"
  } 
  ruby::local { $app_dir: 
    version => '2.2.2'
  }
}