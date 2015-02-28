Rant.destroy_all

5.times do
  Rant.create title: Faker::Company.bs, body: Faker::Lorem.paragraph
end
