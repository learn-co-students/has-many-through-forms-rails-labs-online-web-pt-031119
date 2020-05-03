class CommentsController < ApplicationController

 
  

  def create
  
    @comment = Comment.create(comment_params)
#binding.pry 
    # if @comment.save
       redirect_to post_path(@comment.post)
    # else
    #   redirect_to post_path(params[:post_id]) 
    # end 
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes: [:username])
  end
end
