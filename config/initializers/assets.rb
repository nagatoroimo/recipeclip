# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( recipe.js )
Rails.application.config.assets.precompile += %w( carousel.js )

Rails.application.config.assets.precompile += %w( recipe.css )
Rails.application.config.assets.precompile += %w( carousel.css )
Rails.application.config.assets.precompile += %w( small_home.css )
Rails.application.config.assets.precompile += %w( small_qa.css )
Rails.application.config.assets.precompile += %w( small_post.css )
Rails.application.config.assets.precompile += %w( small_user.css )
Rails.application.config.assets.precompile += %w( small_blogs.css )
Rails.application.config.assets.precompile += %w( small_results.css )
Rails.application.config.assets.precompile += %w( small_votes.css )
Rails.application.config.assets.precompile += %w( small_notices.css )
Rails.application.config.assets.precompile += %w( small_temps.css )
Rails.application.config.assets.precompile += %w( small_categories.css )
Rails.application.config.assets.precompile += %w( small_notices.css )
Rails.application.config.assets.precompile += %w( small_base.css )


Rails.application.config.assets.precompile += %w( middle_home.css )
Rails.application.config.assets.precompile += %w( middle_qa.css )
Rails.application.config.assets.precompile += %w( middle_post.css )
Rails.application.config.assets.precompile += %w( middle_user.css )
Rails.application.config.assets.precompile += %w( middle_blogs.css )
Rails.application.config.assets.precompile += %w( middle_results.css )
Rails.application.config.assets.precompile += %w( middle_votes.css )
Rails.application.config.assets.precompile += %w( middle_notices.css )
Rails.application.config.assets.precompile += %w( middle_temps.css )
Rails.application.config.assets.precompile += %w( middle_categories.css )
Rails.application.config.assets.precompile += %w( middle_notices.css )
Rails.application.config.assets.precompile += %w( middle_base.css )