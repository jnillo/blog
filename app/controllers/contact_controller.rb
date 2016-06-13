# Controller to build the initial view of the blog
class ContactController < ApplicationController
  def send_message
    contact = Contact.new(contact_params)
    if contact.valid?
      contact.save
      template='contacts/confirmation'
    else
      template='contacts/error'
    end

    respond_to do |format|
      format.js { render template: template, layout: false }
    end
  end

  private

  def contact_params
  	{
  	  subject: params['Contact']['subject'],
  	  content: params['Contact']['content'],
  	  email: params['Contact']['email'],
  	  phone: params['Contact']['phone']
  	}
  end
end
