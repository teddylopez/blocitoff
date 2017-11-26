require 'faker'

# Create a test user
new_user = User.create!(
    email:      'user@blocitoff.com',
    password:   'password'
    )
#new_user.skip_confirmation!
new_user.save!

# Create test lists
user_list = TodoList.create!(
    user_id: new_user.id,
    title: Faker::Ancient.god,
    description: Faker::Job.field
    )

# Create test items
5.times do
  Item.create!(
    todo_list_id: user_list.id,
    name: Faker::Beer.name
    )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{TodoList.count} lists created"
puts "#{Item.count} items created"
