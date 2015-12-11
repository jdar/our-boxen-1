class projects::pca {
  $app_dir = "${boxen::config::srcdir}/pca"
  repository { $app_dir:
    source => "git@heroku.com:starosrewards-pca-staging.git"
  } 
  ruby::local { $app_dir:
    version => '2.2.3'
  } 

  $app2_dir = "${boxen::config::srcdir}/staros_gift_card"
  repository { $app2_dir:
    source => "git@github.com:jdar/staros_gift_card.git"
  } 
  include firefox
  ruby::local { $app2_dir:
    version => '2.2.3'
  } 
}
