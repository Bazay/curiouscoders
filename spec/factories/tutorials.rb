# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tutorial do
    title "MyString"
    about "MyText"
    url "MyString"
    user nil
  end
end
