FactoryGirl.define do
  factory :training do
    sequence(:id) {|n| n.to_s}

    initialize_with do
      new(
          id: id,
          title: 'test title',
          content: 'example content',
      )
    end
  end
end

