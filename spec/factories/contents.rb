  
FactoryBot.define do
  factory :content do
    id                     {"1"}
    title                  {"参考書"}
    text                   {"Ruby on rails参考書"}
    group_id               {"1"}
    user_id                {"1"}
    created_at             {"2020-03-12 10:40:52"}
    updated_at             {"2020-03-12 10:40:52"}
    tag_list               {"参考書"}
    image {File.open("#{Rails.root}/test/fixtures/files/images/rspec-test.png")}
    user
    group
  end
end