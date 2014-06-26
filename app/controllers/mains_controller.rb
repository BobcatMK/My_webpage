class MainsController < ApplicationController
  def learn_webdeb
    @mains = Main.hash_tree
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
  
  private
    
    def main_params
      params.require(:main).permit(:title, :body, :image_url) 
    end
  
end
