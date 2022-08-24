class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # debugger
    @posts = Post.where(:user_id => current_user.id) rescue nil
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @post = Post.find(params[:id])
     respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @post = Post.new
     respond_to do |format|
      format.html
      format.js
    end

  end

  def create

     @post = current_user.posts.create(posts_params)
     respond_to do |format|
      if @post.save
        format.html 
        format.js
      else
        format.js
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy 
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "Post was successfully destroyed." }
      format.js
    end
  end

  def posts_params
    params.require(:post).permit(:content, :image, :user_id)
  end

end