# Flyml

Application settings convention over YAML.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flyml'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flyml

## Usage

Flyml convention is based on the following premises:

  - Configuration is stored in YAML files.
  - Configuration files are stored in a ``config`` directory within your project root directory.
  - Files are divided by application execution environment.

Let's see an example. Imagine you have a configuration file ``your_project/config/redis.yml``, which content is:

```ruby
---
development:
  host: dev.local
  port: 6379

test:
  host: test.local
  port: 6379
```

Here's how you would use Flyml:

```ruby
require 'flyml'

Flyml.env = 'development'
Flyml.root = '/path/to/project_root'

Flyml[:redis][:host] # 'dev.local'
Flyml[:redis][:port] # 6379
```

## ToDo

- Default env and root
- Review and question Values implementation, seriously.
- Rails magic?
- DaemonKit magic?
- Env vars magic?

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/peertransfer/flyml. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).