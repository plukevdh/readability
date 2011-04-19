Readability
==========

Install
-------

Simply include 

`gem readability` 

in your Gemfile. `bundle`, and then run

`rails g readability:install`

This will create a `readability.yml` file in your config dir. All you'll need to configure 
at that point is to add your consumer key/secret and then add `acts_as_readability` into controllers 
you want to use Readability api methods within.

The installer will give further instructions on how to configure your app once ou install.

API Docs
--------

I'm working on documenting more of the code and putting together an actual API, but really, it just
references the Readability API, found at [http://readability.com/publishers/api][1].

Contribute
----------

This is a pretty basic API, so do your worst:

* fork
* fix
* write tests (yes I know I didn't...)
* pull request!

License
-------

See MIT-LICENSE.

[1]: http://readability.com/publishers/api