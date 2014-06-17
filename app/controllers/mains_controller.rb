class MainsController < ApplicationController
  def learn_webdeb
    @main = Main.new
    @mains = Main.all
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
    
    respond_to do |format|
      if @main.save
        format.html { redirect_to @main }
      else
        format.html { render action: "learn_webdeb" }
      end
    end
  end
  
  def show
    redirect_to :action => "learn_webdeb" # albo redirec_to learn_webdeb_path
  end
  
  private
    
    def main_params
      params.require(:main).permit(:title, :body) # podsumowujac pozwala na zmiane tylko title i body w classie main czyli w modelu.
    end
  
end
