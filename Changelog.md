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
