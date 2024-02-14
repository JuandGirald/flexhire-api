# Flexhire Technical Test - Backend

<p>Job Position: Full Stack Software Engineer</p>
<p>Candidate: Juan David Giraldo</p>

[Offer Link](https://flexhire.com/flexhire/full-stack-software-engineer)

## Quick start

```bash
# clone repo
$ git clone https://github.com/JuandGirald/flexhire-api

# change directory to cloned app
$ cd flexhire-api

# install dependencies
$ bundle install

# init database
$ rails db:create db:migrate db:seed

# install dependencies
$ rails s
```

## Environment Variables

To run this api localy an `local_env.yml ` file on project root is required with following variables

```bash
# REDIS_URL is required only for production environment but is included here to have it under the radar
REDIS_URL: <redis_url>
WEBHOOK_HOST: http://localhost:3000
FLEXHIRE_API_URL: https://flexhire.com/api/v2
```

> If you want to test webhook reception you can use ngrok, development host configuration is already suitable with it
