FactoryBot.define do
  factory :book do
    title { 'happy party' }
    publish_on { '20190506' }
    sheets { '333' }
    price { '1500' }

    to_create { |instance| instance.save(validate: false) }
  end
end
