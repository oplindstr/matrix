class EventMailer < ApplicationMailer
	default from: 'events@matrix-ry.fi'
 
  def send_event_email(event)
    @event = event
    mail(to: 'test', subject: 'Test')
  end
end
