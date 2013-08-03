Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

#is in 1004, timestamp: 30:30
Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

#is in 1102, timestamp: 18:00
Factory.define :micropost do |micropost|
  micropost.content      "Foo bar"
  micropost.association  :user
end

