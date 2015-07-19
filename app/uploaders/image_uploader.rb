# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base  
  CropOptions = Struct.new(:x, :y, :width, :height) do 
    def to_s
      sprintf "%dx%d+%d+%d", width, height, x, y
    end
  end

  attr_accessor :crop_options

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  
  # the method below does more than what it should. Ideally symlinking of the directories should be done somewhere else
  def store_dir
    base_dir = ENV.fetch('FILE_STORE_DIR', "uploads")
    if base_dir != "uploads"
      public_uploads = File.join(Rails.root, "public", "uploads")
      FileUtils.symlink(base_dir, public_uploads) unless File.symlink?(public_uploads)
      base_dir = public_uploads
    end
    "#{base_dir}/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    base_dir = ENV.fetch('FILE_STORE_TMP_DIR', "tmp")
    if base_dir != "tmp"
      public_tmp = File.join(Rails.root, "public", "tmp")
      FileUtils.symlink(base_dir, public_tmp) unless File.symlink?(public_tmp)
      base_dir = public_tmp
    end
    "#{base_dir}/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  process :crop

  version :small do
    process :resize_to_fill => [180, 180]
  end

  version :large do
    process :resize_to_fill => [282, 210]
  end

  def crop 
    return unless crop_options.present?

    Rails.logger.debug "Cropping logo image with crop_options: #{crop_options.inspect}"
    manipulate! do |img|
      img.crop crop_options.to_s
      img
    end
  end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png bmp tif tiff)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end

