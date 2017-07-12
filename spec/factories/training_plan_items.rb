FactoryGirl.define do
  factory :training_plan_item do
    sequence(:id) {|n| n.to_s}

    initialize_with do
      new(
          id: id,
          date: nil,
          finished: nil
      )
    end
    
  end
end
