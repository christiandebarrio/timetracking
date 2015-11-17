# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


(1..25).each do |index|
  Project.create(
    name: "project_#{index}",
    description: "description of project_#{index}"
  )
end

(1..50).each do |index|
  random = Random.new
  Entry.create(
    project_id: random.rand(25),
    hours: random.rand(1),
    minutes: random.rand(60),
    comment: "comment #{index}",
    date: Time.now
  )
end
