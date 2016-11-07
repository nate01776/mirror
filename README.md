#mirror

#BADGES
![Build Status](https://codeship.com/projects/e2a7eab0-76c2-0134-3d00-422e6d119acf/status?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/nate01776/mirror/badge.svg?branch=master)](https://coveralls.io/github/nate01776/mirror?branch=master)
[![Code Climate](https://codeclimate.com/github/nate01776/mirror/badges/gpa.svg)](https://codeclimate.com/github/nate01776/mirror)
[![Issue Count](https://codeclimate.com/github/nate01776/mirror/badges/issue_count.svg)](https://codeclimate.com/github/nate01776/mirror)

#Heroku Link

https://mirror-nw.herokuapp.com/

example salon owner account<br>
- username: test_owner@gmail.com / pw: mirror<br>
example salon stylist account<br>
- username: test_sylist@gmail.com / pw: mirror<br>
example salon client account<br>
- username: test_client@gmail.com / pw: mirror<br>


#Description

Mirror is an app to handle the management of stylists and clients for salon owners. Owners can add their location, services and products. Stylists can join salons, associate with services and check upcoming appointments. Clients can search for a salon, look through service and product details and set up appointments.<br>

#Ruby version

Ruby version 2.3.1<br>

#Technologies Utilized

Ruby on Rails<br>
Javascript<br>
Devise for User Authenticaton<br>
CarrierWave for Photo Uploads<br>
Heroku for hosting<br>
Codeship for continuous integration and deployment<br>
CSS & Foundations for styling<br>
JQuery<br>
Factory_Girl, Capybara, RSpec for testing<br>

#Viewing in the browser
Clone the repository<br>
Request aws_key information and store in config/application.yml<br>
$bundle install<br>
$rake db:create<br>
$rake db:migrate<br>
$rails server<br>
Visit http://localhost:3000 in your browser<br>

#Running tests
Follow steps in 'viewing in the browser'<br>
$rake
