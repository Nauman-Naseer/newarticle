class Article < ActiveRecord::Base
  belongs_to :user
  validates :name,presence: true, length: { minimum: 2 }
  validates :des, length: { minimum: 4 }

end