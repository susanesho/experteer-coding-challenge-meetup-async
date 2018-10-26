# Meetups In Munich
[![Build Status](https://semaphoreci.com/api/v1/susanesho/experteer-coding-challenge-meetup-async-3/branches/master/badge.svg)](https://semaphoreci.com/susanesho/experteer-coding-challenge-meetup-async-3)

## About Meetups In Munich

This is Ruby-on-rails application that will let users to search for meetups in Munich.

it makes use of [Meetup's API](https://secure.meetup.com/meetup_api/console/?path=/find/groups) to search for meetups in Munich and show past events' information for those meetups. 

## Pre Installation

Things you may need before making use of the app locally:

.......................................................................

* Login or create an account on [meetup](https://meetup.com)

* generate or copy [api key](https://secure.meetup.com/meetup_api/key/)

*  store the api_key in an environment variable

.......................................................................

## Installation
Follow the steps below if you have redis set up on your computer

.................................................................................

*  Clone the repository
*  store your api_key in an environment variable
*  run `bundle`
*  run `rails s` 

.................................................................................

NOTE: If you do not have redis set up, you can use homebrew to install redis

.................................................................................
* brew install redis
* brew services start redis
* rails s 

.................................................................................

You can now easily make as many request as you wish from the homepage :)
