# README

# <a href='https://vast-eyrie-92592.herokuapp.com/home'>Book Caffe</a>
This is where books lovers comme together, create a discussion topic on their favorite books and engage with their fellow book lovers. No restriction, speak your mind regarding a book. Your opinion is always welcomed here.


# Project Features

* A visitor can browse the home page and books library without signing in
* A user/ visitor can search books by title
* A user can sign up, login and log out properly
* A user can access discussions pages, post a new discussion or comment on a discussion once signed in
* A discussion created mst be about a book, and a comment must be on a discussion
* A user can see other users profile
* A user can only delete the discussion or comments he/she created
* A user can update a comment he/she posted
* Only an administrator can delete an account or remove books from the library

# Project Models

* User: has many discussions and comments
* Book: has many discussions 
* Discussion: belongs to  an user and a book
* Comment: belongs to an user and a discussion


# Languages and Frameworks
 
* Ruby 2.6.1p33
* Rails 6.0.3.2
* Bootstrap 4.0.0

# Databases

* SQLite (Test, Development)
* PostgreSQL (Production)

# Getting Started

Clone this repo to get started and cd into the directory

$ git clone https://github.com/vanessuniq/books_discussions.git
$ cd books_discussions

* Add needed  packages
$ yarn add jquery bootstrap
$ bundle install --without production

* Migrate Database
$ rails db:migrate

* run the test suite
$ rake test

If the test suite passes seed the database and run the app on local server
$ rails db:seed
$ rails s
