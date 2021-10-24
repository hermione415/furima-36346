FactoryBot.define do
  factory :item do
    association :user

    items_name              { 'test' }
    items_information       { 'test' }
    category_id             { '2' }
    item_state_id           { '2' }
    shipcost_id             { '2' }
    shiparea_id             { '2' }
    daystoship_id           { '2' }
    price                   { '5000' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
