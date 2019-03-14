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

#0 Install Ruby Gems
* haml
* device
* simple_form

add the versions to the Gemfile then run:
$ bundle Install

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

*Change .html.erb files to .html.haml*

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
$ rails generate controller Docs
Running via Spring preloader in process 2865
      create  app/controllers/docs_controller.rb
      invoke  erb
      create    app/views/docs
      invoke  test_unit
      create    test/controllers/docs_controller_test.rb
      invoke  helper
      create    app/helpers/docs_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/docs.coffee
      invoke    scss
      create      app/assets/stylesheets/docs.scss

#9
added:
views/docs/new.html.haml
views/docs/_form.html.haml
__

#10
$ rails generate simple_form:install
Running via Spring preloader in process 3325
SimpleForm 3 supports Bootstrap and Zurb Foundation 5. If you want a configuration that is compatible with one of these frameworks, then please re-run this generator with --bootstrap or --foundation as an option.
      create  config/initializers/simple_form.rb
       exist  config/locales
      create  config/locales/simple_form.en.yml
      create  lib/templates/erb/scaffold/_form.html.erb
__

#11
