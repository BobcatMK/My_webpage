class MainsController < ApplicationController
  before_action :authenticate, only: [:admin]
  
  def learn_webdeb
    @mains = Main.hash_tree
    @post_all = Post.all
  end

  def new
    @main = Main.new(parent_id: params[:parent_id])
  end

  def motivation
  end

  def about
  end

  def books_courses
  end

  def contact
    @mail = Mailinglist.new
    @contact = Contact.new
  end
  
  def create
    if params[:main][:parent_id].to_i > 0
      parent = Main.find_by_id(params[:main].delete(:parent_id))
      @main = parent.children.build(main_params)
    else
      @main = Main.new(main_params)
    end
    
    respond_to do |format|
      if @main.save
        format.html { redirect_to learn_webdeb_path  }
      else
        format.html { render action: 'new' }
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
    @post_new = Post.new
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
  
  private
    
    def main_params
      params.require(:main).permit(:title, :body, :image_url) 
    end
    
    def main_params_contact
      params.require(:contact).permit(:name,:email,:content)
    end
  
    def main_params_mailing_list
      params.require(:mailinglist).permit(:email)
    end
    
    def authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name = ENV["ADMIN_LOGIN"] && password == ENV["ADMIN_PASSWORD"]
      end
    end
    
end
