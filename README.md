# ActiveMailer

Introduction goes here.

DHH thinks this is a bad idea and he's wrong. Email needs to have somewhere to put the business
logic surrounding it, and the controller is not the place for that.
http://www.robbyonrails.com/articles/2009/11/16/sending-email-controllers-versus-models
http://twitter.com/dhh/status/5769040367
http://twitter.com/dhh/status/5769698185
http://www.loudthinking.com/posts/43-think-of-emails-as-views-delivered-through-smtp


##Installation

1. `script/plugin install git://github.com/expectedbehavior/active_mailer.git`
2. Make the tables for the classes that ActiveMailer uses to store the people you send email to. There's no need to make the models; those are included with the gem.

``` ruby
class CreateActiveMailerTables < ActiveRecord::Migration
  def self.up
    create_table :email_users do |t|
      t.string :email_address
      t.timestamps
    end

    create_table :email_user_associations do |t|
      t.references :email_user
      t.string :emailable_type
      t.integer :emailable_id
      t.timestamps
    end
  end

  def self.down
    drop_table :email_users
    drop_table :email_user_associations
  end
end
```

##Basic Usage

There's no generator yet (high on the list of things to do). In the mean time, making a new ActiveMailer class can be done like this.

1. `script/generate model FooEmail # or whatever you want to call your email`
2. Open up the FooEmail model and change `ActiveRecord::Base` to `ActiveMailer::Base`
3. Open up the FooEmail migration and use `create_active_mailer_table` instead of the usual `create_table`.
``` ruby
# sample active mailer migration
class CreateFooEmail < ActiveRecord::Migration
  def self.up
    create_active_mailer_table :foo_emails do |t|
      t.integer :registration_id
      t.string  :kind
      t.timestamps
    end
  end

  def self.down
    drop_table :foo_emails
  end
end
```

4. Make the template for your email (in this case called 'foo_email.rb') in app/views/active_mailer/base/default_action_mailer

At this point, there's no need to do any more. You can send your email by making an object, setting the appropriate details, and calling send.

``` ruby
> f = FooEmail.new(:subject => "My Awesome Email", :sender => "noreply@example.com", :recipients => "test@example.com")
=> #<FooEmail id: nil, blahblahblah>
> f.send!
=> true
``` ruby

##More Advanced Usage

If your email is always going to have the same subject, sender, bcc, etc, then you can always set those things in the mail object. Remember that it's really just an ActiveRecord object, so you can do anything in this class you can do in ActiveRecord. Here's an example of using ActiveRecord associations to make sure there's a user for the email. It also includes setting the subject and sender by default.

``` ruby
class BeerEmail < ActiveMailer::Base
  belongs_to :user

  validates_presence_of :user

  def after_initialize
    self.subject = "It's Beer O'Clock"
    self.sender  = "itstime@beeroclock.com"
  end
end
```

##Contributing

Bugs/Feature
http://www.pivotaltracker.com/projects/14211

##Authors

Matt Gordon


Copyright (c) 2009 [Expected Behavior, LLC], released under the MIT license
