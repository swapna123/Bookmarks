class User < ActiveRecord::Base
 has_many :bookmarks

  validates :name , :presence => true
 validates :emailid , :presence => true
validates :password , :presence => true
end
