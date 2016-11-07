#mirror

#BADGES
![Build Status](https://codeship.com/projects/e2a7eab0-76c2-0134-3d00-422e6d119acf/status?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/nate01776/mirror/badge.svg?branch=master)](https://coveralls.io/github/nate01776/mirror?branch=master)
[![Code Climate](https://codeclimate.com/github/nate01776/mirror/badges/gpa.svg)](https://codeclimate.com/github/nate01776/mirror)
[![Issue Count](https://codeclimate.com/github/nate01776/mirror/badges/issue_count.svg)](https://codeclimate.com/github/nate01776/mirror)

#Heroku Link

https://mirror-nw.herokuapp.com/

#Description

Mirror is an app to handle the management of stylists and clients for salon owners. Owners can add their location, services and products. Stylists can join salons, associate with services and check upcoming appointments. Clients can search for a salon, look through service and product details and set up appointments.

#Ruby version

Ruby version 2.3.1

#Technologies Utilized

Ruby on Rails
Javascript
Devise for User Authenticaton
CarrierWave for Photo Uploads
Heroku for hosting
Codeship for continuous integration and deployment
CSS & Foundations for styling
JQuery
Factory_Girl, Capybara, RSpec for testing

#Viewing in the browser
Clone the repository
Request aws_key information and store in config/application.yml
$bundle install
$rake db:create
$rake db:migrate
$rails server
Visit http://localhost:3000 in your browser

#Running tests
Follow steps in 'viewing in the browser'<br>
$rake
