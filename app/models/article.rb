class Article < ActiveRecord::Base
  belongs_to :user
  has_many :catagorie_articles
has_many :catagories , :through => :catagorie_articles
  validates :name,presence: true, length: { minimum: 2 }
  validates :des, length: { minimum: 4 }

end