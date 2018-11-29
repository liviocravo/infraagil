class apache {
	
	case $::osfamily {
		"RedHat": {
			$web = "httpd"
		}

		"Debian": {
			$web = "apache2"
			exec{"atualizando_pacotes": 
				command => "/usr/bin/apt update"
		
			}
		}
	}

	package {
		$web:
		ensure => present
	}

	service {$web:
                ensure => running,
                enable => true
        }

		
	file {"/var/www/html/index.html":
                source => "puppet:///modules/apache/index.html",
                ensure => present
        }
}
