## 0.0.4.dev [unreleased] 
* added fragment caching for photos on frontend
* added ajaxified pagination with history.pushState for photos on frontend
* change the way how albums menu render. Now render whole menu with caching like sitemap. Do hide/show menu branch on your own with javascript. 
* taking filename before uploading as photo title (fixes problems with filenames with diacritic - it took filename after carrierwave preprocessing as photo title - with broken diacritic)

## 0.0.3.dev [16 August 2012]
* bugfixes 

## 0.0.2.dev [11 August 2012]
* bugfixes 

## 0.0.1.dev [8 August 2012]
* initial commit
