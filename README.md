# Authentication [<img src="https://secure.travis-ci.org/fujimura/authentication.png"/>](http://travis-ci.org/fujimura/authentication) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/fujimura/authentication)

## Minimalist authentication library for Ruby

## How to use

See an [example](https://github.com/fujimura/authentication-rails-example) or [spec](https://github.com/fujimura/authentication/blob/master/spec/authentication_spec.rb)

## Requirements

* Included class should have a method called `find_current_user` which returns the user object.
* Included class should have a method called `session` method which returns Hash-like object.

## Side-effects

* ```session[:current_user_id]``` in included module will be changed.
* ```@current_user``` in included module will be changed.

## Goal

The goal of this library is to provide standard authorization mechanism for web application with minimal dependency by short and concise code which can be understand easily.
