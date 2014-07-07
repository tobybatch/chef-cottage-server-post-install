package 'pound'

# set pound to run on 443, redirecting to varnish on 6081
# varnish is already forwarding to 80
template '/etc/pound/pound.cfg' do
    source "de-ssl.cfg.erb"
    action :create
end

template '/etc/default/pound' do
    source "pound.erb"
    action :create
end

# if the ssl cert does not exist then copy in a snake oil cert and link to it
snakeoil_src="ssl-cert-snakeoil.pem"
snakeoil_sys="/etc/ssl/certs/ssl-cert-snakeoil.pem"
realcert="/etc/ssl/certs/ssl-cert.pem"

template '/etc/ssl/certs/ssl-cert-snakeoil.pem' do
    source 'ssl-cert-snakeoil.pem'
    action :create
end

execute "ln -s /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/ssl/certs/ssl-cert.pem" do
    not_if { File.exist?("/etc/ssl/certs/ssl-cert.pem") }
end

# install varnish drupal/tabs varnish vcl
template '/etc/varnish/default.vcl' do
    source 'varnish-default.vcl'
    action :create
end

# todo
# set ha proxy to connect to tabs api

