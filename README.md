# Blog
This engine will add Blog capabilities to any of DevTechPeru´s projects.

## Usage
After following installation instructions, a new online store will be available at selected endpoint (ex. /blog). The main application's Devise user will be available, as well as all main Application Controller methods (and soon helpers). CanCanCan Roles can also be added to Engines own Ability class and they will be merged into main app's Ability class.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'blog', github: 'augustosamame/blog'
```

And then execute:
```bash
$ bundle
```

Mount the engine in your routes:

```
mount Blog::Engine, at: "/blog", as: "Blog"
```

## Configuration

#set up configuration for blog engine

```
config/initializers/blog.rb


Blog.blog_layout = "blog-timeline-right-sidebar"
Blog.show_twitter_sidebar = false
```

Some of the engines dependencies require configuration in the parent application


Act As Taggable

Blog requires gem acts_as_taggable_on be installed in parent application

```
gem 'acts-as-taggable-on', '~> 5.0'
```

after running bundle, run migrations with:

```
rake acts_as_taggable_on_engine:install:migrations
```


Secrets

The following secrets need to be present in the parent application in order to provide required values to the blog engine:

CARRIERWAVE_CONFIG_FOG_DIRECTORY: "name of S3 bucket for carrierwave uploads"
S3_AWS_ACCESS_KEY_ID: "S3 credentials for access to S3 bucket for carrierwave uploads"
S3_AWS_SECRET_ACCESS_KEY: "S3 credentials for access to S3 bucket for carrierwave uploads"

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
