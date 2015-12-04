class projects::ecommerce {
  $ecommerce_dir = "${boxen::config::srcdir}/ecommerce"
  repository { $ecommerce_dir:
    source => "git@heroku.com:warm-peak-7381.git"  
  } 
  ruby::local { $ecommerce_dir:
    version => '2.2.2'
  } 
}
