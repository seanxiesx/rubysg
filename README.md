# ruby.sg

This is the app for [ruby.sg](http://ruby.sg) - a community site for the Singapore Ruby Community!

## Contributing to ruby.sg

ruby.sh needs your help and we would love to see contributions from anyone in the community.

Please refer to the [PivotalTracker project](https://www.pivotaltracker.com/s/projects/948924) for details on features/bugs/chores that you can help with.

Alternatively, you can also raise feature requests, or bug reports on GitHub Issues.

The initial design of ruby.sh was contributed by [Tinkerbox Studios](http://www.tinkerbox.com.sg/). Mockups are available at `_assets`.

## Setup of Development Environment

### .env

You'll need to have a `.env` file ready in your app directory with the following keys:

    APP_SECRET_KEY=<you can put anything here>
    MEETUP_API_KEY=<your meetup api key>

To get your `MEETUP_API_KEY`, go to http://www.meetup.com/meetup_api/key/.

### Postgres

You'll need to have Postgres installed. The easiest way to get it working on a Mac is with http://postgresapp.com/.

## Workflow

Go ahead and fork the app, checkout a branch, work on a feature/bug/chore and submit it as a pull request.

### Core Contributors

I'll be adding folks as core contributors to the repo too when you chalk up enough contributions.

As a core contributor, you'll get direct access to the repo and can help with review and management of pull requests.
You'll also get access to PivotalTracker and possibly deployment rights in the future.

You'll also be listed in this readme as a core contributor!

### Voluntary Contributors

Fork away and just start writing code (with tests). Make a pull request when you are done.

I'm sure you can help with typos, design tweaks etc. The core contributors will review and merge in your pull requests.

## Testing

All features/bug fixes should come with tests. We're using RSpec.

To run tests, just run `rake` or `rspec` on console. `guard` is also available.

## Deployment

The app is currently deployed on Heroku. No fuss. No thrills.

## Questions

Please feel free to email me winstonyw@gmail.com.
