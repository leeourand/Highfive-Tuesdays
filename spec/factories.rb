Factory.define :user do |f|
  f.sequence(:email) { |n| "foo#{n}@bar.com"}
  f.password "secret"
  f.sequence(:username) { |n| "userna#{n}"}
end

Factory.define :highfive do |f|
  f.user1_id 1
  f.user2_id 2
  f.approved true
end