require 'spec_helper'

describe User do
  #it is in lesson 00603, Time_Stamp: 13:00
  before(:each) do
    @attr = {:name => "Example User", :email => "user@example.com"}
  end
  
  it "should create a new instance given a valid attribute " do
        User.create!(@attr)
    end
  
  it "should require a name " do
        no_name_user = User.new(@attr.merge(:name => ""))
        no_name_user.should_not be_valid
    end
  
  it "should require an email " do
        no_email_user = User.new(@attr.merge(:email => ""))
        no_email_user.should_not be_valid
    end
    
  it "should reject names that are too long " do
      long_name = "a" * 51
      long_name_user = User.new(@attr.merge(:name => long_name))
      long_name_user.should_not be_valid
    end
    
  it "should have a valid email address" do
      addresses = %w[user@foo.com THE_USER@foor.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end
    
  it "should reject inavlid email address " do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end
    
  it "should reject duplicate email addresses " do
      User.create!(@attr)
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
    
  #very important because rails uniqueness validation is case sensitive
  #is in 0603, timestamp : 37:00
  it "should reject email address identical up to close " do
      upcased_email = @attr[:email].upcase
      User.create!(@attr.merge(:email => upcased_email))
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
  
  
  
  
  
  
  
  
end
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

