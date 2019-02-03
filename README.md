## Chitter Challenge

The task is to complete a very basic clone of Twitter, called 'Chitter' where users can post messages 'peeps.'

This is to be built using Ruby, Rails and the ActiveRecord ORM. The 'Devise' gem is used for User Authentication.

It is my first time using both Rails and Devise.

## What does it do:

A user should be able to go to the homepage, where they will be able to view a preview of all previously submitted 'peeps' and then post a new 'peep'.

If they click on a previously submitted 'peep' they will be able to view the whole 'peep' and will have the option of editing it, or deleting it. However, they can only edit or delete their own peeps.

There will also be 'sign-up', 'sign-in' and 'log-out' functionality, so that only the logged-in user can post messages as themselves.

## Link to my Chitter App hosted on Heroku:
Here, you can sign-up as a user and use my app to post messages. (Please keep them clean!!!)
```
https://young-brook-14168.herokuapp.com/
```

## Youtube link to Screen Recording:
This shows me using the Chitter App. I sign-up as three different users (Pauline, William and Rob), post peeps, and attempt to update/delete other users peeps.
```
https://youtu.be/LKd9Pafc7-Q
```

## Below are the user stories:
```
As a user
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a user
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
