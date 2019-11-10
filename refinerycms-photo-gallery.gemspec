# Encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'refinery/photo_gallery/version'

version = Refinery::PhotoGallery::Version.to_s

Gem::Specification.new do |s|
  s.name              = %q{refinerycms-photo-gallery}
  s.version           = version
  s.description       = %q{Open source Ruby on Rails photo gallery engine designed for integration with Refinery CMS.}
  s.summary           = %q{Ruby on Rails photo gallery engine for Refinery CMS.}
  s.email             = %q{espen@inspired.no, martin.markech@matho.sk}
  s.homepage          = %q{http://github.com/Matho/refinerycms-photo-gallery}
  s.authors           = ['Espen Antonsen', 'Martin Markech']
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',  '~> 4.1.0'
  s.add_dependency    'mime-types'
  s.add_dependency    'carrierwave', '~> 1.3.1'
  s.add_dependency    'mini_magick', ">= 4.9.4"
  s.add_dependency    'mini_exiftool'
  s.add_dependency    'rack', ">= 1.6.11"

  # Development dependencies
  # s.add_development_dependency 'refinerycms-testing', '~> 4.0.3'
end
