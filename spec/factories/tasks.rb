STATUSES = ["Completed","Pending"]
PRIORITIES = ["High","Medium","Low"]

FactoryBot.define do
    factory :task do
      name { Faker::Lorem.word }
      priority {PRIORITIES.sample}
      status { STATUSES.sample }
    end
  end