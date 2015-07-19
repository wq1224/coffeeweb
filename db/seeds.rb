# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
c1 = Category.new(:name=>"咖啡相遇")
c1.save
c2 = Category.new(:name=>"心理咨询")
c2.save
c3 = Category.new(:name=>"心灵聚会")
c3.save
c4 = Category.new(:name=>"心理师成长")
c4.save
