class Post < ActiveRecord::Base
  has_many :mains, dependent: :destroy
end
