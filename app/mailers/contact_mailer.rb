# Mailer base application controller
class ContactMailer < ActionMailer::Base
  default to: ENV['AUTHOR_MAIL']
  layout 'mailer'

  def send_message(message)
  	@message = message
  	mail(from: 'blog', subject: 'Contacto Blog')
  end
end
