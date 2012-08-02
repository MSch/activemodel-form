# ActiveModel::Form

ActiveModel lets you easily create objects that can be used in form helpers and even support round-tripping (assigning the submitted params again)

But ActiveModel doesn't support out of the box argument parsing, e.g. having a datetime attribute be a datetime attribute and a boolean attribute be a boolean attribute.

This fixes that.

ActiveModel::Form happened because the "tableless model" presented in
[RailsCast 219](http://railscasts.com/episodes/219-active-model) wasn't
as powerful as the "real deal" from [RailsCast 193](http://railscasts.com/episodes/193-tableless-model/).

## Installation

Add this line to your application's Gemfile:

    gem 'activemodel-form'

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
