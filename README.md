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

#10 install simple_form
$ rails generate simple_form:install
Running via Spring preloader in process 3325
SimpleForm 3 supports Bootstrap and Zurb Foundation 5. If you want a configuration that is compatible with one of these frameworks, then please re-run this generator with --bootstrap or --foundation as an option.
      create  config/initializers/simple_form.rb
       exist  config/locales
      create  config/locales/simple_form.en.yml
      create  lib/templates/erb/scaffold/_form.html.erb
__

#11 install devise
$ rails generate devise:install
Running via Spring preloader in process 2439
      create  config/initializers/devise.rb
      create  config/locales/devise.en.yml
===============================================================================

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

===============================================================================

#12 configure devise

1. add to: config/environments/development.rb:

config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }


2. Ensure you have flash messages in app/views/layouts/application.html.erb.

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>


3. $ rails g devise:views
Running via Spring preloader in process 2508
      invoke  Devise::Generators::SharedViewsGenerator
      create    app/views/devise/shared
      create    app/views/devise/shared/_error_messages.html.erb
      create    app/views/devise/shared/_links.html.erb
      invoke  simple_form_for
      create    app/views/devise/confirmations
      create    app/views/devise/confirmations/new.html.erb
      create    app/views/devise/passwords
      create    app/views/devise/passwords/edit.html.erb
      create    app/views/devise/passwords/new.html.erb
      create    app/views/devise/registrations
      create    app/views/devise/registrations/edit.html.erb
      create    app/views/devise/registrations/new.html.erb
      create    app/views/devise/sessions
      create    app/views/devise/sessions/new.html.erb
      create    app/views/devise/unlocks
      create    app/views/devise/unlocks/new.html.erb
      invoke  erb
      create    app/views/devise/mailer
      create    app/views/devise/mailer/confirmation_instructions.html.erb
      create    app/views/devise/mailer/email_changed.html.erb
      create    app/views/devise/mailer/password_change.html.erb
      create    app/views/devise/mailer/reset_password_instructions.html.erb
      create    app/views/devise/mailer/unlock_instructions.html.erb
__

4. $ rails generate devise User
Running via Spring preloader in process 2590
      invoke  active_record
      create    db/migrate/20190315203232_devise_create_users.rb
      create    app/models/user.rb
      invoke    test_unit
      create      test/models/user_test.rb
      create      test/fixtures/users.yml
      insert    app/models/user.rb
       route  devise_for :users

5. $ rake db:migrate
== 20190315203232 DeviseCreateUsers: migrating ================================
-- create_table(:users)
   -> 0.0013s
-- add_index(:users, :email, {:unique=>true})
   -> 0.0006s
-- add_index(:users, :reset_password_token, {:unique=>true})
   -> 0.0008s
== 20190315203232 DeviseCreateUsers: migrated (0.0030s) =======================

#13. Add Foreign Key Migration to Docs 

1. $ rails generate migration add_user_id_to_docs user_id:integer
Running via Spring preloader in process 2763
      invoke  active_record
      create    db/migrate/20190315204548_add_user_id_to_docs.rb

2. $ rake db:migrate
== 20190315204548 AddUserIdToDocs: migrating ==================================
-- add_column(:docs, :user_id, :integer)
   -> 0.0011s
== 20190315204548 AddUserIdToDocs: migrated (0.0014s) =========================


#14.
