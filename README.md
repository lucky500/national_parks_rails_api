# National Parks Look Up API
### By Luciano Oliveira

### _Epicodus Project in Ruby on Rails, Week 4 (12/15/2017)_

## Description

_This is an API that allows user to look up  parks in the US. It has CRUD functionalities, so users can create update and delete parks. Users can also search for a particular park record or receive a random route in return. This app was generated using the stripped down API rails version ```rails new your_api_app --api``` and it can be consumed in the front end, by any technology you like, such as ReactJS or Angular._


### Technologies used
* Ruby on Rails, sqlite3
* Rspec, Should-Matchers, Database Cleaner, FactoryBot and Faker for testing
* [Postman](https://www.getpostman.com/) to test the routes
* System dependencies

### Installation and setup

* Clone this repo

* On your terminal

```
bundle install
rake db:setup
rails db:seed
rails server
```

navitage to http://localhost:3000/v1/parks and download Postman at https://www.getpostman.com/ to check the routes.

you can also dowload this JSON plugin for a better viewing experience.
[JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en)

**_Here is a table of available endpoints_**

start with http://localhost:3000 and peg the routes to the end of the URL.

|  Request  | Endpoint Example | Data Returned |
| ------------- | ------------- | ------------- |
| GET  | /v1/parks  | List of all parks |
| GET  | /v1/parks/1 | Details about first park |
| GET | /v1/parks/random | A random park |
| GET | v1/parks?name=summer%20heights | Returns a particular park by name |
| GET | /v1/parks?address=worcester | Returns a particular park by address |
| POST | /parks | Create a new park by adding name, address and description |
| PUT | /v1/parks/3?address=New York City | Update a park with id 3 |
| DELETE | /v1/parks/5 | Delete park with id 5

## Contact Info

For questions and comments, feel free to contact me at luciano101@msn.com 

## License
This software is licensed under the MIT licensed

Copyright (c) 2017



