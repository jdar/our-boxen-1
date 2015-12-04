class projects::ecommerce {
  ruby::version { '2.2.2': }
  
  $ecommerce_dir = "${boxen::config::srcdir}/ecommerce"
  repository { $ecommerce_dir:
    source => "git@heroku.com:warm-peak-7381.git"  } 
}
