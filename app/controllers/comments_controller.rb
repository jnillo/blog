class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if verify_recaptcha(model: comment) && comment.valid?
      comment.save
      render partial: "new_comment", status: :ok
    else
      render body: nil, status: :bad_request
    end
  end

  private

  def comment_params
    comment_params = params.require(:comment).permit(:name, :email, :content, :post_id)
    comment_params[:status] = false
    comment_params
  end
end
