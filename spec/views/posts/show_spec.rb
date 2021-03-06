require 'rails_helper'

describe "Home", type: :feature do
  let!(:category) { create(:category) }
  let!(:post) do
    create :post, category: category
  end
  let!(:comment) do
    create :comment, post: post
  end
  describe 'Show post' do
    it 'show posts and categories'do
      visit show_post_path(slug: post.slug)
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
