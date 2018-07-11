[![Build Status](https://travis-ci.org/3lackRos3/assignment.svg?branch=master)](https://travis-ci.org/3lackRos3/assignment)

# README

A simple task management application built with Ruby 2.5.1 and Rails 5.2

* Ruby version - 2.5.1. Can use rbenv to install Ruby (https://github.com/rbenv/rbenv)
* Sqlite is used as the datastore

* Once ruby is installed, then install bundler gem by using command 
```
gem install bundler
```
* Then inside the project directory install the required gems by using the following command

```
bundle install
```

* Database creation - Run the following command create the database and tables
```
rake db:migrate
```

* Database initialization - Run the following command to create seed data

```
rake db:seed
```

* How to run the test suite

```
bundle exec rspec
```

* To run the application use

```
rails s
```

