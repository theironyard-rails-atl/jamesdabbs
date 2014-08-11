## 1. Sinatra

Build a Sinatra app with at least 2 routes.

Some ideas:

* Elevator status check
* Take user input and display it reversed
* Paste text into a box and display a count of letters
* Run a game (like the guessing game) through a web app
  * Note: you'll need to use something like `session` to
    store state between requests
* Display data from an external API like `api.github.com/users/<username>/repos`
  * Will need to use something like HTTParty and JSON.parse

Bonus: deploy it to Heroku

## 2. Routing and MVC

We've seen how Sinatra lets us structure an app using routes (get / post) and
templates (erb / haml). This is MVC architecture:
- M)odel - business objects
- V)iew - template / display logic
- C)ontroller - handling the actual requests

Read up on [MVC in general](http://guides.rubyonrails.org/getting_started.html) and
[routing in particular](http://guides.rubyonrails.org/routing.html) (at least,
as handled by Rails).
