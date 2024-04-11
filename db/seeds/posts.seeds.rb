after :admin do
  regions = Region.all

  regions.each do |region|
    2.times do 
      region.posts.create(title: Faker::Lorem.sentence,
                          content: Faker::Lorem.paragraph(sentence_count: 5),
                          user: User.first,
                          state: "approved")
    end
  end
end
