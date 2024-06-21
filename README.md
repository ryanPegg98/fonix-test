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
