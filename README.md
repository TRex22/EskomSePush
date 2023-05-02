# EskomSePush
A client for the EskomSePush API. See: https://documenter.getpostman.com/view/1296288/UzQuNk3E for documentation.

Visit https://eskomsepush.gumroad.com/l/api to get access to an API token.

This is an unofficial project and still a work in progress (WIP) ... more to come soon.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eskom_se_push'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install EskomSePush

## Usage

`id` is found using `areas_search` or `areas_nearby`.

```ruby
  require 'eskom_se_push'
  client = EskomSePush::Client.new(token: 'Your token here')

  client.status
  client.area_information(id: "eskde-10-fourwaysext10cityofjohannesburggauteng", test: "future")
  client.areas_nearby(latitude: "-26.0269658", longitude: "28.0137339") # Can submit as a Float too
  client.areas_search(text: "fourways")
  client.topics_nearby(latitude: "-26.0269658", longitude: "28.0137339") # Can submit as a Float too
  client.check_allowance

  # Historic data polls the EskomSePush Google sheet
  # Does not need authorisation but Google does throttle calls to their servers
  client.historic_data
```

### Endpoints
- Status
- Area Information
- Areas Nearby (GPS)
- Areas Search (Text)
- Topics Nearby
- Check Allowance
- Historic Data (Google Sheet returned as CSV)
- Constants

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Tests
To run tests execute:

    $ rake test

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/trex22/EskomSePush. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EskomSePush: project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/trex22/EskomSePush/blob/master/CODE_OF_CONDUCT.md).
