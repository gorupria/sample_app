require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'show'" do
    
    before(:each) do
      #is in 0704, timestamp: 3:00
      @user = Factory(:user)
    end
    
    
    it "should be successful " do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user " do
      get :show, :id => @user
      #is in 0704, timestamp: 8:00
      #assigns methods assigns the value(in this case,instance of a user class 
      assigns(:user).should == @user
    end
    
    it "should have a right title " do
      get :show, :id => @user
      response.should have_selector('title', :content => @user.name)
    end
    
    it "should have a user's name " do
      get :show, :id => @user
      response.should have_selector('h1', :content => @user.name)
    end
    
    it "should have a profile image " do
      get :show, :id => @user
      response.should have_selector('h1>img', :class => "gravatar")
    end
    
    
    
    
    
  end
  
  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end
    
    it "should have a right title " do
        get :new
        response.should have_selector('title', :content => "Sign up")
      end
    
  end

end
