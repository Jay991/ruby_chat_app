# Ruby Chat App

This is a simple chat application built with Ruby on Rails, using Redis for real-time messaging with ActionCable. It supports one-on-one and group chats with user authentication handled by Devise.

## Features

- User authentication with Devise
- Real-time messaging using ActionCable and Redis
- One-on-one and group chats
- Stimulus for front-end interactivity

## Getting Started

These instructions will help you set up and run the project on your local machine for development and testing purposes.

### Prerequisites

- Ruby 3.2.0
- Rails 7.0.4.2
- PostgreSQL
- Redis
- Node.js and Yarn

### Installation

1. Clone the repository:

```sh
git clone git@github.com:Jay991/ruby_chat_app.git
cd ruby_chat_app
```

2. Install the required gems:

```sh
bundle install
```

3. Install JavaScript dependencies:

```sh
yarn install
```

4. Set up the database:

```sh
rails db:create
rails db:migrate
rails db:seed
```

5. Start the Redis server:

```sh
redis-server
```

### Configuration

Ensure you have a `.env` file set up with necessary environment variables:

```sh
touch .env
```

Add the following lines to the `.env` file:

```
DATABASE_PASSWORD=your_database_password
REDIS_URL=redis://localhost:6379/1
```

### Running the Application

1. Start the Rails server:

```sh
rails server
```

2. Visit `http://localhost:3000` in your browser.

### Usage

- Sign up for a new account or log in with an existing account.
- Create a new chat or join an existing one.
- Start sending messages in real-time.

### Project Structure

- `app/models`: Contains the application's models.
- `app/controllers`: Contains the application's controllers.
- `app/views`: Contains the application's views.
- `app/javascript`: Contains the front-end JavaScript code.
- `config`: Contains the configuration files for the application.

### Key Files

- `app/channels/messages_channel.rb`: Handles real-time messaging.
- `app/controllers/messages_controller.rb`: Manages message creation.
- `app/models/message.rb`: Represents a chat message.
- `app/javascript/channels/messages_channel.js`: JavaScript client for ActionCable.

### Deployment

To deploy this application to a production environment, follow these steps:

1. Precompile the assets:

```sh
rails assets:precompile
```

2. Run the database migrations:

```sh
rails db:migrate RAILS_ENV=production
```

3. Start the Rails server:

```sh
rails server -e production
```


