require 'spec_helper'

describe "Micropoosts" do
  
  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email, :with => user.email
    fill_in :password, :with => user.password
    click_button
  end
  
  describe "creationg" do
    
    describe "failure" do
      
      it "should not make a new micropost  " do
        lambda do
          visit root_path
          fill_in :micropost_content, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector('div#error_explanation')
        end.should_not change(Micropost, :count)
      end
    end
    
    describe "success" do
      
      it "should make a new micropost " do
        lambda do
          visit root_path
          fill_in :micropost_content, :with => "This is a micropost"
          click_button
          response.should have_selector('span.content', :content => "This is a micropost")
        end.should change(Micropost, :count).by(1)
      end
      
      
    end
  end
  
end
