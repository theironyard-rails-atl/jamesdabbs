## ActiveRecord relations

Add a toggle to the job board to let a user select whether they want to view all favorited posts, or just posts which are "active" (meaning the end date is in the future). Suggestion: in order to do

    current_user.favorited_jobs.active

you'll want to define an `active` scope on jobs.

## Job Board project

Continue to work on the job board project in groups.
