class ApplicationMailer < ActionMailer::Base
  default from: "events@matrix.fi"
  layout 'mailer'
end
