require 'rails_helper'

describe "Home", type: :feature do
  describe 'Show post' do
    let!(:category) { create(:category) }
    let!(:post) do
      create :post, category: category
    end
    let!(:comment) do
      create :comment, post: post
    end
    it 'show posts and categories', js: true do
      visit post_path(id: post.id)
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.author)
      expect(page).to have_content(category.name)
      expect(page).to have_content(post.content)
      expect(page).to have_content(post.published)
      post.comments.each do |comment|
        expect(page).to have_content(comment.content)
      end
    end
  end
end
