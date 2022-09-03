class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def index
    # debugger
    @posts = Post.where(:user_id => current_user.id) rescue nil
    @posts =Post.all.order(created_at: 'DESC')
    respond_to do |format|
      format.html{render layout: false}
      format.js{ render 'index'}
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
  end

  def create
     # debugger
     @post = current_user.posts.create(posts_params)
     respond_to do |format|
      if @post.save
        format.html {redirect_to @post, notice: "Post created"}
        format.js
      else
        format.js
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

   def edit
     @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
      respond_to do |format|
    if @post.update(posts_params)
      format.html {redirect_to @post, notice: "Post created"}
        format.js
      else
        format.js
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
  

  
  def destroy
    # debugger
    @post = Post.find(params[:id])
    @post.destroy 
   respond_to :js
  
  end

  private
  def posts_params
    params.require(:post).permit(:content, :image, :user_id)
  end

end