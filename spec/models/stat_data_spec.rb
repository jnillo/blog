require 'rails_helper'

RSpec.describe StatData, type: :model do

  describe 'manage visits data' do
    it 'Save and recovery data' do
      StatData.save_visit(Time.zone.now.to_date, '127.0.0.1')
      data = StatData.visits(Time.zone.now.to_date)
      expect(data[Time.zone.now.to_date].include?('127.0.0.1')).to eq(true)
      expect(data.keys.include?(Time.zone.now.to_date)).to eq(true)
    end
  end
end
