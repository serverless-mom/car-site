

This readme is in two sections: the bit specific for Mike and this job process, and the general readme I'd always write.
# for Mike
## The stack I selected
Server Framework Rails 
JS Framework Angular 
UI Framework Bootstrap 
Database Postgres

## Things I would fix for a professional project
* commits are not squashed. I want to give as accurate a picture of my 'process' as possible so all origianl commits are here, even the ones where I realized I messed up.
* There are some validations but not all that are really required - I wanted to demonstrate that I could do this, but it's not in the requirements so I put in a 'bare minimum' on each model
* 'Users' and 'People' are totally seperate concepts, a bit like the 'user' is an insurance agent profiling multiple families. Anyway this seems kinda weird.

okay now here's the stuff that would be on this project for everyone
# CarSite demo app

## Notable features
* Devise-based signup and authentication
* Real Postgres-level constraints on 'users" - there are tons of Rails-level validations but `20160404031826_add_email_constraint_to_users` adds a constraint to validation that can't be easily circumvented 
* 'gender' is a string rather than a binary or dropdown - This is intentional and conforms with [requests from trans people](http://www.lgbt.cusu.cam.ac.uk/campaigns/think/forms/) that forms not force a binary on the respondents

## Known issues
* database.yml has raw credentials, something I would *never* do normally, but I wanted to make Postgres deploy as easy as possible for any reviewers.
* currently validation isn't bubbling back up to the form particularly well. This would probobably be my next features
* no authentication on API endpoints

## Requirements
* Ruby version 2.3.0

* System dependencies
    Bower, and presumably npm to get Bower
    A Bowerfile is included to grab Angular and Bootstrap

* Configuration
    If you have any config issues, please let [Toby](mailto:tobyfee@gmail.com) know!

* Database creation - You'll need PostgreSQL 9.3 installed/running and a user with l/p of "polish" and database creation privileges. 

* Database initialization - standard `bundle exec rake db:create` and `db:migrate`