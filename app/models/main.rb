class Main < ActiveRecord::Base
  #after_initialize :init
  before_save :default_values
  
  validates :title, :presence => { :message => "can't be blank" }
  validates :body, :presence => { :message => "can't be blank" }
  
  #def init
  # self.image_url == "public/guestpicture.png"
  # end
  
  def default_values
    self.image_url = "guestpicture.png"
  end
  
  
  acts_as_tree(order: "created_at DESC")
end
