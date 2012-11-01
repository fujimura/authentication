# Authentication [<img src="https://secure.travis-ci.org/fujimura/authentication.png"/>](http://travis-ci.org/fujimura/authentication) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/fujimura/authentication)

## A minimalist authentication library for Ruby

## How to use

See an [example](https://github.com/fujimura/authentication-rails-example)

## Requirements

* Included class should have a method called `find_current_user` which returns the user object.
* Included class should have a method called `session` method which returns Hash-like object.

## Goal

The goal of this library is to provide standard authorization mechanism for web application with minimal dependency by short and concise code which can be understand easily.
