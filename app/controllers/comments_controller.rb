class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.valid?
      comment.save
      render partial: "new_comment", status: :ok
    else
      render body: nil, status: :bad_request
    end
  end

  private

  def comment_params
    comment_params = params.require(:comment).permit(:user, :content, :post_id)
    comment_params[:user].reverse == params[:comment][:captcha] ? comment_params : nil
  end
end
