require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:category) { create(:category) }
  let(:post) do
    create :post, category: category
  end
  let(:comment) do
    create :comment, post: post
  end

  describe 'Validations' do
    it 'validate presence of author' do
      comment.user = nil
      comment.valid?
      expect(comment.errors.include?(:user)).to eq(true)
    end

    it 'validate presence of content' do
      comment.content = nil
      comment.valid?
      expect(comment.errors.include?(:content)).to eq(true)
    end

    it 'validate presence of post reference' do
      comment.post_id = nil
      comment.valid?
      expect(comment.errors.include?(:post)).to eq(true)
    end
  end
end
