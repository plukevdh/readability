Readability
==========

Install
-------

Simply include 

`gem readability` 

in your Gemfile. `bundle`, and then run

`rails g readability:install`

This will create a `readability.yml` file in your config dir. All you'll need to configure 
at that point is to add your consumer key/secret and then add `readabilify` into controllers 
you want to use Readability api methods within.

To check if you have access, you can use before_filter or simply check with the `readabilified?` method:
```
before_filter :readabilified?
```

Once you want to make API calls to Readability, use the `readability` method to make calls. For example:

```
readabilty :bookmarks, {favorite: true}  # return a listing of all the bookmarks which are favorited.
readabilty :article, params[id]  # return an article
```

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
