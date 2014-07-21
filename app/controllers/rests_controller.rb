class RestsController < ApplicationController
  def show_project
    @particular_project = Projectsabout.find(params[:id])
  end
  
  def admin_show_project
    @admin_particular_project = Projectsabout.find(params[:id])
  end
  
  private
  
end

