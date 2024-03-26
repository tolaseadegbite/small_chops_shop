# Ecommerce Food Application

I am a self-taught web developer and this project was built to showcase some of my Ruby on Rails skills. I love solving problems with code and I chose an ecommerce application because because of its importance in business.

## The Problem

The food business sells different types of food, with each food items categorized in a menu. Customers can purchase either by walking into the physical store or by ordering on whatsapp, instagram or facebook. However, these has been working but not efficient because: 

- Potential customers doubts the legitimacy of business
- Selection of food items through different categories is stressful
- No records of purchased products
- Distractions by products from other business competitors / Advertisements
- Ordering on social media is time consuming compared to web or mobile applications
- Can't customise your shop
- Less features

## The Solution

I made some known online businesses as case study, learnt how to provide efficient solutions to the listed problems and derive from it logic for the application.

The solution needed to be simple, easy to maintain and operate, and deliver a more seamless flow and experience for both admin and consumers. It needed to use cutting-edge technology while keeping monthly costs to a minimum.

I opted on Ruby on Rails as a suitable technology since it allows for rapid development and its REST framework has all of the necessary capabilities. I chose a PostgreSQL database because it is reliable and works well with Ruby on Rails and Fly.io, which host the production application. Finally, I chose to use Hotwire as frontend framework and Amazon S3 for image hosting.

### Features

The application has the following features:
- Authentication
- Admin can perform CRUD applications for products, categories, banners
- Customers can create and delete reviews
- Customers can add products to wishlists
- Filter food items by category
- ActiveStorage for image uploads
- Amazon S3 for image hosting
- Custom admin panel for authorised users
- User authorization. Customers can only delete their reviews, see all their wishlists
- Bootstrap 5 framework for styling
- Checkout
- Payment gateway with Paystack (a subsidiary of Stripe)
- Webhook testing with Ngrok
- 95% test coverage

### Dependencies

- Devise (User authentication)
- Bootstrap (CSS Styling)
- Active storage validations (Validate attachments e.g., file type and size)
- Image Processing (for resizing images)
- Paystack (Payment processor)
- Guard and guard-minitest (Automatically runs test suite)
- aws-sdk-s3 (Integration with AWS to use image buckets)
- Sidekiq (Background jobs)
- Kaminari (for Pagination)
- Minitest (for testing)

### Making Pull Requests

- Fork this repo to your own GitHub account
- Clone your forked repo to your local machine git clone <ssh or https url>
- Set the upstream remote so you can stay synced with this repo git remote add upstream <ssh or https url>
- Create a branch on your forked repo git checkout -b <branch name>
- Add commits of discreet units of code along with descriptive commit messages
- Sync your forked repo and branch with this repo periodically following this flow
- Push your branch to your forked repo git push origin <branch name>
- Go to your forked repo on GitHub and make a pull request
- Ensure the description of the PR explains what your code does. If it is a UI change, include a screenshot
- Only commit relevant code/files
- Make sure the full test suite passes by running rails test:all

When you make a pull request, the GitHub Actions pipeline will run the test suite against your changes and will notify you of pass or fail. You can check the logs for errors, if any. Once the pipeline passes, your pull request will be reviewed and there may be feedback or questions related to your code, so please be prepared to follow up on those. Pull requests are usually reviewed daily. add bullets to the beginning of this set of instructions for an open source github repo for making contributions, and make sure the bullets achieve the

### Local Setup

Setting up locally:

- rails -v to ensure you have Rails 7.0.7.2 installed
- Run rbenv versions or rvm list rubies and confirm that Ruby 3.1.2 is installed
- psql --version to ensure you have PostgreSQL 12.11 installed (make sure you have a user and password)
- Fork the repository and copy SSH key
- git clone <'SSH Key'> to download application locally
- bundle install to install gems
- Setup your PostgreSQL database username and database password
- rails db:setup to create the database, load the schema, and load seed data
- bin/dev to run the local server
- bundle exec guard to run tests
- http://127.0.0.1:3000/ in your favourite browser to access the website

### Making a user an admin

- u = User.find(id)
- u.role = 'Admin'
- u.save

### Todos

- Advanced admin panel or roll in an admin gem
- Product search for customers
