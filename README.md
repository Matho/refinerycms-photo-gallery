# Refinery CMS Photo Gallery

__Photo gallery engine for Refinery CMS.__

## Requirements

This version of refinerycms-photo-gallery supports Rails 3.2.x and Refinery CMS ~> 2.0.3.

Client side image resizing with Plupload is possible on Firefox 3.5+ (with fixed quality) and Chrome.
Safari doesn't support direct data access to the selected files. Opera 12.00 + supports drag&drop and also client side image resizing.


## Features

* Multiple photo uploading with [Plupload](http://www.plupload.com/) 1.5.4
* Support for multiple runtimes (because of bug now works only HTML5): HTML5, Flash, Gears, Silverlight, HTML4
* Client side photo resizing to do faster uploading on slow connections
* Server side resizing with Carrierwave
* Grouping albums to collections. Album can be placed in one or more collections.
* Ajax photo edit during uploading
* Reading EXIF records from file - GPS latitude/longitude, photo title, photo description (In Linux you can put EXIF data using [digiKam](www.digikam.org/) )
* Multiple photo editing at once
* Fully configurable, fully translatable, searchable
* Using [Fancybox](http://fancyapps.com/fancybox/) 2.0.6 for frontend image slideshow. Read Fancybox license before you
use it on profit websites.
* Fragment caching on frontend
* Ajaxified pagination with history.pushState on frontend

## Screenshots

All screenshots are in folder screenshots

![Photo uploading](https://raw.github.com/Matho/refinerycms-photo-gallery/master/screenshots/07_photos%23upload-uploading_2.png)
![Frontend album](https://raw.github.com/Matho/refinerycms-photo-gallery/master/screenshots/11_frontend_show.png)
![Frontend album](https://raw.github.com/Matho/refinerycms-photo-gallery/master/screenshots/12_show_photo_using_fancybox.png)


## Demo

TODO

## Options

* choose runtimes
* set max file size
* on/off client side resizing
* set plupload locale
* file extensions white list
* delete original files after resizing to save disk space
* set dimmensions of photo versions without need to override uploader


## Language

Gem is fully translated to slovak and english. Plupload is translated to 24 languages. You can add your own to
photo_gallery/app/assets/javascripts/refinery/photo_gallery/admin/plupload/i18n and enable it in config.plupload_locale


## Working status

This is development snapshot. It is not suitable to production now, I'm going to fix bug list and todo list and then I will create stable branch/version.
But gem works, so if you want, feel free to try it and contribute :).

## Installation

Make sure, you [have installed ImageMagick](http://www.imagemagick.org/script/install-source.php#unix) and ImageMagick dev.
On Ubuntu 12.04 you can install dev suite with commands:

```ruby
sudo apt-get install libmagickcore-dev libmagickwand-dev
```

Then you need to install command-line Exiftool application.
Instructions for installation you can find under [www.sno.phy.queensu.ca/~phil/exiftool/install.html](www.sno.phy.queensu.ca/~phil/exiftool/install.html).


Open up your ``Gemfile`` and add at the bottom this line:

```ruby
gem 'refinerycms-photo-gallery', '~> 0.0.3.dev', :git => 'git://github.com/Matho/refinerycms-photo-gallery.git'
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

You can configure gem in ``your_app_name/config/initializers/refinery/photo_gallery.rb``

If you want to use ajaxy pagination, copy ``app/assets/javascripts/refinery/photo_gallery/photo_gallery.js`` to your app's asset and add to manifest.

Check, if you have ``jquery.js`` included in your backend.

If you want to use Fancybox in frontend, copy ``photo_gallery/app/assets/images/refinery/photo_gallery/fancybox``, ``photo_gallery/app/assets/javascripts/refinery/photo_gallery/fancybox``, ``photo_gallery/app/assets/refinery/photo_gallery/stylesheets/fancybox`` to your
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

## Todo list

* fix support for refinerycms-search gem in backend/frontend
* add support for amazon S3 storage
* create app tests
* repair problems with Flash runtime and test gears, silverlight and HTML4 runtime
* show live links in admin
* allow to check which photo is photo album preview
* set albums public/not public.
* add checkboxes to delete multiple/all photos in album
* stop uploading
* travis, codeclimate
* push to rubygem


## Known bugs

* Only html5 runtime is now supported
* Files with spaces in file names are rejected if you upload them using drag&drop
* After collection is created, you are redirected to albums#index instead of collection#index
* Due to Opera bug I turn off Plupload client side mime type validation. It is able to choose files with non valid
file extensions to upload queue. ( But server side validation reject these files.).

## Road map ?

* album/photo tags using acts_as_taggable
* show photo location on google maps
* caching ?
* GPS editing in degrees,minute,seconds format 
* album grouping by year (configurable)

## Testing

TODO

## License

Refinery CMS Photo Gallery engine is released under the MIT license. Created by Martin Markech, inspired by
Espen Antonsen's [Balder photo gallery](http://balderapp.com/)
