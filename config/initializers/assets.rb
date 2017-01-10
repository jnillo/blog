# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.1'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
Rails.application.config.assets.compile = true
Rails.application.config.assets.precompile += %w( application.js application.css clear_form.scss clean_form.js.coffee markdown_converter.js.coffee medium.js medium.min.css medium-editor-insert-plugin.min.js sortable.min.js sortable.min.js jquery.ui.widget.min.js jquery.iframe_transport.js  jquery.fileupload.min.js commons.scss fonts.scss)
Rails.application.config.assets.precompile += %w( patricia_carmona_colors.scss patricia_carmona.scss modal_link_observer.js.coffee font-families.css mobile.scss patricia_carmona_mobile.scss jquery.inifinitescroll.js infinite_scroll.js)
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
