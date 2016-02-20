# Module to connect with Mailchimp
module Mailchimp
  
  def client
     Gibbon::Request.new
  end
 
  def lists
    client.lists
  end
 
  def list(list_id)
    client.lists(list_id).retrieve
  end
 
  def list_by_name(list_name)
     list = nil
     client.lists.retrieve(params: {"fields": "lists.id,lists.name"}).each { |id, name|
     	list = id if name == list_name
     }
     list
  end
 
  def subcribers(list_id)
     client.lists(list_id).members.retrieve
  end
 
  def subcribers_count(list_id)
    subcribers(list_id).count
  end
 
  def subscribe_user(list_id, user_data)
     client.lists(list_id).members.create(user_data)
  end
 
  def unsubscribe(list_id, email)
    list(list_id).members(parse_email(email)).update(body: { status: "unsubscribed" })
  end

  private 
 
  def parse_email(email)
     Digest::MD5.hexdigest email.downcase
  end
end