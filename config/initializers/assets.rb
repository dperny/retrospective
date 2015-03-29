# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( map.js )
Rails.application.config.assets.precompile += %w(soundmanager2.swf soundmanager2_flash9.swf)
Rails.application.config.assets.paths << Rails.root.join("vendor","assets","images","360player")
Rails.application.config.assets.paths << Rails.root.join("vendor","assets","images","bar-ui")
Rails.application.config.assets.precompile += %w( *.jpg *.png *.gif *.jpeg *.svg )
