class SubscriptionsController < ApplicationController
  include Mailchimp

  def create
  	byebug
    if subscribe_user(subscription_list, subscriber_params)
      flash[:notice] = 'Suscrito!'
    else
      flash[:error] = 'No suscrito'
    end
    redirect_to root_path
  end

  private

  def subscriber_params
  	{
  	  body: {
  	  	email_address: params['subscription']['email'],
  	  	status: 'subscribed',
  	  	merge_fields: {
  	  	  'FNAME': params['subscription']['name']
  	  	}
  	  }
  	}
  end

  def subscription_list
  end

end