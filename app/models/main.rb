class Main < ActiveRecord::Base
  validates :title, :presence => { :message => "There is no title" }
  validates :body, :presence => { :message => "There is no body for comment" }
end
