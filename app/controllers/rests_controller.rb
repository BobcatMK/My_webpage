class RestsController < ApplicationController
  before_action :authenticate, except: [:show_project]
  
  def show_project
    @particular_project = Projectsabout.find(params[:id])
  end
  
  def admin_show_project
    @admin_particular_project = Projectsabout.find(params[:id])
  end
  
  def admin_show_project_delete
    @project_to_delete = Projectsabout.find(params[:id])
    @project_to_delete.destroy
    redirect_to admin_path
  end
  
  def creating_project
    @project_to_create = Projectsabout.new
  end
  
  def create_project_final
    @create_project = Projectsabout.new(create_and_edit_project_params)
    @create_project.save
    redirect_to admin_path
  end
  
  def editing_project
    @project_to_edit = Projectsabout.find(params[:id])
  end
  
  def edit_project_final
    @edit_project = Projectsabout.find(params[:id])
    @edit_project.update(create_and_edit_project_params)
    redirect_to admin_path
  end
  
  def admin_all_products
    @show_all_products = Product.all
  end
  
  def create_new_product
    @create_product = Product.new
  end
  
  def create_product_final
    @create_final = Product.new(create_edit_product_final)
    @create_final.save
    redirect_to admin_path
  end
  
  def edit_product
    @edit_product = Product.find(params[:id])
  end
  
  def edit_final_product
    @edit_product_final = Product.find(params[:product][:id])
    @edit_product_final.update(create_edit_product_final)
    redirect_to admin_path
  end
  
  def delete_product
    @product_to_be_deleted = Product.find(params[:product][:id])
    @product_to_be_deleted.destroy
    redirect_to admin_path
  end
  
  def contact_information
    @contact_information_show = Contactinfo.find(1)
  end
  
  def contact_information_edit
    @to_edit = Contactinfo.find(1)
    @to_edit.update(contact_info_params)
    redirect_to admin_path
  end
  
  private
  
    def create_and_edit_project_params
      params.require(:projectsabout).permit(:name,:description,:picture1,:picture2,:picture3,:picture4,:link)
    end
  
    def create_edit_product_final
      params.require(:product).permit(:id,:name,:author,:price,:short_description,:long_description,:affiliate_link,:picture1,:picture2,:picture3,:picture4)  
    end
    
    def contact_info_params
      params.require(:contactinfo).permit(:name_surname,:facebook,:twitter,:phone_number,:email_address)
    end
    
    def authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name = ENV["ADMIN_LOGIN"] && password == ENV["ADMIN_PASSWORD"]
      end
    end
end

