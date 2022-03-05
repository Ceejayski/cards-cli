# Cards
Cards is the magicthegetthering unofficial ruby API client
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cards'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install cards

## Usage

Below are the different comand line arguents and their use case:
- `cards --groupby-set` or `cards -s` This get data from the api and groups response according to the set property value.
- `cards --groupby-set-rarirty` or `cards -r` This get data from the api and groups response according to the set property value and groups each sets it's rarity.
- `cards --groupby-set` or `cards -k` Returns a list of cards from the  **Khans of Tarkir (KTK)** set that ONLY have the colours `red` **AND** `blue`.

## Initial Analysis

**Cards::Magic.group_by_set**
This uses the `Net::HTTP` default module to fetch data from https://api.magicthegathering.io/v1/cards endpoint and converts the json response to a hash with symbolized keys.

**Cards::Magic.group_by_set**
This accepts an array of hashes and uses the enumarable method `group_by` to group cards according to their set, it returns an hash with `:set`property as the key and an array of cards with the same `:set` property as the hash values
```Cards::Magic.group_by_set([{set: 'pending', number: 1}, {set: 'pending', number: 2}, {set: 'closed', number: 3}]) == {"pending"=>[{set: 'pending', number: 1}, {set: 'pending', number: 2}], "closed" => [{set: 'closed', number: 3}]}```
**Cards::Magic.group_set_by_rarity**
This accepts an array of hashes and call the group_by_set to group cards according to their set while also grouping `:set` cards by `rarity`, it returns an hash with `:set`property as the key and an hash of cards with the same `:set` property grouped by rarity as the hash values
```Cards::Magic.group_set_by_rarity([{set: 'pending', rarity: "seen", number: 1}, {set: 'pending',rarity: "unseen", number: 2}) == {"pending"=>{"seen"=> [{set: 'pending', rarity: "seen", number: 1}], "unseen"=> [{set: 'pending', rarity: "unseen", number: 2}]}```
**Cards::Magic.group_set_by_colors**
This accepts an array of hashes and return an array where these conditions `:set = "KTK" && :colors.includes?('red') && :colors.includes? pass('blue')` passes.
```Cards::Magic.group_set_by_colors([{set: 'pending', colors: ['red','blue'], number: 1}, {set: 'KTK', colors: ['red','blue'], number: 2}]) == [{set: 'KTK', colors: ['red','blue'], number: 2}]```



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cards. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/cards/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cards project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/cards/blob/master/CODE_OF_CONDUCT.md).
