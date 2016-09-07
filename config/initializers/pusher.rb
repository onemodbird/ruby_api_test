require "pusher"

if Secrets.pusher
  Pusher.encrypted = true
  Pusher.app_id = Secrets.pusher.app_id
  Pusher.key    = Secrets.pusher["key"]
  Pusher.secret = Secrets.pusher.secret
end
