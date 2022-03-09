# README

# Description
Sweater-Weather is a backend application designed to consume and expose API's in order to provide data on forecasts, users, sessions, and a planned roadtrip. In total, 3 API endpoints were consumed, and 5 were created.

# Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer


# Setup

# Ruby on rails
- Ruby 2.7.2
- Rails 5.2.6

# Gems
- gem 'faraday'
- gem 'figaro'
- gem 'jsonapi-serializer'
- gem 'capybara'
- gem 'rspec-rails'
- gem 'simplecov'
- gem 'shoulda-matchers'
- gem 'webmock'
- gem 'vcr'
- gem 'launchy'
- gem 'orderly'

# Setup

- Clone repository
- cd into the project file
```
$cd sweater-weather/
```
- Run Bundle Install to install all gems for this project

``` 
bundle install
```

- Output should be as follows
```
Using rake 13.0.6
Using concurrent-ruby 1.1.9
Using i18n 1.10.0
Using minitest 5.15.0
Using thread_safe 0.3.6
Using tzinfo 1.2.9
Using activesupport 5.2.6.2
Using builder 3.2.4
Using erubi 1.10.0
Using racc 1.6.0
Using nokogiri 1.13.3 (arm64-darwin)
Using rails-dom-testing 2.0.3
Using crass 1.0.6
Using loofah 2.14.0
Using rails-html-sanitizer 1.4.2
Using actionview 5.2.6.2
Using rack 2.2.3
Using rack-test 1.1.0
Using actionpack 5.2.6.2
Using nio4r 2.5.8
Using websocket-extensions 0.1.5
Using websocket-driver 0.7.5
Using actioncable 5.2.6.2
Using globalid 1.0.0
Using activejob 5.2.6.2
Using mini_mime 1.1.2
Using mail 2.7.1
Using actionmailer 5.2.6.2
Using activemodel 5.2.6.2
Using arel 9.0.0
Using activerecord 5.2.6.2
Using marcel 1.0.2
Using activestorage 5.2.6.2
Using public_suffix 4.0.6
Using addressable 2.8.0
Using bcrypt 3.1.16
Using msgpack 1.4.5
Using bootsnap 1.10.3
Using bundler 2.2.29
Using byebug 11.1.3
Using matrix 0.4.2
Using regexp_parser 2.2.1
Using xpath 3.2.0
Using capybara 3.36.0
Using coderay 1.1.3
Using rexml 3.2.5
Using crack 0.4.5
Using diff-lcs 1.5.0
Using docile 1.4.0
Using factory_bot 6.2.0
Using method_source 1.0.0
Using thor 1.2.1
Using railties 5.2.6.2
Using factory_bot_rails 6.2.0
Using faker 2.19.0
Using faraday-net_http 2.0.1
Using ruby2_keywords 0.0.5
Using faraday 2.2.0
Using ffi 1.15.5
Using figaro 1.2.0
Using hashdiff 1.0.1
Using jsonapi-serializer 2.2.0
Using launchy 2.5.0
Using rb-fsevent 0.11.1
Using rb-inotify 0.10.1
Using ruby_dep 1.5.0
Using listen 3.1.5
Using rspec-support 3.11.0
Using rspec-core 3.11.0
Using rspec-expectations 3.11.0
Using rspec-mocks 3.11.0
Using rspec 3.11.0
Using orderly 0.1.1
Using pg 1.3.3
Using pry 0.14.1
Using puma 3.12.6
Using sprockets 4.0.3
Using sprockets-rails 3.4.2
Using rails 5.2.6.2
Using rspec-rails 5.1.0
Using shoulda-matchers 5.1.0
Using simplecov-html 0.12.3
Using simplecov_json_formatter 0.1.4
Using simplecov 0.21.2
Using vcr 6.0.0
Using webmock 3.14.0
Bundle complete! 22 Gemfile dependencies, 86 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

```
- Run 
```
rails db:{drop,create,migrate,seed}
```

