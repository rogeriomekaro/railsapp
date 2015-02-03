FactoryGirl.define do
  factory :like do
      user_id 1
      association :object, factory: :idea
  end

end
