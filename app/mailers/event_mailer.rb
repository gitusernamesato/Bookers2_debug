class EventMailer < ApplicationMailer
  default from: 'noreply@example.com'
  default to: 'admin@example.com'
  layout 'mailer'

  def send_mail(event)
    @event = event
    mail(from: event.email, to: ENV['MAIL_ADDRESS'], subject: 'New Event') do |format|
      format.text
    end
  end
end
