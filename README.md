# Small Chops Shop
A food ordering webapp

See project: https://small-chops-shop.fly.dev/

## The Problem

1. My client's finger food business operating in Nigeria faced inefficiencies in their sales process, which relied on physical store visits, WhatsApp, Instagram, and Facebook orders. Key pain points included: 

- Legitimacy concerns among potential customers
- Cumbersome food item selection through various categories
- Distractions from competitors' products and advertisements
- Inefficient social media ordering process
- Limited customization options

2. Payment gateway for online purchase

## The Solution

Collaborating closely with the client, I identified key requirements and developed effective solutions to address the aforementioned challenges. The goal was to create a simple, easy-to-maintain, and cost-effective solution that would enhance the user experience for both administrators and customers.

## Technical Solution

To achieve this, I selected:
- Ruby on Rails as the suitable technology for rapid development and its robust REST framework capabilities
- PostgreSQL as the reliable database management system, compatible with Ruby on Rails and Fly.io, the production application host
- Hotwire as the frontend framework for efficient and seamless user interaction
- Designed and implemented a seamless integration with Paystack, a leading payment processor, ensuring uninterrupted service delivery and enhanced customer experience
- Amazon S3 for secure and scalable image hosting

### Features

The application has the following features:
- Authentication and Authorization: Secure user authentication and authorization mechanisms to ensure only authorized access to administrative functions
- Admin Panel: A custom-built admin panel enabling administrators to perform CRUD (Create, Read, Update, Delete) operations on products, categories, and banners
- Customer Reviews: Customers can create and delete reviews, fostering a community-driven platform
- Wishlists: Customers can add products to wishlists, enhancing their shopping experience
- Product Filtering: Intuitive filtering functionality allowing customers to browse food items by category
- Image Management: Image uploads using ActiveStorage and Amazon S3 for secure and scalable image hosting
- User Permissions: Customers can only delete their own reviews and view their wishlists, ensuring data integrity and privacy
- Custom admin panel for authorised users
- User authorization. Customers can only delete their reviews, see all their wishlists
- CSS Framework: Bootstrap 5 ensures a responsive and visually appealing user interface
- Frontend Framework: Hotwire and Stimulus for dynamic and interactive user interface, providing a seamless user experience
- Checkout and Payment: Seamless checkout process integrated with Paystack for secure payment processing
- Testing Framework: Comprehensive testing suite, including controller and integration tests, guarantees application stability and performance

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
- Clone your forked repo to your local machine `git clone <ssh or https url>`
- Set the upstream remote so you can stay synced with this repo `git remote add upstream <ssh or https url>`
- Create a branch on your forked repo `git checkout -b <branch name>`
- Add commits of discreet units of code along with descriptive commit messages
- Sync your forked repo and branch with this repo periodically
- Push your branch to your forked repo `git push origin <branch name>`
- Go to your forked repo on GitHub and make a pull request
- Ensure the description of the PR explains what your code does. If it is a UI change, include a screenshot
- Only commit relevant code/files
- Make sure the full test suite passes by running `rails test:all`

### Local Setup

Setting up locally:

- `rails -v` to ensure you have Rails 7.0.7.2 installed
- Run `rbenv versions` or `rvm list rubies` and confirm that Ruby 3.1.2 is installed
- `psql --version` to ensure you have PostgreSQL 12.11 installed (make sure you have a user and password)
- Fork the repository and copy SSH key
- `git clone <'SSH Key'>` to download application locally
- `bundle install` to install gems
- Setup your PostgreSQL database username and database password
- `rails db:setup` to create the database, load the schema, and load seed data
- `bin/dev` to run the local server
- `bundle exec guard` to run tests
- http://127.0.0.1:3000/ in your favourite browser to access the website

### Making a user an admin

- `u = User.find(id)`
- `u.role = 'Admin'`
- `u.save`

### Todos

- Advanced admin panel or roll in an admin gem
- Product search for customers
- Create customer paystack id from webhooks (for efficiency)
