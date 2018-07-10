STATUSES = ["Completed","Pending"]
PRIORITIES = ["High","Medium","Low"]

10.times do  Task.create(name: "To learn #{Faker::ProgrammingLanguage.name}", status: STATUSES.sample, priority: PRIORITIES.sample) end