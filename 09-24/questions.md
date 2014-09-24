# Background Workers

Today we'll be adding background workers to the Iron Shop project in order to send emails out-of-band.

Main points:

* Rough idea of how a work queue system is structured
* How to implement one, both in Rails 4.2 and before
* Differentiating points between the available worker systems

[Check the diff](https://github.com/theironyard-rails-atl/iron-shop/compare/1413e6878d51f6564491143f5547d6d02ee9a11a...25ff04767739cf767f96db7af2f4f7113ad3b43f).

## Homework

Continue working on your group project, with an eye towards:

* Sending emails in the background
* The "price watch notification" feature (this could be a periodic job, or some other mechanism)
