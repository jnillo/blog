class Administration::CommentsController < ApplicationController
  def index
    @pending_comments = Comment.pending
    @approved_comments = Comment.approved
  end

  def approve_comment
    comment = Comment.find params[:id]
    if comment.update_attribute(:status, true)
      flash[:notice]= 'El comentario fue aprobado con éxito.'
    else
      flash[:error]= 'Ha pasado algo mientras se aprobaba el comentario. Pregunta a Juan.'
    end
    redirect_to administration_comments_path
  end

  def remove_comment
    comment = Comment.find params[:id]
    if comment.delete
      flash[:notice]= 'El comentario fue eliminado con éxito.'
    else
      flash[:error]= 'Ha pasado algo mientras se eliminaba el comentario. Pregunta a Juan.'
    end
    redirect_to administration_comments_path
  end

  def reply_comment
    reply = Comment.new(comment_params)
    if reply.valid?
      reply.save
      flash[:notice] = "Respuesta publicada con éxito."
    else
      flash[:error] = "Error al guardar la respuesta. Habla con Juan."
    end
    redirect_to administration_comments_path
  end

  private

  def comment_params
    comment_params = params.require(:comment).permit(:name, :email, :content, :post_id, :reply_to_id)
    comment_params[:name] = "Patricia Carmona"
    comment_params[:email] = "patricia@patriciacarmona.com"
    comment_params[:status] = true
    comment_params
  end
end
