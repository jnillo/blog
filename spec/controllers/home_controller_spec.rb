require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:category) { create(:category) }
  describe 'GET #index' do
    let(:post) do
      create :post, category: category
    end

    def do_action(params = {})
      get :index, params
    end

    it 'assigns variables' do
      do_action
      # TODO, check if cookies is set
    end
  end
end
