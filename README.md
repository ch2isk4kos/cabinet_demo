# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.6.1

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Play-by-Play

#1
$ rails new cabinet
create  
      create  README.md
      create  Rakefile
      create  .ruby-version
      create  config.ru
      create  .gitignore
      create  Gemfile
         run  git init from "."
      ...

#2      
$ rails generate controller welcome index
create  app/controllers/welcome_controller.rb
      route  get 'welcome/index'
     invoke  erb
     create    app/views/welcome
     create    app/views/welcome/index.html.erb
     invoke  test_unit
     create    test/controllers/welcome_controller_test.rb
     invoke  helper
     create    app/helpers/welcome_helper.rb
     invoke    test_unit
     invoke  assets
     invoke    coffee
     create      app/assets/javascripts/welcome.coffee
     invoke    scss
     create      app/assets/stylesheets/welcome.scss

#3
$ rails s

#4
$ rake routes

#5 config/routes.rb
```ruby
Rails.application.routes.draw do
    get 'welcome/index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    #added:
    root 'welcome#index'
end
```

#6
$ rails generate model Doc title:string content:text
Running via Spring preloader in process 2753
      invoke  active_record
      create    db/migrate/20190314224325_create_docs.rb
      create    app/models/doc.rb
      invoke    test_unit
      create      test/models/doc_test.rb
      create      test/fixtures/docs.yml

#7
$ rake db:migrate
use the default values. Use `rails generate simple_form:install` to generate the Simple Form configuration.
== 20190314224325 CreateDocs: migrating =======================================
-- create_table(:docs)
  -> 0.0007s
== 20190314224325 CreateDocs: migrated (0.0008s) ==============================

#8