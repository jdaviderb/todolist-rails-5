FactoryGirl.define do
  factory :task do
    description {Faker::Lorem}
    user
    done true
  end
end
