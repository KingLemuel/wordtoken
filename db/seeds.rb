# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	word_tokens = WordToken.create([ {label: "Communication"}, {label: "Honesty"}, {label: "Reliable"},
		{label: "Leader"}, {label: "Trustworthy"}, {label: "CSS"}, {label: "Javascript"},{label: "HTML"}, {label: "RAILS"}, {label: "JQUERY"}, 
		{label: "Photoshop"}, {label: "LINUX"}, {label: "Python"}, {label: "DJANGO"} ])