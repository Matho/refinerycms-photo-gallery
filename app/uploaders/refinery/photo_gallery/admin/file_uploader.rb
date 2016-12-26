# encoding: utf-8

#TODO tests
module Refinery
  module PhotoGallery
    module Admin
      class FileUploader < CarrierWave::Uploader::Base
        before :store, :remember_cache_id
        after :store, :delete_tmp_dir
        after :store, :delete_uploaded_file


        # Include RMagick or ImageScience support
        #     include CarrierWave::RMagick
        #     include CarrierWave::ImageScience
        include CarrierWave::MiniMagick

        #TODO
        # Choose what kind of storage to use for this uploader
        if ENV['S3_KEY']
          storage :fog

          def cache_dir
            "#{Rails.root.to_s}/tmp/uploads" if ENV['HEROKU'] == 'true'
          end
        else
          storage :file
        end


        # Override the directory where uploaded files will be stored
        # This is a sensible default for uploaders that are meant to be mounted:
        def store_dir
          "files/#{model.album.path}"
        end

        def cache_dir
          "tmp"
        end


        version :album do
          resize_to_fill(Refinery::PhotoGallery.album_dimensions[0], Refinery::PhotoGallery.album_dimensions[1], 'North')
          process :auto_orient

          def store_dir
            "thumbs/#{model.album.path}"
          end
        end

        version :preview do
          process :resize_to_fit => Refinery::PhotoGallery.preview_dimensions
          process :auto_orient
          def store_dir
            "thumbs/#{model.album.path}"
          end
        end

        version :single do
          process :resize_to_limit => Refinery::PhotoGallery.single_dimensions
          process :auto_orient

          def store_dir
            "thumbs/#{model.album.path}"
          end
        end

        version :error_wrong_preview_version do
          def store_dir
            "error/wrong_preview_version.png"
          end
        end

        # Add a white list of extensions which are allowed to be uploaded,
        def extension_white_list
          Refinery::PhotoGallery.extension_white_list
        end

        # Override the filename of the uploaded files
        #     def filename
        #       "something.jpg" if original_filename
        #     end


        def auto_orient
          manipulate! do |image|
            image.auto_orient
            image
          end
        end


        # Deleting uploaded file in files/ dir. This method dont do removing of original file in tmp
        def delete_uploaded_file(new_file)
          if version_name.blank? && Refinery::PhotoGallery.delete_uploaded_file
            filename_to_delete =  File.join(Rails.root.to_s,Refinery::PhotoGallery.photo_gallery_dir_relative_to_root, store_dir, filename )
            File.delete(filename_to_delete)
          end
        end

        # store! nil's the cache_id after it finishes so we need to remember it for deletion
        def remember_cache_id(new_file)
          @cache_id_was = cache_id
        end

        # Delete empty dir after restoring cached files to thumb dir. If an error during uploading occured, tmp dir will not be deleted, because will not be empty.
        def delete_tmp_dir(new_file)
          # versions hash is inicialized after storing all versions. We want to delete folder after all versions are restored
          # make sure we don't delete other things accidentally by checking the name pattern
          if versions.length > 0 && @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
            FileUtils.rm_rf(File.join(Rails.root.to_s,Refinery::PhotoGallery.photo_gallery_dir_relative_to_root, cache_dir, @cache_id_was))
          end
        end

      end
    end
  end
end
