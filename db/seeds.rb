# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Owner.create(first_name: 'Leslie', last_name: 'Gonzalez', email: 'LeslieGonzalez@me.com', phone: '5168335506', zipcode: '11530', password_digest: 'testonly', quantity: '4')
#Owner.create(first_name: 'Howard', last_name: 'Schnapp', email: 'hns69@aol.com', phone: '5168335506', zipcode: '11530', password_digest: 'testonly', quantity: '4')


phats = Ferret.create(name: 'Phat Thing', age: '6', sex: 'M', color: 'champagne', health: 'adrenal and insulinoma', description: 'mellow and very sweet', home: 'true')
daisy = Ferret.create(name: 'Daisy', age: '5', sex: 'F', color: 'black sable', health: 'adrenal', description: 'curious and will love you with teeth', home: 'true')
joan = Ferret.create(name: 'Joan', age: '4', sex: 'F', color: 'chocolate', health: 'early adrenal', description: 'energetic and personable', home: 'true')
jett = Ferret.create(name: 'Jett', age: '4', sex: 'M', color: 'sable', health: 'no issues', description: 'energetic and very personable', home: 'true')


#Opportunity.create(title: 'This is a test', circumstance: 'My little fuzzies are staying with me', active: 'true')
#Opportunity.create(title: 'Looking to adopt', circumstance: 'We can take 2 more', active: 'true')
#Opportunity.create(title: 'Looking to rescue', circumstance: 'We can take a solo ferret', active: 'true')
#Opportunity.create(title: 'Looking to rehome', circumstance: 'Moving to Manhattan', active: 'true')