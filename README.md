# comp120-spring2016-team10
Matteo Davis, Alex Ravan, Jacob Katsiaficas, John Gallagher 
Updated: 2/25/16

## Ruby Packages Used
Rails
postgresql
bundler

	Gemfile:
		gem 'rails', '4.2.5.1'
		gem 'pg', '~> 0.15'
		gem 'sass-rails', '~> 5.0'
		gem 'uglifier', '>= 1.3.0'
		gem 'coffee-rails', '~> 4.1.0'
		gem 'jquery-rails'
		gem 'turbolinks'
		gem 'jbuilder', '~> 2.0'
		gem 'sdoc', '~> 0.4.0', group: :doc
		gem 'bootstrap-generators', '~> 3.3.4'
		gem 'capybara'
		gem 'factory_girl_rails', '~> 4.6'
		gem 'rspec-rails'

## installation & startup
Install Rails v4.2.5.1, Postgresql v9.4.5, Ruby v2.3.0p0
Run "bundle install" for necessary gems.
Set up a Postgresql DB for "ncdntt-development", "ncdntt-production", and "ncdntt-test"
Start postgresql
run "rails s", and open the port in your browser (most likely localhost:3000)

## Testing

The testing suite we're using is rspec combined with FactoryGirl, both installed via Ruby gems.
FactoryGirl allows us to create a Factory, with a sample version of our incident which we will
pass to the various methods of the controller. 
We wrote tests for basic functions of our models and controllers.
To run the model tests, from the 'ncdntt' directory, run:
"rspec spec/models/incident_model_spec.rb"

These tests check for the validation of all of our required fields.

To run the controller tests, from the 'ncdntt' directory, run: 
"rspec spec/controllers/incident_controller_spec.rb"

These tests check for the creation and addition of new incidents to our database
and the proper rendering of our :show, :create, :edit, and :new templates.

## Other APIs and Dependencies
Bootstrap

## Hours Spent Learning Ruby
2 hours

## Hours Spent Implementing MVP
14 hours

## Challenges We Faced
We faced a few challenges in setting up -- the first of which was getting everyone
set up on Rails, Ruby, and Postgres with the proper versions. This took us a few hours 
because we were running on two different environments -- two people are on Mac OS 10 
and one is using the Debian VM provided to the class, so there were two different sets 
of issues faced. The most issues were posed by setting up Postgresql, we had trouble
with user accounts and permissions. 

## Why We Chose Rails
We chose Rails because it is the most robust of the Ruby frameworks -- it is easily
managed by RVM and does most of the heavy lifting for the developer. In addition,
due to its recent popularity, there is a wealth of information on almost any problem
we could run into online. 

## Why We Chose Postgresql
We had two viable options of DB -- Postgresql and MySQL. We honestly chose Postgresql
because it seemed like the more popular option, and thus there would be more support 
for it, both in class and online. We haven't had any issues thus far so we are happy 
with our choice. 
