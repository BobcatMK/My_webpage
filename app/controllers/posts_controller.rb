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
  
  def learn_showpost
    #@post_to_render = Post.where(id: params[:id]) - zostawiam tego dla przestrogi, nie moglem w learn_showpost drukowac na ekran poszczegolnych parametrow tego posta pomimo, ze zawieral wszystkie parametry w srodku.
    @post_to_render2 = Post.find(params[:id])
    @mains = Main.where(post_id: params[:id]).hash_tree
  end
  
  def motivation_showpost
    @post_to_render3 = PostMotivation.find(params[:id])
    @mains = Main.where(post_motivation_id: params[:id]).hash_tree
  end
  
  private
  
    def post_param_create_post
      params.require(:post).permit(:title,:date,:short,:body)
    end
    
    def post_motivation_param
      params.require(:post_motivation).permit(:title,:date,:short,:body)
    end

end
