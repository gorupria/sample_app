module UsersHelper
  
  def gravatar_for(user, options = { :size => 50 })
    #gravatar is case sensitive so we are putting downcase
    #is in 0704, timestamp: 21:00 
    gravatar_image_tag(user.email.downcase, :alt => user.name,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
end
