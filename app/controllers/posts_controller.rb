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
  
  def admin_webdev
    @alibaba = params[:ahojmarynarzu]
    if @alibaba == "true"
      @received_post = Post.find(params[:id])
      @all_post_comments = Main.where(post_id: params[:id]).all
    elsif @alibaba == "false"
      @received_post = PostMotivation.find(params[:id])
      @all_post_comments = Main.where(post_motivation_id: params[:id]).all
    end
  end
  
  def delete_post
    @alibaba = params[:alibaba]
    if @alibaba == "true"
      #@to_delete_post = Post.find(params[:id])
      #@comments_deleted = Main.where(post_id: params[:id])
      #@comments_deleted.destroy_all
      #@to_delete_post.destroy
      #redirect_to admin_path
      
      Post.find(params[:id]).destroy
      redirect_to admin_path
      
      #@to_delete_post = Post.find(params[:id])
      #Main.delete_all(post_id: params[:id])
      #@to_delete_post.destroy
      #redirect_to admin_path
    elsif @alibaba == "false"
      #@to_delete_post = PostMotivation.find(params[:id])
      #@comments_deleted = Main.where(post_motivation_id: params[:id])
      #@comments_deleted.destroy_all
      #@to_delete_post.destroy
      #redirect_to admin_path
      
      PostMotivation.find(params[:id]).destroy
      redirect_to admin_path
      
      #@to_delete_post = PostMotivation.find(params[:id])
      #Main.delete_all(post_motivation_id: params[:id])
      #@to_delete_post.destroy
      #redirect_to admin_path
    end
  end
  
  def edit_poscik
    @alibaba = params[:alibaba]
    if @alibaba == "true"
      @post_to_edit = Post.find(params[:id])
    elsif @alibaba == "false"
      @post_to_edit = PostMotivation.find(params[:id])
    end
  end
  
  def apdejt
    @alibaba = params[:alibaba]
    if @alibaba == "true"
      @about_to_be_edited = Post.find(params[:id])
      @about_to_be_edited.update(edit_post_webdev_params)
      redirect_to admin_path
    elsif @alibaba == "false"
      @about_to_be_edited = PostMotivation.find(params[:id])
      @about_to_be_edited.update(edit_post_moti_params)
      redirect_to admin_path
    end
  end
  
  def delete_post_comment
    @comment_to_be_deleted = Main.find(params[:comment_id])
    @comment_to_be_deleted.destroy
    redirect_to admin_path
  end
  
  def edit_post_comment
    @comment_to_be_edited = Main.find(params[:comment_id])
  end
  
  def update_edit_post_comment
    @comment_to_be_updated = Main.find(params[:comment_id])
    @comment_to_be_updated.update(update_post_comment_params)
    redirect_to admin_path
  end
  
  private
  
    def post_param_create_post
      params.require(:post).permit(:title,:date,:short,:body)
    end
    
    def post_motivation_param
      params.require(:post_motivation).permit(:title,:date,:short,:body)
    end

    #UNIQUE PARAMS FOR EDITING POSTS
      def edit_post_webdev_params
        params.require(:post).permit(:title,:date,:short,:body)
      end

      def edit_post_moti_params
        params.require(:post_motivation).permit(:title,:date,:short,:body)
      end
    #END OF UNIQUE PARAMS FOR EDITING POSTS
    
    #PARAMS FOR EDITING POST'S COMMENT
      def update_post_comment_params
        params.require(:main).permit(:title,:body)
      end
    #END OF PARAMS FOR EDITING POST'S COMMENT
end
