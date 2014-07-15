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
  
  private
  
    def post_param_create_post
      params.require(:post).permit(:title,:date,:short,:body)
    end
end
