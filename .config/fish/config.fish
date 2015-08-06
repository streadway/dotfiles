function knifet --description 'Knife - cloudmaker'
  command bundle exec knife $argv -c ~/sc/system/.chef/knife-cm.rb
end

function knifepr --description 'Knife - cloudmaker'
  command bundle exec knife $argv -c ~/sc/system/.chef/knife-production.rb
end

function dmz --description 'Run command over role in DMZ'
  command pdsh -w (dig +short {$argv[1]}.r.dmz.s-cloud.net| paste -sd, -) -- {$argv[2..-1]}
end

function dec --description 'Decrypts stdin to stdout using shibboleth'
  command curl -Ss -T- http://shibboleth/decrypt
end

function enc --description 'Encrypts stdin to stdout using shibboleth'
  command curl -Ss -T- http://shibboleth/encrypt
end

set -g -x GOPATH $HOME
set -g -x PATH /usr/local/bin $PATH
set -g -x EDITOR /usr/local/bin/vim

set -g -x DOCKER_HOST tcp://192.168.59.103:2376
set -g -x DOCKER_CERT_PATH $HOME/.boot2docker/certs/boot2docker-vm
set -g -x DOCKER_TLS_VERIFY 1

