module SessionsHelper
  
  def sign_in(user)
    #is in 0904, timestamp: 8:00
    #this line set the cookies but does not sign in
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    # ||= sign prevents access of DB from each and every request
    #is in 0904, timestamp: 27:00
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  private
  
  def user_from_remember_token
    #is in 0904, timestamp: 22:30
    User.authenticate_with_salt(*remember_token)
  end
  
  def remember_token
    cookies.signed[:remember_token] || [nil, nil]
  end
  
end
