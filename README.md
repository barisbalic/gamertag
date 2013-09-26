# Gamertag [![Build Status](https://travis-ci.org/barisbalic/gamertag.png)](https://travis-ci.org/barisbalic/gamertag) [![Code Climate](https://codeclimate.com/github/barisbalic/gamertag.png)](https://codeclimate.com/github/barisbalic/gamertag) [![Dependency Status](https://gemnasium.com/barisbalic/gamertag.png)](https://gemnasium.com/barisbalic/gamertag)

A simple wrapper for the [Xbox Leaders](https://www.xboxleaders.com/) 2.0 API, which allows you to pull back public information about an Xbox Live user with just their Gamertag.  This includes their profile, friends, games played and achievements.

## Divergence from API

The Xbox Leaders API has evolved recently and will probably continue to do so now that it has more focus from it's developer.  As a result I've made some choices that may not marry up completely with the API documentation, however I feel they are sensible/idiomatic, and where reasonable I've suggested to the Xbox Leaders team that they could make changes directly to the API.


## Installation

Add this line to your application's Gemfile:

    gem 'gamertag'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gamertag


## Documentation

LINK TO RDOC

### Examples

#### Override the adapter

```ruby
client = Gamertag::Client.new(:adapter => :em_http)
client.profile('Major Nelson')
```

#### Retrieve a user

```ruby
Gamertag.profile('Major Nelson')
=> #<Hashie::Mash avatar=#<Hashie::Mash full="http://avatar.xboxlive.com/avatar/Major Nelson/avatar-body.png" large="http://avatar.xboxlive.com/avatar/Major Nelson/avatarpic-l.png" small="http://avatar.xboxlive.com/avatar/Major Nelson/avatarpic-s.png"> badges=#<Hashie::Mash kinect_launch_team=true nxe_launch_team=true xbox_launch_team=true> biography="" freshness="new" gamerscore=63937 gamertag="Major Nelson" location="" motto="" name="" online=false presence="Last seen 1 minute ago playing Xbox.com" recent_activity=[#<Hashie::Mash achievements=#<Hashie::Mash current=36 total=69> artwork=#<Hashie::Mash large="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d8025454087c/1033/boxartlg.jpg" small="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d8025454087c/1033/boxartsm.jpg"> gamerscore=#<Hashie::Mash current=770 total=1625> id=1414793340 is_app=false last_played="1372305965" progress=52.2 title="Borderlands 2">, #<Hashie::Mash achievements=#<Hashie::Mash current=43 total=76> artwork=#<Hashie::Mash large="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d8024d530919/1033/boxartlg.jpg" small="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d8024d530919/1033/boxartsm.jpg"> gamerscore=#<Hashie::Mash current=825 total=1750> id=1297287449 is_app=false last_played="1372216446" progress=56.6 title="Halo 4">, #<Hashie::Mash achievements=#<Hashie::Mash current=28 total=63> artwork=#<Hashie::Mash large="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d80245410950/1033/boxartlg.jpg" small="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d80245410950/1033/boxartsm.jpg"> gamerscore=#<Hashie::Mash current=680 total=1600> id=1161890128 is_app=false last_played="1372131482" progress=44.4 title="Battlefield 3">, #<Hashie::Mash achievements=#<Hashie::Mash current=0 total=0> artwork=#<Hashie::Mash large="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d8025848085b/1033/boxartlg.jpg" small="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d8025848085b/1033/boxartsm.jpg"> gamerscore=#<Hashie::Mash current=0 total=0> id=1481115739 is_app=true last_played="1371965964" progress=0 title="Xbox Music and Video">, #<Hashie::Mash achievements=#<Hashie::Mash current=0 total=0> artwork=#<Hashie::Mash large="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d8024d530a1b/1033/boxartlg.jpg" small="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d8024d530a1b/1033/boxartsm.jpg"> gamerscore=#<Hashie::Mash current=0 total=0> id=1297287707 is_app=true last_played="1371335033" progress=0 title="Live Event Player">] reputation=20 tier="gold">
```

#### Retrieve games played by a user

```ruby
Gamertag.games('Major Nelson')
=> [#<Hashie::Mash achievements=#<Hashie::Mash current=1 total=31> artwork=#<Hashie::Mash large="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d802415607d3/1033/boxartlg.jpg" small="http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d802415607d3/1033/boxartsm.jpg"> gamerscore=#<Hashie::Mash current=5 total=1000> id=1096157139 is_app=false last_played="1132028299" progress=3.2 title="Gun">, …]
```

#### Retrieve friends of a user

```ruby
Gamertag.friends('Major Nelson')
=> [#<Hashie::Mash gamerpic=#<Hashie::Mash large="https://avatar-ssl.xboxlive.com/avatar/allad1nsane/avatarpic-s.png" small="https://avatar-ssl.xboxlive.com/avatar/allad1nsane/avatarpic-l.png"> gamerscore=21080 gamertag="allad1nsane" last_seen="1371973384" online=false status="Last seen 6/23/2013 playing Max Payne 3">, …]
```

#### Retrieve user's achievements

```ruby
Gamertag.achievements('Major Nelson', 1414793309)
=> [#<Hashie::Mash artwork=#<Hashie::Mash locked="https://live.xbox.com/tiles/4g/ym/0zc8P2NhbC9GWxoEGlxTWTVkL2FjaC8wL2EyAAAAAVBQUPyJDP4=.jpg" unlocked=""> description="Kill 20 enemies by knocking them off Columbia." gamerscore=25 id=36 secret=false title="Bon Voyage" unlock_date="1368255380" unlocked=true>, …]
```


## Contributors

As of 2.0, the codebase is completely re-written, however I'd like to thank [David Czarnecki](https://github.com/czarneckid) for his contributions, especially for putting up with the original crappy code.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2011-2013 Baris Balic, David Czarnecki.
See [LICENSE][] for details.

[license]: LICENSE.md