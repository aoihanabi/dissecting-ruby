# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |b|
  Blog.create!(
    title: "My Blog Post #{b}",
    body: "Sed ut perspiciatis unde omnis iste natus 
    rror sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo 
    inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem 
    quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur"
  )
end
puts "10 Blogs created."

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts "5 Blogs created."

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio #{portfolio_item}",
    subtitle: "My great service",
    body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium 
    voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/350x200"
  )
end 

puts "10 Blogs created."
