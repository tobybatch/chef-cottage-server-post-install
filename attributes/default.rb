default['pound']['user'] = "www-data"
default['pound']['group'] = "www-data"
default['pound']['loglevel'] = "1"
default['pound']['alive'] = "30"
default['pound']['control'] = "/var/run/pound/poundctl.socket"
default['pound']['listenaddr'] = "127.0.0.1"
default['pound']['listenport'] = "8080"
default['pound']['backendaddr'] = ["127.0.0.1", 192.168.51.31]
default['pound']['backendport'] = ["80", "443"]
default['pound']['cert'] = "/etc/ssl/certs/ssl-cert.pem"

