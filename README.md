# guard-kemal

A [Kemal](http://kemalcr.com/) guard watcher plugin. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'guard-kemal'
```

And then execute:

    $ bundle


## Usage

Setup your `Guardfile` with this:

```ruby
#Guardfile
guard 'kemal', path: 'src', file: 'server.cr' do
  watch('src/server.cr') # watch the main kemal server
  watch(%r{src/.*\.ecr}) # watch your views
end
```

Once you've updated your `Guardfile`, you will just run the `guard` command like normal. Crystal will compile whatever file you specified by the `file` option (in this case "server.cr"), and this file should be located in your `path` option (in this case "./src"). Once Crystal compiles this file, then it will boot that file, and watch whatever you have set to watch. If one of these matched files are changed, guard will kill kemal, recompile the file, then reboot.

If you're using [Slang](https://github.com/jeromegn/slang) for your views, make sure to watch `%r{src/.*\.slang}`. This would watch any file ending in `.slang` located in your `./src/whatever/*.slang` where **whatever** could be something like `views`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jwoertink/guard-kemal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

