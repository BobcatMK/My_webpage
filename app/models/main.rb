class Main < ActiveRecord::Base
  #after_initialize :init
  belongs_to :post
  belongs_to :post_motivation
  
  before_save :default_values
  
  validates :name, :presence => { :message => "can't be blank" }
  validates :content, :presence => { :message => "can't be blank" }
  validates_length_of :name, minimum: 2, message: "is too short - minimum 2 characters"
  validates_length_of :name, maximum: 30, message: "is too long - maximum 30 characters"
  validates_length_of :content, minimum: 2, message: "is too short - minimum 2 characters"
  validates_length_of :content, maximum: 300, message: "is too long - maximum 300 characters"
  
  #def init
  # self.image_url == "public/guestpicture.png"
  # end
  
  def default_values
    self.image_url = "guestpicture.png"
  end
  
  
  acts_as_tree(order: "created_at DESC")
end
