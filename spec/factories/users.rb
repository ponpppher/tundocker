FactoryBot.define do
  factory :user do
    name { 'testuser' }
    email { 'testmail@gmail.com' }
    password { 'password' }
  end
end
