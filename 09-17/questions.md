# Sending Mail

## Summary

* SMTP(S) is a common mail-exchange protocol, similar in many ways to HTTP(S)
* Your server will need to render HTML / plain text views and send them to a user (via talking to an SMTP server, most likely)
* In Rails Mailers are analogous to Controllers. Specifically, Mailer : Controller :: mail : render

See also the [in-class commits](https://github.com/theironyard-rails-atl/books/compare/329b5e31752d154df35fb08ee8cb8f1bcb78591b...a0a3182037b3a42999c0734e0e6fa2d991d00b04)

## Going Further

* Note the user-side lag in waiting for the Rails server to coordinate with the SMTP server. How can we mitigate that? What if the SMTP server is down?
* Explore how the Devise emails (confirmation, password reset) work. How could you customize that process?

## Homework

* Deploy your team project, configure a mail sender (recommendations: Gmail or Mandrill SMTP), and set up Devise confirmation emails.
* Send an email whenever a friend recommends a book to you with a link back to the book on Heroku

I will expect those features in your team project for the week. If you don't implement it personally, be sure to do a code review.
