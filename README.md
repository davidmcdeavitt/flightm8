# README

This project is called FLIGHTm8

The app works as a secondary market for travel deals, in which users can sign up and view deals relevant to them.

The user is required to enter information about their budget, availability for travel, and travel interests, and the app will show them a specific list of deals matching their interests and requirements.

Once a user has found a deal they are interested in, they can save it to their "saved deals" list, which they can access at any time via the "My Saved Deals" button on the user dashboard.

The app also has a general API call available to provide all the deals in JSON format.

* Ruby version
For this project we used ruby version 2.4.1 for the backend base language
Rails version 5.1.2 (ActiveRecord built in) was used as a framework
Gem ActiveRecord was used to help route the back end to the database and create tables necessary for basic function of the app

* System dependencies
run bundle install and see Gemfile for list of gems



* Configuration
rails new rails_app -GT -d postgresql
this command was used to create a new rails app

git init * git add -A * git commit 'first commit'
this puts git repo in your rails project

* Database creation

when rails is first used to create a new project
rails db:create * rails db:migrate
these are necessary to create a database

GEM postgresql (Postgres) was used as the database creator and administrator  for ActiveRecord




* Deployment instructions

for deployment on rails it is quite easy
rails composites javascript into objects
any slight error in the project can set everything off
make sure there is a git repo in the file
Make sure you have committed everything to git.
make sure there is a schema folder
Run *bundle install


because we are using heroku and have some ussues witht he database

you need to remove the "comment out" for database.yml file

production:
  url: <%= ENV['DATABASE_URL'] %>
  because we are telling heroku to go directly to the database

you then need to comment out
<!-- # production:
#   <<: *default
#   database: flightm8_production
#   username: flightm8
#   password: <%= ENV['FLIGHTM8_DATABASE_PASSWORD'] %> -->
in order to fix the issue with error
*database user/name not existing ERROR*


To create a heroku projects
Run * heroku create
run * git push heroku master
to update the app for changes you have to run
* git push heroku master



heroku has sevearly limited database user prililedges so you have to do:
*heroku run rails db:schema:load

this will modify the database that already exists

now use command you normally used in your local but in your server for heroku to run it
this will migrate the data:
heroku run rails db:seed


* ...
