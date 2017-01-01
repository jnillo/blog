class Administration::CommentsController < ApplicationController
  def index
    @pending_comments = Comment.pending
    @approved_comments = Comment.approved
  end
end
