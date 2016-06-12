class SubscriptionsController < ApplicationController
  include Mailchimp

  def create
    if subscribe_user(subscription_list, subscriber_params)
      create_subscription_cookie
      template = 'subscriptions/confirmation'
    else 
      template = 'subscriptions/error'
    end

    respond_to do |format|
      format.js { render template: template, layout: false }
    end
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
    ENV['MAILCHIMP_SUBSCRIPTION_LIST_ID']
  end

  def create_subscription_cookie
    cookies[:subscribed] = {
      value: true,
      expires: 1.year.from_now
    }
  end

end