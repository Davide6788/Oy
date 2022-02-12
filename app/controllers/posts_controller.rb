class PostsController < ApplicationController
  def index
    @chatroom = Chatroom.first
    @posts = Post.all
    @business = Business.find(current_user.id) if user_signed_in?
    @post = Post.new
  end

  def new
    @business = Business.find(params[:business_id])
    @post = Post.new
  end

  def create
    @business = Business.find(params[:business_id])
    @chatroom = Chatroom.first
    @post = Post.new(post_params)
    @post.business = @business
    if @post.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "post", locals: { post: @post })
      )
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @business_id = @post.business_id
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @business = Business.find(params[:business_id])
    @post = Post.find(params[:id])
  end

  def update
    @business = Business.find(params[:business_id])
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :photo)
  end
end
