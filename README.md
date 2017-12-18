# Blog
This engine will add Blog capabilities to any of DevTechPeru´s projects.

## Usage
After following installation instructions, a new online store will be available at selected endpoint (ex. /blog). The main application's Devise user will be available, as well as all main Application Controller methods (and soon helpers). CanCanCan Roles can also be added to Engines own Ability class and they will be merged into main app's Ability class.

## Installation
Add these lines to your application's Gemfile:

```ruby
gem 'dotenv-rails', require: 'dotenv/rails-now' #must be loaded before blog for ENVs to be properly loaded
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
Blog.twitter_handle = "twitter_id"
Blog.use_main_app_header = true           #the partial landing/_header.html.erb must exist
Blog.use_main_app_footer = true           #the partial landing/_footer.html.erb must exist
Blog.use_main_app_javascripts = false     #the partial application/_javascripts.html.erb must exist
Blog.use_engine_header = false
Blog.use_engine_footer = false
Blog.blog_facebook_comments_app_id = "FB_APP_ID"   #blank if none
```

Some of the engines dependencies require configuration in the parent application


Act As Taggable

Blog requires gem acts_as_taggable_on be installed in parent application

```
gem 'acts-as-taggable-on', '~> 5.0'
```

after running bundle, run migrations with:

```
rails blog:install:migrations
rails acts_as_taggable_on_engine:install:migrations
rails db:migrate
```


Secrets

The following environment values need to be present in the parent application in order to provide required values to the blog engine:

.env

CARRIERWAVE_CONFIG_FOG_DIRECTORY="name of S3 bucket for carrierwave uploads"
S3_AWS_ACCESS_KEY_ID="S3 credentials for access to S3 bucket for carrierwave uploads"
S3_AWS_SECRET_ACCESS_KEY="S3 credentials for access to S3 bucket for carrierwave uploads"

User Authentication

Devise should be used in main_app and user structure modified to support first_name, last_name in devise views and controllers


User Roles and Authorizations

The blog engine requires the current_user.admin? method to be defined. This usually means that the user object has a role field in db and roles are defined like this:

enum role: [ :standard, :admin, :blogger ]

Additionally, the ability.rb model for cancancan must give the current_user enough permissions to manage the Post model. It is defined this way in the engine but main_app can override if it also includes this permission in main_app ability.rb


CkEditor

The following file needs to be present in the main app /assets/javascripts folder:

/app/assets/javascripts/ckeditor/config.js

```
CKEDITOR.editorConfig = function( config )
{
  // Define changes to default configuration here. For example:
  // config.uiColor = '#AADC6E';

  config.extraPlugins = 'fixed,clipboard,dialog,lineutils,widget,videodetector,tableresize,autosave,mathjax,wordcount,pastefromword,autogrow';
  config.mathJaxLib = '//cdn.mathjax.org/mathjax/2.6-latest/MathJax.js?config=TeX-AMS_HTML';
  config.autoGrow_onStartup = true;
  config.skin = 'moonocolor';
  config.language = 'es';
  /* Filebrowser routes */
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
  config.filebrowserBrowseUrl = "/blog/ckeditor/attachment_files";
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
  config.filebrowserFlashBrowseUrl = "/blog/ckeditor/attachment_files";
  // The location of a script that handles file uploads in the Flash dialog.
  config.filebrowserFlashUploadUrl = "/blog/ckeditor/attachment_files";
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
  config.filebrowserImageBrowseLinkUrl = "/blog/ckeditor/pictures";
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
  config.filebrowserImageBrowseUrl = "/blog/ckeditor/pictures";
  // The location of a script that handles file uploads in the Image dialog.
  config.filebrowserImageUploadUrl = "/blog/ckeditor/pictures";
  // The location of a script that handles file uploads.
  config.filebrowserUploadUrl = "/blog/ckeditor/attachment_files";

  config.allowedContent = true;

  // Toolbar groups configuration.
  config.toolbar = [
    { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source'] },
    { name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
    // { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
    // { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
    { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
    { name: 'insert', items: [ 'Image', 'Table', 'Mathjax', 'HorizontalRule', 'SpecialChar' ] },
    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
    '/',
    { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
    { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] }
  ];

  config.toolbar_mini = [
    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
    { name: 'styles', items: [ 'Font', 'FontSize' ] },
    { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
    { name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] }
  ];
};
```



## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
