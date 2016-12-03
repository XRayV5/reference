# Trike Trial Application

## About the app
This app is designed to help us evaluate potential recruits.

The app contains a single endpoint that returns shipping rates for a given country.

## Dependencies
* ruby 2.1.x
* bundler
* postgres

## Setup

```
  git clone git@github.com:tricycle/trike_trial.git

  bundle install

  rake db:create db:migrate
```

## Tests

Run the tests using:
```
  rspec spec
``` 


