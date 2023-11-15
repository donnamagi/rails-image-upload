# Rails Image Upload

## Introduction

This Rails app demonstrates a user-friendly image upload feature. Utilizing Rails Active Storage combined with Turbo Frames, the app showcases dynamic but lean image upload capabilities.

## Core features

1. **Polymorphic Image Galleries**: The app leverages a polymorphic association to enable different models to have an associated image gallery, with minimal code repetition.

2. **User friendly uploads**: Users can upload one or multiple images at a time, enabling better UX. Formatting of the file uploads is handled by the image galleries controller.

3. **Reordering and deletion**: Users can easily rearrange their image galleries with drag-and-drop functionality, thanks to the `acts_as_list` gem and SortableJS. 


This demo application is meant to showcase the practical use of advanced Rails functionalities like Active Storage and Turbo Frames, and how they can be used to create a dynamic and interactive user experience inside Rails. Additionally, the polymorphic relationship model enables to keep the database structure lean and scalable. 

![Entity relations in the DB](https://github.com/donnamagi/rails-image-upload/blob/main/app/assets/images/ERD%20Image%20Galleries-2.svg)
This demo app is a featureset for articles – 'users' and 'projects' are only on the diagram to illustrate the possibility of associating an image gallery to different models.

## Prerequisites
- Ruby 3.0.0
- Rails 7
- PostgreSQL

## Setup

### Dependencies
Install Ruby dependencies:
```bash
bundle install
```

### Setting up the database
This application uses PostgreSQL. Once you have PostgreSQL installed and running:

```bash
rails db:create
rails db:migrate
```

## Running the Application
Start the server:
```bash
rails s
```

Also, a custom rake task for precompiling assets in development:
```bash
rails server:start
```

The application will be accessible at [http://localhost:3000](http://localhost:3000)
