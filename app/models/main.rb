class Main < ActiveRecord::Base
  validates :title, :presence => { :message => "can't be blank" }
  validates :body, :presence => { :message => "can't be blank" }
end
