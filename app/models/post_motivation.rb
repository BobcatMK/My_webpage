class PostMotivation < ActiveRecord::Base
  has_many :mains, dependent: :destroy
end
