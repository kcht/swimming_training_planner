FactoryGirl.define do
  factory :training_plan do
    sequence(:id) {|n| n.to_s}

    initialize_with do
      new(
          id: id,
          name: 'Default test created training plan',
      )
    end
  end
end
