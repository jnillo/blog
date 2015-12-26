require 'rails_helper'

describe "Home" ,type: :feature do
  let(:category) { create(:category) }
  let(:post) do
    create :post, category: category
  end

  describe 'Index' do
    let(:category) do
      create :category, name: 'Category 2'
    end
    let(:post_2) do
      create :post, category: category_2
    end

    it 'show posts and categories' do
      categories = Category.all
      posts = Post.all

      categories.each do |category|
        expect(page.content).to have_content(category.name)
      end

      posts.each do |post|
        expect(page.content).to have_content(post.title)
      end
    end
  end
end