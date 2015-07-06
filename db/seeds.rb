# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Category.create! id: 1, name: 'Tea',    image: 'http://www.iconsearch.ru/uploads/icons/nuvola2/128x128/kteatime.png', discount_value: 5, discount_percent: 10
Category.create! id: 2, name: 'Coffee', image: 'http://emojisaurus.com/images/emoji/coffee.png'
Category.create! id: 3, name: 'Sweets', image: 'http://www.sweets247.co.uk/themes/sweets247/img/sweet-bag-300.png'

OrderStatus.delete_all
OrderStatus.create! id: 1, name: 'In Progress'
OrderStatus.create! id: 2, name: 'Placed'
OrderStatus.create! id: 3, name: 'Shipped'
OrderStatus.create! id: 4, name: 'Cancelled'

Role.delete_all
Role.create! id: 1, name: 'Admin'
Role.create! id: 2, name: 'User'