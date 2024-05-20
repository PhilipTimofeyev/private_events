# Private Events

This is a Ruby on Rails back-end focused project for The Odin Project curriculum. 

Private Events demonstrates creating multiple models using `has_many` with a `through` table to create associations between Users and Events. Users are able to create accounts using the Devise gem, and then are able to create and attend events created by themselves and other users. 

This project demonstrates several skills:

- Creating the correct associations between models using a through table. 
- Using Active Record to find and display specific data, such as past/future events, or what users are attending a specific event.
- Creating class methods vs scopes to retrieve specific queries.
- Changing what views show based on query data, such as showing an *Attend* button if a User is not attending an event, or an *Unattend* button if a User is attending an event.



#### Future Implementations

In the next version, I would like to:

- Add the ability to make an event private.
- Allowing Users to invite each other to private events. 
- DRY up some of the views using partials.
- Add CSS to make improve the view of the site.
