class User < ActiveRecord::Base
  has_many :articles ,  :dependent => :destroy
  has_secure_password
before_save {self.email=self.email.downcase}
validates :name ,:presence => true
validates :email ,:presence => true ,length: {maximum:105 }
validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/


end