class CommentsController < ApplicationController
  def create
    @movie = Movie.find(params[:comment][:commentable_id])
    current_user.comments.create(comment_params)
    respond_to do |format|
      format.js { render 'add_comment' }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,
                                    :commentable_id,
                                    :commentable_type)
  end
end
