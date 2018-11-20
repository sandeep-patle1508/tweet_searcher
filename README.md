## Tweet Searcher

The objective of this project is to develop a web application where user can search for populat tweets using a keyword.

We have used Twitter Standard Search API - https://developer.twitter.com/en/docs/tweets/search/api-reference/get-search-tweets.html

Which return the tweets based on passed query parameters.

## System dependencies
* Ruby version: 2.5.1p57
* Rails version: 5.2.1
* OAuth Gem
* Bootstrap 4
* No active record

## Installation

Make sure you have [Ruby](https://www.ruby-lang.org) and [Bundler](http://bundler.io)

```sh
git clone git@github.com:sandeep-patle1508/tweet_searcher.git
cd tweet_searcher
bundle
```

Configure config/credentials.yml.enc to setup Twitter API key and token
```sh
EDITOR=vim rails credentials:edit
```

## How to run the test suite:
```sh
bundle exec rspec
```

## Run in local
```sh
rails s
```
Visit http://localhost:3000