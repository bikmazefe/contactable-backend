# Contactable API

## What is this?

This is a Rails API which serves as the backend for the [Contactable app](https://github.com/bikmazefe/contactable-frontend)

### Built with:

+ Rails 6.1.4
+ Ruby 3.0.0
+ MySQL

## Setup
1) Clone this repo
```
git clone https://github.com/bikmazefe/contactable-backend.git
```
2) cd into the directory
```
cd contactable-backend
```
3) Install the gems.
```
bundle install
```
4) Setup the database.
```
rails db:create db:migrate db:seed
```
5) Run the tests to make sure that everything is working properly.
```
rspec
```
6) Start the server
```
rails s
```
   * Make sure to use the default port 3000