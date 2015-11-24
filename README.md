# Authentication [<img src="https://secure.travis-ci.org/fujimura/authentication.png"/>](http://travis-ci.org/fujimura/authentication) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/fujimura/authentication)

## Minimalist authentication library for Ruby

## Install

```
$ gem install authentication
```

or add ```gem 'authentication'``` to your Gemfile.

## How to use in a Rails app

0. Include `Authentication` to your controller.
1. Define `#find_current_user` in your controller.
2. That's all. You can use the method below in the controller:
  - `#login!` and `#logout!` to log in/out.
  - `#current_user` and `#current_user_id` to get current user or its id.
  - `#logged_in?` to ask logged in or not.

[Example](https://github.com/fujimura/authentication_rails_example) and [spec](https://github.com/fujimura/authentication/blob/master/spec/lib/authentication_spec.rb) might be also helpful.

## Advanced usage

Under the hood, methods above(`current_user` etc.) are delegated to the instance of `Authentication::Authenticator`, which is built for "current_user". So, it's possible to create custom authenticator for a client which isn't a current user.

## Side-effects

* ```session[:current_user_id]``` of the class includes `Authentication` will be changed.
* The class includes `Authentication` will include `Forwardable`.
* The class includes `Authentication` will have a method called `current_user_authenticator`.

## Goal

The goal of this library is to provide standard authorization mechanism for web application with minimal dependency by short and concise code which can be understand easily.
