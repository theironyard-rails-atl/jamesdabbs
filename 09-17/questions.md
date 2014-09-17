# Sending Mail

## Summary

* SMTP(S) is a common mail-exchange protocol, similar in many ways to HTTP(S)
* Your server will need to render HTML / plain text views and send them to a user (via talking to an SMTP server, most likely)
* In Rails Mailers are analogous to Controllers. Specifically, Mailer : Controller :: mail : render

## Going Further

* Note the user-side lag in waiting for the Rails server to coordinate with the SMTP server. How can we mitigate that? What if the SMTP server is down?
* Explore how the Devise emails (confirmation, password reset) work. How could you customize that process?

## Homework

* Deploy your team project, configure a mail sender (recommendations: Gmail or Mandrill SMTP), and set up Devise confirmation emails.
* Send an email whenever a friend recommends a book to you with a link back to the book on Heroku

I will expect those features in your team project for the week. If you don't implement it personally, be sure to do a code review.
