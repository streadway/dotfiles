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
set -g -x PATH /usr/local/miniconda3/bin /usr/local/go/bin /usr/local/bin $PATH

# Load rbenv automatically by appending
# the following to ~/.config/fish/config.fish:

status --is-interactive; and source (rbenv init -|psub)

source /usr/local/libexec/google-cloud-sdk/path.fish.inc
