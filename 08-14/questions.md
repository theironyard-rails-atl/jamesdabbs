## 1. Warm-Up

Generate a new rails project and port an existing Sinatra app or command-line game over to rails.

## 2. Rails

Choose and build one of the following -

Any of them should have user accounts:
* Have a name and email
* Should be able to log in
  * Easier: assume users are trustworthy
  * Better: look at something like Devise

### Topic Tracker

This should allow people to post topics that they are interested in, and vote for ones that they are interested in.

* Topics
  * Have a title and description
  * Can be created by any logged in user, can only be edited by the poster
  * Users can :+1: topics they are interested in
  * Bonus: support markdown formatting in the description
* Search
  * Can find topics by: most upvoted, by a string in descriptions
* Going further
  * Allow users to comment on topics
  * Support login with github / facebook / etc.
  * Topics have categories / tags that can be used for filtering / searching

### Todo List

* User accounts
  * Each person has multiple lists
* Lists
  * Have a title and multiple todo items
  * Shouldn't show items once you mark them as complete
    * Has another page / control to show _all_ items
* Todo Items
  * Have a title. Can have a due date.
    * Past due items should be styled alarmingly
* Overview
  * Allow users to see a summary of all their items across all lists and past progress
* Going further:
  * Allow uploads on items

### Social Microblogging

* Users
  * Have followers / followees
  * Can post "messages" or "cheeps"
  * Have a profile they can update
  * Bonus: integrate with Facebook (or whatever) and get profile data
  * Bonus: use Identicons. You can have another site create them (https://github.com/cupcake/sigil) or make them yourself (https://rubygems.org/gems/identicon).
* Pages for each user with their messages and a button to follow
* Dashboard with messages from all users you follow
* Going further: privacy
  * Allow blocking people (can't follow you, see your messages or profile)
  * Allow protected accounts (must approve all followers)
