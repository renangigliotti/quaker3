# Quaker3

The gem Quaker3 help you to parser Quake 3 Arena Server log file into list of games to extract statistics.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quaker3'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install quaker3

## Usage

To parser a Quake 3 Arena Server log file, use:

    $ Quaker3::Parser.new *file_path*

This method return a list of Game model.
To get a hash from games you need call .to_h 

    Quaker3::Game.to_h

The result:

    {
        "id" => "81f055b5-678c-4463-a21e-c74699073d7b",
        "total_kills" => 10,
        "kills" => [
            {  
                "killer" => "Isgalamido",
                "killed" => "Mocinha",
                "mode" => "MOD_ROCKET_SPLASH"
            },
            {  
                "killer" => "<world>",
                "killed" => "Mocinha",
                "mode" => "MOD_TRIGGER_HURT"
            },
            {  
                "killer" => "Isgalamido",
                "killed" => "Mocinha",
                "mode" => "MOD_ROCKET"
            },
        ]
    }

The Game model have a method to generate a hash into grouped information of match

    Quaker3::Game.to_h_grouped

The result:

    {
        "id" => "81f055b5-678c-4463-a21e-c74699073d7b",
        "total_kills" => 10,
        "players" => ["Isgalamido", "Mocinha"],
        "score" => [
            {  
                "name" => "Isgalamido",
                "total" => 5
            },
            {  
                "name" => "Mocinha",
                "total" => 3
            },
        ]
    }

The Game model have a method to generate a hash into grouped information by death cause of match

    Quaker3::Game.to_h_grouped_by_mode

The result:

    {
        "id" => "81f055b5-678c-4463-a21e-c74699073d7b",
        "total_kills" => 15,
        "data" => [
            {
                "mode" => "MOD_ROCKET",
                "total" => 10
            },
            {
                "mode" => "MOD_TRIGGER_HURT",
                "total" => 5
            }
        ]
    }

##Notes:

* if a player name is empty, will be sugest the name `(player)`
* if a player kills himself, the score will not be counted. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/renangigliotti/quaker3. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/renangigliotti/quaker3/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Quaker3 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/renangigliotti/quaker3/blob/main/CODE_OF_CONDUCT.md).
