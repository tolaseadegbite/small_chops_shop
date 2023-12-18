# Ecommerce (food) webapp with custom admin
This project is written in Ruby on Rails 7. The purpose is to keep teaching myself about the framework.

(I AM LOOKING FOR A JUNIOR ROLE GUYS)
## Key Features
- Accept payment with Paystack (now owned by stripe)
- Ngrok for webhooks testing
- Version control with Git
- Model, controller and integration tests with Minitest
- File upload to aws
- Hotwire
- Background jobs with sidekiq
- Deploy to Fly
## Getting started
#### Admin credentials:
- email: admin@admin.com
- password: 123456

#### Normal user (You can simply create an account or use the below details)
- email: exampleuser@example.com
- password: 123456

## Demo

https://small-chops-shop.fly.dev
 
This was an interesting build for me, I got my hands dirty as it was my first time implementing Paystack. At first, it was difficult because there weren't tutorials online about it's combination with Rails, so I was left with two choices, read the docs in and out or give up. I chose to read  the docs and figure out things myself.
<br>
The second most impactful is setting up and working with ngrok to test webhooks. I was also able to use my previous knowledge to setup a background job to handle events.
<br>
Deploying to fly wasn't that straight forward, I ran into different issues such as firewall blocking and some postgres server errors. I was able to fix them.
<br>
- Bug: Image upload returns error 500 (I think it's a redis memory issue).
<br>
I would love to hear from the community on what I could have done better, thank you.