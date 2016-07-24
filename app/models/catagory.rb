class Catagory < ActiveRecord::Base

  validates :name ,presence: true,  length: {minimum: 3,maximum: 200}
  has_many :catagorie_articles
  has_many :articles, :through=> :catagorie_articles

end