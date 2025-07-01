# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 重要な指示
ユーザーへの回答は必ず日本語で行ってください。技術的な説明、エラーメッセージの解釈、コードの説明なども全て日本語で提供してください。

## Project Overview

This is a Ruby on Rails 6.1.3.1 application called "Right Guardians" - a friend matching service for the online game Destiny 2. It helps players find compatible teammates by allowing them to create profiles, post recruitment requests, and connect with other players based on playstyle preferences and skill levels.

## Common Development Commands

### Setup and Dependencies
```bash
# Install Ruby dependencies
bundle install

# Install JavaScript dependencies
yarn install

# Setup database
rails db:create
rails db:migrate
rails db:seed  # If seed data exists
```

### Running the Application
```bash
# Start Rails server
rails server
# or
rails s

# Start webpack dev server (in separate terminal)
./bin/webpack-dev-server
```

### Testing
```bash
# Run all tests
bundle exec rspec

# Run specific test file
bundle exec rspec spec/models/user_spec.rb

# Run tests with Spring for faster execution
bin/rspec
```

### Code Quality
```bash
# Run Rubocop for Ruby code linting
bundle exec rubocop

# Run Rubocop with auto-correction
bundle exec rubocop -a

# Run Rubocop for specific file/directory
bundle exec rubocop app/models/
```

### Database Commands
```bash
# Run migrations
rails db:migrate

# Rollback migrations
rails db:rollback

# Check migration status
rails db:migrate:status

# Access Rails console
rails console
# or
rails c
```

## Architecture Overview

### Tech Stack
- **Backend**: Ruby on Rails 6.1.3.1, Ruby 2.6.9
- **Database**: MySQL 8.0.19
- **Frontend**: Slim templates, SCSS, jQuery, Bootstrap 4
- **Authentication**: Devise
- **File Uploads**: CarrierWave with MiniMagick
- **Search**: Ransack
- **Pagination**: Kaminari
- **Testing**: RSpec with FactoryBot
- **Deployment**: AWS (EC2, RDS), Nginx, Unicorn

### Key Models and Relationships

1. **User** - Core user model with Devise authentication
   - Has many friends (posts)
   - Has many posts (showcase posts)
   - Has many microposts
   - Has many relationships (follow/follower system)
   - Has many likes
   - Has many notifications

2. **Friend** - Recruitment posts for finding teammates
   - Belongs to user
   - Has many comments
   - Contains game-specific attributes (profession, strength, model, clan)

3. **Post** - Showcase/achievement posts
   - Belongs to user  
   - Has many likes (polymorphic)
   - Can have images

4. **Micropost** - Short status updates
   - Belongs to user
   - Has many comment_microposts

5. **Relationship** - Follow/follower system
   - Self-referential association on User model
   - Enables users to follow each other

6. **Like** - Polymorphic likes for posts
   - Belongs to user and post

7. **Notification** - Activity notifications
   - Tracks likes, comments, and follows

### Important Features

- **Guest User Login**: Special guest user functionality with limited permissions
- **Admin Users**: Can manage inappropriate content
- **Image Processing**: Uses CarrierWave with multiple versions (thumb, thumb50)
- **Real-time Features**: Uses Action Cable for some real-time updates
- **SEO**: Configured with meta-tags and sitemap generator
- **Analytics**: Integrated with Google Analytics

### Directory Structure Highlights

- `app/uploaders/` - CarrierWave uploader configurations
- `app/views/` - Slim templates organized by controller
- `config/deploy/` - Capistrano deployment configuration
- `public/uploads/` - Uploaded images storage (in development)
- `spec/` - RSpec test files with factories

### Key Configuration Files

- `config/database.yml` - MySQL database configuration
- `config/routes.rb` - All application routes
- `config/webpacker.yml` - Webpack configuration
- `.rubocop.yml` - Ruby style guide configuration

### Development Notes

- The application uses Slim templating instead of ERB
- jQuery is used extensively for AJAX operations
- Bootstrap 4 is the primary CSS framework
- Guest users are restricted from certain actions
- The app supports Japanese localization (devise-i18n)