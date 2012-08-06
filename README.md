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

In the controller:

```ruby
class FormsController < ApplicationController
  class SearchForm < ActiveModel::Form
    self.model_name = 'q' # => <input name="q[username]" ... /> etc.
    attribute :username, :string
    attribute :created_at, :date_time
    attribute :locked, :boolean

    validates_presence_of :username
    validates_presence_of :created_at
  end
  
  def search
    @search = SearchForm.new(params[:q])
    if @search.valid?
      @users = User.where(username: @search.username) # ...
    end
  end
end
```

and the view:

```html
<%= form_for @search, url: form_path do |f| %>
  <%= f.text_field :username %><br />
  <%= f.datetime_select :created_at %><br />
  <%= f.check_box :locked %><br />
  <%= f.submit %>
<% end %>
```

If you use `simple_form` or `formtastic`, they automatically create date_time or boolean inputs based on your form object.

## Future

This gem doesn't hook into or monkey patches any Rails (or `simple_form` or `formtastic`) internals, it only uses the ActiveModel API. So it should be future proof.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
