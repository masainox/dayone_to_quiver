# DayoneToQuiver

DayoneToQuiver is converter for Day One classic to Quiver.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dayone_to_quiver'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dayone_to_quiver

## Usage

	$ dayone-to-quiver entry DAYONE_ENTRY_FILE --output=./tmp/
	./tmp/DD950ADE-4D9B-4FFD-8874-8FF825D50C99.qvnote
	
	$ dayone-to-quiver journal DAYONE_JOURNALFILE --output=./tmp/ --name=import-notebook
	./tmp/b2a046a3-cc69-4e74-983b-f0de894fc4db.qvnotebook/A5380A52-F613-4A29-B1F6-A63921B46378.qvnote
	./tmp/b2a046a3-cc69-4e74-983b-f0de894fc4db.qvnotebook/DD950ADE-4D9B-4FFD-8874-8FF825D50C99.qvnote
	./tmp/b2a046a3-cc69-4e74-983b-f0de894fc4db.qvnotebook/21304A22-FD87-4C29-AC37-9AA317A18BC9.qvnote
	./tmp/b2a046a3-cc69-4e74-983b-f0de894fc4db.qvnotebook/9B25343B-397E-492C-B674-AC2D5290AD9B.qvnote

See also

	$ dayone-to-quiver help

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/masainox/dayone_to_quiver.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

