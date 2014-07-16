class PostsController < ApplicationController
  def create
    @post_created = Post.new(post_param_create_post)
    @post_created.save
    if @post_created.save
      redirect_to admin_path
    else
      redirect_to admin_path
    end
  end
  
  def save_motivation
    @post_moti_created = PostMotivation.new(post_motivation_param)
    @post_moti_created.save
    if @post_moti_created.save
      redirect_to admin_path
    else
      redirect_to admin_path
    end
  end
  
  def create_post
    @post_new = Post.new
  end
  
  def create_motivation
    @post_new = PostMotivation.new
  end
  
  private
  
    def post_param_create_post
      params.require(:post).permit(:title,:date,:short,:body)
    end
    
    def post_motivation_param
      params.require(:post_motivation).permit(:title,:date,:short,:body)
    end
end
