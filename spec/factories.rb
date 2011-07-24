Factory.define :user do |f|
  f.sequence(:email) { |n| "foo#{n}@bar.com"}
  f.password "secret"
  f.sequence(:username) { |n| "userna#{n}"}
end