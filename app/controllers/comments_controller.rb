class CommentsController < ApplicationController
  def new
    @comment =Comment.new
  end

  def create
    # debugger
     @post =Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to post_path(@post)}
      format.js
    end
 end



  private
  def comment_params
   params.require(:comment).permit(:content, :post_id, :user_id) 
  end

end
