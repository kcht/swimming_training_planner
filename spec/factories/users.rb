FactoryGirl.define do
  factory :user do
    sequence(:id) {|n| n.to_s}

    initialize_with do
      new(
          id: id,
          name: 'User',
          name: 'example',
          email: 'example@test.pl',
          password: 'example@test.pl',
          password_confirmation: 'example@test.pl'
      )
    end
  end
end

