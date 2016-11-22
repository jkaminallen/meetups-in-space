# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
various_meetups =[
  { name: "Spooky Movie Party", description: "Wet Pants", location: "Boston, MA", creator: "Jon" },
  { name: "Blue Man Group Pillow Fight", description: "Super Blue", location: "Wilbur Theatre", creator: "Tobias Funke" }
]
various_meetups.each do |meetup|
  Meetup.create(meetup)
end

various_users =[
  { provider: "github", uid: "69420", username: "must_love_dogs", email: "doglover68@yahoo.com", avatar_url: "http://d21vu35cjx7sd4.cloudfront.net/dims3/MMAH/thumbnail/269x169/quality/90/?url=http%3A%2F%2Fs3.amazonaws.com%2Fassets.prod.vetstreet.com%2F00%2F50cb40a8a511e0a0d50050568d634f%2Ffile%2FPomeranian-1-645mk070411.jpg" },
  { provider: "stubhub", uid: "300", username: "tadoe", email: "bangbang@300.com", avatar_url: "http://i.imgur.com/7iUwl6b.jpg" }
]

various_users.each do |user|
  User.find_or_create_by(user)
end

various_usermeetups =[
  { user_id: 1, meetup_id: 2, owner: true },
  { user_id: 1, meetup_id: 1, owner: true },
  { user_id: 2, meetup_id: 2, owner: true }
]

various_usermeetups.each do |usermeetup|
  Usermeetup.create(usermeetup)
end
