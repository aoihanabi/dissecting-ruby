# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  email: "test@test.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Admin User",
  roles: "site_admin"
)
puts "1 Admin user created"

User.create!(
  email: "test2@test.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Regular User"
)
puts "1 regular user created"

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end
puts "3 topics created"

5.times do |b|
  Blog.create!(
    title: "My Blog Post #{b}",
    body: "Sed ut perspiciatis unde omnis iste natus 
    rror sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo 
    inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem 
    quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur",
    topic_id: Topic.last.id
  )
end
puts "5 Blogs created."

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 25
  )
end
puts "5 Skills created."

3.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium 
    voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/350x200"
  )
end 
puts "3 Portfolios created."

3.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio #{portfolio_item}",
    subtitle: "Angular",
    body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium 
    voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/350x200"
  )
end 
puts "3 Portfolios created."

3.times do |tech|
  Portfolio.last.technologies.create!(
    name: "Tecnology #{tech}"
  )
end
puts "3 technologies created"
