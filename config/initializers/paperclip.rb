# This file contains default configuration for Paperclip

Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_credentials] = {
  access_key_id: ENV["AWS_ACCESS_KEY_ID"],
  secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
}
Paperclip::Attachment.default_options[:bucket] = ENV["FOG_DIRECTORY"]
Paperclip::Attachment.default_options[:url] = ":s3_domain_url"