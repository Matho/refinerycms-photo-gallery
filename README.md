# Refinery CMS Photo Gallery

__Photo gallery engine for Refinery CMS.__

## Requirements

Currently unreleased version 0.4.x in master branch supports Rails 6.0.x and (unreleased) Refinery CMS ~> 5.0

Previous branches supports:
* 0-3-stable: Rails 5.1.x and Refinery CMS ~> 4.0.3
* 0-2-stable: Rails 4.2.x and Refinery CMS ~> 3.0.0
* 0-1-stable: Rails 3.2.x and Refinery CMS ~> 2.0.3

## Features

* Multiple photo uploading with [Plupload](http://www.plupload.com/) 2.1.9
* Only HTML5 runtime is supported
* Client side photo resizing to do faster uploading on slow connections
* Server side resizing with Carrierwave
* Attach album to page. One album can be attached to many pages.
* Grouping albums to collections. Album can be placed in one or more collections.
* Ajaxified photo editation during uploading
* Reading EXIF records from file - GPS latitude/longitude, photo title, photo description (In Linux you can put EXIF data using [digiKam](www.digikam.org/) )
* Multiple photo editing at once
* Fully configurable, searchable
* Using [Fancybox](http://fancyapps.com/fancybox/) 2.0.6 for frontend image slideshow. Read Fancybox license before you
use it on profit websites.
* Fragment caching on frontend
* Ajaxified pagination with history.pushState on frontend

## Screenshots

All screenshots are in branch screenshots

![Photo uploading](https://raw.github.com/Matho/refinerycms-photo-gallery/screenshots/screenshots/07_photos%23upload-uploading_2.png)
![Frontend album](https://raw.github.com/Matho/refinerycms-photo-gallery/screenshots/screenshots/11_frontend_show.png)
![Frontend album](https://raw.github.com/Matho/refinerycms-photo-gallery/screenshots/screenshots/12_show_photo_using_fancybox.png)


## Options

* choose runtimes
* set max file size
* on/off client side resizing
* set plupload locale
* file extensions white list
* delete original files after resizing to save disk space
* set dimmensions of photo versions without need to override uploader


## Language

Gem is fully translated to de, en, no, pl, sk, zh-CN languages. Plupload is translated to 24 languages. You can add your own to
photo_gallery/app/assets/javascripts/refinery/photo_gallery/admin/plupload/i18n and enable it in config.plupload_locale

## Browser support
Client side image resizing with Plupload is possible on Firefox 3.5+ (with fixed quality) and Chrome.
Safari doesn't support direct data access to the selected files. Opera 12.00 + supports drag&drop and also client side image resizing.


## Installation for ~> 0.3.0

Make sure, you [have installed ImageMagick](http://www.imagemagick.org/script/install-source.php#unix) and ImageMagick dev.
On Ubuntu 12.04 you can install dev suite with commands:

```ruby
sudo apt-get install libmagickcore-dev libmagickwand-dev
```

Then you need to install command-line Exiftool application.
Instructions for installation you can find under [www.sno.phy.queensu.ca/~phil/exiftool/install.html](www.sno.phy.queensu.ca/~phil/exiftool/install.html).


Open up your ``Gemfile`` and add at the bottom this line:
* for edge version:
```ruby
gem 'refinerycms-photo-gallery', '~> 0.3.0', :github=>"Matho/refinerycms-photo-gallery", :branch=>"master"
```

* for latest stable version
```ruby
gem 'refinerycms-photo-gallery', '~> 0.2.0'
```

Now, run 

```ruby
bundle install
```

Next, to install the photo gallery plugin run:

```ruby
 rails g refinery:photo_gallery
```

Run database migrations:

```ruby
rake db:migrate
```

Seed your database:

```ruby
rake db:seed
```

Override pages/show.html file using
```ruby
rake refinery:override view=pages/show.html.erb
```
and at the bottom of file append:
```ruby
<%= render "/refinery/photo_gallery/albums/show" %>
```
It will ensure album photos will be shown. Change it according your needs. 


You have to change list of custom manifest files in your ror app. Copy following values to your app's config/initializers/asset.rb file: 
```ruby
Rails.application.config.assets.precompile += [
"refinery/photo_gallery/admin/photo_gallery.css",
"refinery/photo_gallery/admin/chosen.css",
"refinery/photo_gallery/admin/icons/loading.gif",
"refinery/photo_gallery/admin/photo_gallery.js"
]
```

Then you need to override PagesController in admin namespace. In your terminal run:
```ruby
rake refinery:override controller=admin/pages_controller
```
Then open this overriden file in your app's folder - app/controllers/refinery/admin/pages_controller.rb Look for permitted_page_params method and add check for another attribute:
```ruby
album_page: [:album_id]
```

It should look like: 
```ruby
def permitted_page_params
    [
      :browser_title, :draft, :link_url, :menu_title, :meta_description,
      :parent_id, :skip_to_first_child, :show_in_menu, :title, :view_template,
      :layout_template, :custom_slug, parts_attributes: [:id, :title, :slug, :body, :position], album_page: [:album_id]
    ]
end
```

## Configurations && Fancybox installation

You can configure gem in ``your_app_name/config/initializers/refinery/photo_gallery.rb``

If you want to use ajaxy pagination, copy ``app/assets/javascripts/refinery/photo_gallery/photo_gallery.js`` to your app's asset and add to manifest.

Check, if you have ``jquery.js`` included in your backend.

If you want to use Fancybox on frontend, copy ``photo_gallery/app/assets/images/refinery/photo_gallery/fancybox``, ``photo_gallery/app/assets/javascripts/refinery/photo_gallery/fancybox``, ``photo_gallery/app/assets/refinery/photo_gallery/stylesheets/fancybox`` to your
refinery cms assets directory.

Then you need to add fancybox js files to your js manifest file in ``your_app_name/app/javascripts/application.js``:

```ruby
//= require fancybox/jquery.fancybox.pack
//= require fancybox/lib/jquery.mousewheel-3.0.6.pack
//= require fancybox/helpers/jquery.fancybox-buttons
```

And fancybox css files in ``your_app_name/app/stylesheets/application.css``:

```ruby
*= require jquery-ui-1.8.21.custom
*= require fancybox/jquery.fancybox
*= require fancybox/helpers/jquery.fancybox-buttons
```

And initialize Fancybox in your_app_name/app/views/refinery/_javascripts.html.erb. If you don't have this file
in your app, override it using rake refinery:override command and add this line to it:

```javascript
<script type="text/javascript">
 $(document).ready(function() {
        $(".fancybox").fancybox({
                    prevEffect		: 'none',
                    nextEffect		: 'none',
                    beforeShow : function(){
                      this.title =  $(this.element).attr('data-title');
                    },
                    helpers : {
                        title	: { type : 'outside' },
                        buttons	: {},
                        overlay : {
                            opacity: 0.8,
                            css : {
                                'background-color' : '#000'
                            }
                        }
                    }
                }

        );
    });
</script>
```

If you want to use Fancybox 1.3, use this javascipt to initialize:
```javascript
<script type="text/javascript">
    $(document).ready(function() {
        var load_fancybox = function loadFancybox() {
            $("a[rel=group]").fancybox({
                'transitionIn'		: 'none',
                'transitionOut'		: 'none',
                'titlePosition' 	: 'over',
                'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
                    return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                }
            });
        };
        load_fancybox();

        $("#photo_gallery").on("gallery_loaded", function() {
            load_fancybox();
        });

    });
</script>
```

Before production, don't forget to precompile assets by:

```ruby
rake assets:precompile
```
## Uninstall

```ruby
rails destroy refinery:photo_gallery
```
From your app db/migrate dir, remove migrations from

``20120805130459_create_collections.refinery_photo_gallery.rb``

to 

``20120805130463_add_indexes.refinery_photo_gallery.rb``

Remove database tables. Run multiple times to remove all photo gallery tables:

```ruby
rake db:rollback
```
Remove fancybox assets folders, which you copied to you app assets and also remove them from your js/css manifests.

Remove fancybox init javascript from _javascripts.html.erb file

Remove gem from Gemfile

## Testing
* cd to this engine path
* bundle install
* rake refinery:testing:dummy_app
* Add at the end of file `Rails.application.config.assets.precompile += %w( refinery/photo_gallery/admin/jquery.chosen.min.js refinery/photo_gallery/admin/photo_gallery.js refinery/photo_gallery/admin/photo_gallery.css refinery/photo_gallery/admin/chosen.css refinery/photo_gallery/admin/icons/loading.gif refinery/wymeditor.js )` to `spec/dummy/config/initializers/assets.rb`
* rake spec

## Todo list

* show live links in admin
* create pop-up window to upload photos from pages area, like page-images
* add checkboxes to delete multiple/all photos in album
* stop uploading
* add support for amazon S3 storage
* travis, codeclimate

## Code
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/Matho/refinerycms-photo-gallery)

## Known bugs

* Files with spaces in file names are rejected if you upload them using drag&drop
* Due to Opera bug I turn off Plupload client side mime type validation. It is able to choose files with non valid
file extensions to upload queue. ( But server side validation reject these files.).

## Road map ?

* GPS editing in degrees,minute,seconds format 
* album/photo tags using acts_as_taggable ?
* show photo location on google maps ?





## License

Refinery CMS Photo Gallery engine is released under the MIT license. Created by Martin Markech, inspired by
Espen Antonsen's [Balder photo gallery](http://balderapp.com/)
