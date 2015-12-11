class projects::paa {
  $app_dir = "${boxen::config::srcdir}/paa"
  repository { $app_dir:
    source => "git@github.com:jdar/star0s.git"
  } 
  ruby::local { $app_dir:
    version => '2.2.3'
  } 
}
