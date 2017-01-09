class Contact < ApplicationRecord
  
  validates :subject, presence: true
  validates :content, presence: true
  validates :email, presence: true

  after_create :send_message

  private

  def send_message
  	ContactMailer::send_message(self).deliver
  rescue => error
    Rails.logger.tagged("Sending email to Patricia") { Rails.logger.info error }
    @error = error.to_s
  end
end
