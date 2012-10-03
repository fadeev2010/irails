FactoryGirl.define do
  factory :user do
    full_name "Bruce Lee"
    email { FactoryGirl.generate(:email) }
    if User.respond_to?(:_has_subscription)
      subscription { |u| u.association(:subscriptions) }
    end
    password "foobar"
    password_confirmation { |u| u.password }
  end

  factory :confirmed_user, parent: :user do |u|
    confirmed_at 1.hour.ago
  end

  factory :not_confirmed_user, parent: :user do |u|
    confirmed_at nil
  end
end