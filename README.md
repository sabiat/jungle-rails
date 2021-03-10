# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. This project was used to: 

- Become familiar with Ruby and the Rails framework
- Learn how to navigate an existing code-base
- Learn how to implement new features in unfamiliar territory using existing code style and approaches
- Apply previous learning tactics to research and become familiar with a new paradigm, language and framework
- Simulate the real world where feature and bug-fix requests are listed instead of step-by-step instructions on how to implement a solution

## Features implemented

#### Sold Out badge
- When a product has 0 quantity, a sold out badge is displayed on the product list page
#### Admin Features
- User must enter HTTP auth login/password to access admin functionality
- Admin users can list and create new categories
- Admins can add/remove products 
#### User Authentication
- A visitor can create an account and login as a user from any page
- A user can log out from any page
- A user cannot sign up with an existing e-mail address
#### Order Details 
- Displays all order details when order is placed including totals and the email used for order

## Screenshots

Product page
!["Product page"](https://github.com/sabiat/jungle-rails/blob/master/docs/homepage.png?raw=true)

Signup page
!["Signup page"](https://github.com/sabiat/jungle-rails/blob/master/docs/signup.png?raw=true)

Admin authentication
!["Admin-login"](https://github.com/sabiat/jungle-rails/blob/master/docs/admin-login.png?raw=true)

Check out page
!["Cart"](https://github.com/sabiat/jungle-rails/blob/master/docs/checkout.png?raw=true)

Order details
!["Order details"](https://github.com/sabiat/jungle-rails/blob/master/docs/order-details.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
