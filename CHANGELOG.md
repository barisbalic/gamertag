# CHANGELOG

## 2.0.0

* Completely re-written (inspired by [Octokit.rb](https://github.com/octokit/octokit.rb)), replacing a lot of old crappy code, updating to the Xbox Leaders 2.0 API throughout, dropping the XboxGamertag API and finally employing Faraday so the adapter can be configured/swapped out as the user sees fit.
* New licence.

## 1.1.0

* Added support for a gamertag's friends via `Gamertag::Friends`. 2 methods on this class, `friends` and
`online_friends` will return all friends and online friends, respectively.

## 1.0.3

* Escaping user input when creating an URI. Thanks to [lunks](https://github.com/lunks) for the pull request.

## 1.0.2

* Fixed each method on PlayedGames so that it works correctly

## 1.0.1

* Updates to project organization, code improvements and specs
* Add ability to initialize a SimpleProfile from existing JSON data [hypomodern]

## 1.0.0

* Initial release