# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
Role.create([
	{ :name => 'admin' },  
	{ :name => 'user' }
], :without_protection => true)
puts 'DEFAULT USERS'
user = User.create! :name => 'Administrator', 
:email => 'admin@example.com', 
:password => ENV['ADMIN_PASSWORD'].dup, 
:password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
#user.confirm!
user.add_role :admin

puts 'TUTORIALS'
tutorial = Tutorial.create! :title => 'Getting Started with Rails',
	:about => '<p>This guide covers getting up and 
		running with Ruby on Rails. After reading it, you should be familiar 
		with:
		<ul>
			<li>Installing Rails, creating a new Rails application, and 
			connecting your application to a database</li>
			<li>The general layout of a Rails application</li>
			<li>The basic principles of MVC (Model, View Controller) and RESTful design</li>
			<li>How to quickly generate the starting pieces of a Rails application</li>
		</ul>',
	:url => 'http://guides.rubyonrails.org/getting_started.html',
	:hours => 2,
	:paid => false
puts 'tutorial: ' << tutorial.title
tutorial2 = Tutorial.create! :title => 'Website Basics',
	:about => 'Beyond HTML and CSS, there are several basic technology skills that every web 
		professional should know. Some of these include uploading files to the web via FTP 
		or purchasing domains and hosting.',
	:url => 'http://teamtreehouse.com/library/websites/website-basics/website-basics',
	:hours => 1.5,
	:paid => true
puts 'tutorial2: ' << tutorial2.title