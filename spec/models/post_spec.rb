require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:category) { create(:category) }
  let(:post) do
    create :post, category: category
  end

  describe 'validations' do
    it 'validate presence of title' do
      post.title = nil
      post.valid?
      expect(post.errors.include?(:title)).to eq(true)
    end
    it 'validate presence of resume' do
      post.resume = nil
      post.valid?
      expect(post.errors.include?(:resume)).to eq(true)
    end
    it 'validate presence of content' do
      post.content = nil
      post.valid?
      expect(post.errors.include?(:content)).to eq(true)
    end
    it 'validate presence of author' do
      post.author = nil
      post.valid?
      expect(post.errors.include?(:author)).to eq(true)
    end
    it 'validate presence of date for publish' do
      post.published = nil
      post.valid?
      expect(post.errors.include?(:published)).to eq(true)
    end
    it 'validate presence of category' do
      post.category_id = nil
      post.valid?
      expect(post.errors.include?(:category_id)).to eq(true)
    end
  end
end
