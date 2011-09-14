class Bookmark < ActiveRecord::Base
 
 belongs_to :user
 validates :title , :presence => true
 validates :description , :length => {:maximum => 20}
validates :user_id , :presence => true
end
