class MainsController < ApplicationController
  def learn_webdeb
    @main = Main.new
    @mains = Main.all
  end

  def new
    @main = Main.new
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
    @main = Main.new(main_params)
    @mains = Main.all
   
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
