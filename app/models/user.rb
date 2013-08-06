# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean         default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :email, :name, :password, :password_confirmation
  
  has_many :microposts, :dependent => :destroy
  
  email_regex = /\A[\w+\-.]+@[a-z\d.\-]+\.[a-z]+\z/i
  
  validates :name,  :presence => true, 
                    :length   => {:maximum => 50}
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
                       :confirmation => true, #this will automatically create password_confirmation attr.
                       :length => { :within => 6..40 }
  
  #callback are rails methods those are called in diffrent lifecycle of an application
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  #is in 1104, timestamp: 33:00
  def feed
    Micropost.where("user_id = ?", id)
  end
  
  #is in 0703, timestamp: 20:00
  #everything inside this block is a class level method
  class << self
    def authenticate(email, submitted_password)
      user = find_by_email(email)
      (user && user.has_password?(submitted_password)) ? user :nil
    end
    
    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end
  
  private
    #is in 0702, timestamp: 30:00
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password) #can be written as encrypt(self.password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    #is in 0703, timestamp: 09:00
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end

