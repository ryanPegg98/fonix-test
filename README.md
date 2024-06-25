# Fonix Test

## Requirements

### Breif

We want to create a Web chat.

We'll start with a prototype which will have only one channel/room and all the
users subscribed will have access to the only available channel.

Users must be able to create an account providing a valid email address.
Once logged in users must be able to send and receive messages.

The system should send to all the users a weekly email specifying how many
messages were sent and received in the last week and the total number of
messages received since the user has sent his last message.

### Features

* User Authentication (Devise)
* Chatrooms (C-R-U)
* Messages  (C-R-U)
* Email Updates
* Dashboard
* Real-time-updates (HOTwire)

## Get Started

### Requirements

* Ruby 3.2.0
* Rails 7.1.3
* Postgresql
* Redis

### Setup

In order to get this application working you will need to generate your `database.yml` file by running the command below.

```bash
cp config/database.example.yml config/database.yml
```

When the file has been generated you will need to update the file to have the correct values. If you are using codespaces you will not need to make any changes.

The next step will be to bundle the application and set up the database ready to start the application.

```bash
bundle
bin/rails db:create
bin/rails db:schema:load
```

 ### Running

The easiest way to run this application would be to ensure foreman has been installed and then run the command to start using `Procfile.dev`

```bash
bin/dev 
```

To send the email with the stats for each user you can use the `StatsService` by using the command `StatsService.perform!` in the rails console. This could be added to a cron job to run every Monday at 9:00am when in production.

## Notes

This application can have multiple chatrooms that any user can create and anyone logged in can join them. It uses HOTWire to implement the real time updates for the messages which is a simple turbo-streama and turbo-frame.

It has a number of simple tests that check the users can log in, create and join chatrooms along with a simple test to ensure the service is returning a stats object that is valid even if they have not sent any messages.

### Improvements

The testing that has been implemented in this application is minimal. However, it has been applied to ensure them key features work and maintain consitency for future develoments.

I started to implement user permissions on chatrooms which would only allow "admins" of chatrooms to appove join requests and also allow them to remove users from the chatroom. This would be implemented via the `ChatroomUser` model with enums for roles and statuses. The use of the `ChatroomUser` model was inteneded to reduce the number of indexes in the messages table and also reduce duplicate references.

Other areas that could be improved include the user interface which could be seperated into components and imprted using SCSS. The user interface is only basic and was considered for mobile use. Given more time this could be easily improved. 

Another improvemet would be to show the stats on the home page so they can see it instantly. This would also require a additional bit of frontend work to send a request to an endpoint when a user has scrolled a message into view. This would one improve the accuracy of the "last viewed" messages while also allowing the system to present the "unread" messages based on which ones have been presented to the user.

The final improvement is a simple but effective piece of JavaScript to scroll the user to the latest message when a new message is posted. This will help the user to see the latest message.
