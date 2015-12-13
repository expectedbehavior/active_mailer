# ActiveMailer

Email needs to have somewhere to put the business logic surrounding it, and
the controller is not the place for that.

See the disagreement:
* http://www.robbyonrails.com/articles/2009/11/16/sending-email-controllers-versus-models
* http://twitter.com/dhh/status/5769040367
* http://twitter.com/dhh/status/5769698185
* http://www.loudthinking.com/posts/43-think-of-emails-as-views-delivered-through-smtp


## Installation

1. Add `gem "active_mailer"` to your `Gemfile` and run `bundle install`

2. Run `rails generate active_mailer:install`

3. Run `rake db:migrate`


## Basic Usage

There's only a partial generator. In the mean time, making a new ActiveMailer class can be done like this.

1. Run `rails generate model --no-migration --parent ActiveMailer::Base FooEmail`, you can pass any additional columns just like you would for a normal `generate model`.

2. Run `rails generate active_model:migration FooEmail`

3. Make the template for your email (in this case called `foo_email.rb`) in `app/views/active_mailer/base/default_action_mailer`

You're ready! You can send your email by making an instance of `FooEmail`, setting the appropriate details, and calling `send!`.

```ruby
> f = FooEmail.new(:subject => "My Awesome Email", :sender => "noreply@example.com",
>                  :recipients => "test@example.com")
=> #<FooEmail id: nil, blahblahblah>

> f.send!
=> true
```

## Advanced Usage

If your email is always going to have the same subject, sender, bcc, etc, then
you can set those in the ActiveMailer object. Remember that it's really just
an ActiveRecord object, so you can do anything in this class you can do in
ActiveRecord.

Here's an example of using ActiveRecord associations to make sure there's a
user for the email. It also includes setting the subject and sender by
default.

```ruby
class BeerEmail < ActiveMailer::Base
  belongs_to :user

  validates_presence_of :user

  def after_initialize
    self.subject = "It's Beer O'Clock"
    self.sender  = "itstime@beeroclock.com"
  end
end
```

## Contributing

Setup the project with `script/setup`.

We use the [Appraisal gem](https://github.com/thoughtbot/appraisal) to test against multiple versions of Rails. By default rake will test every supported version of Rails, but you can isolate a specific vesion by using `appraisal rails4.1 rake`.

The tests use a [micro Rails app](test/fixtures/dummy) that you should know about.

[Bugs/Feature](http://www.pivotaltracker.com/projects/14211)


## Authors

Matt Gordon


Copyright (c) 2009-2015 [Expected Behavior, LLC], released under the MIT license
