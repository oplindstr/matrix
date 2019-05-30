if Rails.env.production?
  # Configure dkim globally (see above)
  Dkim::domain      = 'matrix-ry.fi'
  Dkim::selector    = 'x'
  Dkim::private_key = File.read('config/dkim/dkim.private.key')
  # This will sign all ActionMailer deliveries
  ActionMailer::Base.register_interceptor(Dkim::Interceptor)
end