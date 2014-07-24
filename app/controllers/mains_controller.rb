class MainsController < ApplicationController
  before_action :authenticate, only: [:admin]
  
  def learn_webdeb
    @post_all = Post.all
    @sort_reverse = @post_all.sort.reverse
  end

  def new
    @main = Main.new(parent_id: params[:parent_id],post_id: params[:post_id],post_motivation_id: params[:post_motivation_id])
    if params[:post_id].to_i > 0
      @post_selected = Post.find(params[:post_id])
    elsif params[:post_motivation_id].to_i > 0
      @post_selected = PostMotivation.find(params[:post_motivation_id])
    end
  end

  def motivation
    @posts = PostMotivation.all
    @sort_rev = @posts.sort.reverse
  end

  def about
    @all_projects = Projectsabout.all
    @mystory = Mystory.find(1)
  end

  def books_courses
    @all_products = Product.all
  end

  def contact
    @mail = Mailinglist.new
    @contact = Contact.new
    @contactinfo = Contactinfo.find(1)
  end
  
  def create
    if params[:main][:parent_id].to_i > 0
      parent = Main.find_by_id(params[:main].delete(:parent_id))
      @main = parent.children.build(main_params)
    else
      @main = Main.new(main_params)
      @main.save
    end
    
    if @main.post_motivation_id > 0
      if @main.save
        redirect_to motivation_path
      else
        render :new
      end
    elsif @main.post_id > 0
      if @main.save
        redirect_to learn_webdeb_path
      else
        render :new
      end
    end
    
  end
  
  def create_subscriber
    @mortis = Mailinglist.new(main_params_mailing_list)
    if @mortis.valid?
      @mortis.subscribe
      redirect_to contact_path
    else
      redirect_to contact_path
    end
  end
  
  def send_contact
    @contact = Contact.new(main_params_contact)
    if @contact.valid?
      @contact.injection_to_spreadsheet
      ContactMailer.contact_mail(@contact).deliver
      redirect_to contact_path
    else
      redirect_to contact_path
    end
  end
  
  def admin
    @all_posts_webdevelopment = Post.all
    @all_posts_motivation = PostMotivation.all
    @projects_all = Projectsabout.all
    @mystory = Mystory.find(1)
    @contact_info = Contactinfo.find(1)
  end
  
  def view_all_comments
    @all_comments = Main.all
  end
  
  def destroy
    @komentarz = Main.find(params[:id])
    @komentarz.destroy
    redirect_to admin_path
  end
  
  def edit
    @comment_edit = Main.find(params[:id])
  end
  
  def update
    @comment_edit = Main.find(params[:id])
    @comment_edit.update(params[:main].permit(:title,:body))
    
    redirect_to admin_path
  end
  
  def edit_mystory_admin
    @mystory_edit = Mystory.find(1)
    @mystory_edit.update(edit_mystory_admin_params)
    redirect_to admin_path
  end
  
  private
    
    def main_params
      params.require(:main).permit(:title, :body, :image_url, :post_id, :post_motivation_id) 
    end
    
    def main_params_contact
      params.require(:contact).permit(:name,:email,:content)
    end
  
    def main_params_mailing_list
      params.require(:mailinglist).permit(:email)
    end
    
    def edit_mystory_admin_params
      params.require(:mystory).permit(:name,:body,:picture1,:picture2,:picture3)
    end
    
    def authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name = ENV["ADMIN_LOGIN"] && password == ENV["ADMIN_PASSWORD"]
      end
    end
    
end