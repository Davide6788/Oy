class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @business = business.find(params[:business_id])
    @post = Post.new
  end

  def create
    @business = business.find(params[:business_id])
    @post = Post.new(post_params)
    @post.business = @business
    if @post.save
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  def destroy
    @post = post.find(params[:id])
    @business_id = @post.business_id
    @post.destroy
    redirect_to business_path(@business_id)
  end

  def edit
    @business = business.find(params[:business_id])
    @post = Post.find(params[:id])
  end

  def update
    @business = business.find(params[:business_id])
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
