require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
  cloud_name: ENV['CLOUDINARY_NAME'],
  api_key:    ENV['CLOUDINARY_KEY'],
  api_secret: ENV['CLOUDINARY_SECRET']
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: "store")
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :direct_upload, presign: true
Shrine.plugin :determine_mime_type
