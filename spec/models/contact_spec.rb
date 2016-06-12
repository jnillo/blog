require 'rails_helper'

RSpec.describe Contact, :type => :model do
  it 'send message after create' do
  	create :contact
  	ActionMailer::Base.deliveries.count.should == 1
  end
end
