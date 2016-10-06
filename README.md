# Seohelp

A Ruby gem to check a web site for SEO best practices

[![Build Status](https://travis-ci.org/dormi/seohelp.svg?branch=master)](https://travis-ci.org/dormi/seohelp)

## Installation

Seohelp is available as a ruby gem.

```sh
$ gem install seohelp
```

Or with Bundler in your Gemfile.

```ruby
gem 'seohelp', :require => false
```

## Usage

From ruby:

```ruby
require 'seohelp'

Seohelp.run('http://example.com')
```

Or from command line:

```sh
$ seohelp http://example.com
```

## Development

Tests are run using

```sh
$  bundle exec rake
```
