class CatagorieArticle < ActiveRecord::Base
belongs_to :catagory
  belongs_to :article
end