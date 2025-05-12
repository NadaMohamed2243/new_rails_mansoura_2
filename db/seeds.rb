# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
# Destroy records in proper order to respect foreign keys
PostEditor.destroy_all
Post.destroy_all
User.destroy_all

# Create users
creator = User.create!(
  name: "Creator",
  email: "creator@example.com"
)

editor1 = User.create!(
  name: "Editor 11", 
  email: "editor1@example.com"
)

editor2 = User.create!(
  name: "Editor 22",
  email: "editor2@example.com"
)

# Create post
post = Post.create!(
  title: "p1",
  content: "with editors",
  user: creator,
  creator: creator
)

# Add editors through the join model
PostEditor.create!(post: post, editor: editor1)
PostEditor.create!(post: post, editor: editor2)

# Verify
puts "Creator: #{creator.name}"
puts "Post title: #{post.title}"
puts "Editors: #{post.editors.pluck(:name).join(', ')}"
puts "Editor 1's edited posts: #{editor1.edited_posts.pluck(:title).join(', ')}"