## 0.3.0 [1 November 2019]
* Fix mini_magick version to >= 4.9.4, due to CVE-2019-13574 vulnerability
* Change rack version to >= 1.6.11 due to CVE-2018-16471 vulnerability
* Add locales for de, no, zh-CN
* Added support for Rails 5.1 and Refinery 4.0.3

## 0.2.0 [29 December 2016]
* introduce support for Rails 4.2 and Refinery 3.0
* introduce Strong Parameters protection instead of attr_*
* change Plupload version from 1.5.9 to 2.1.9 due to JQuery incompatibilities
* remove sweepers and observers (caching functionality)
* add css_class and preview_type field [jak4]
* add url field for photo model [jak4]
* added polish locale [szajbus]
* add custom url & css class [QEDio]


## 0.1.2 [31 January 2013]
* fix issue #3 by changing around_filter to before_filter. 
* fix issue #2 slide_to JS function don't work in Chrome

## 0.1.1 [20 October 2012]
* allow to edit filenames in plupload editor before uploading start
* allow to upload another photos in the same album after uploading is done, without need to do page refresh
* add dependent destroy to album_page
* fix ajax pagination in backend

## 0.1.0 [24 September 2012]
* drop collection thumbnail version
* support for old fancybox v1.3
* auto photo orientation, by default
* added admin tab to pages, enable attach photo album to page
* added fragment caching for photos on frontend
* added ajaxified pagination with history.pushState for photos on frontend
* taking filename before uploading as photo title (fixes problems with filenames with diacritic - it took filename after carrierwave preprocessing as photo title - with broken diacritic)
* fixed backend searching

## 0.0.3.dev [16 August 2012]
* bugfixes 

## 0.0.2.dev [11 August 2012]
* bugfixes 

## 0.0.1.dev [8 August 2012]
* initial commit
