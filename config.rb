##
# Configuration for application

##
# Extension activation in config

Middleman::Extensions.register :image_tracker do
  require "extensions/image_tracker"
  ImageTracker
end

activate :image_tracker

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

##
# Deployment in config
activate :deploy do |deploy|
  deploy.deploy_method   = :git
  deploy.branch   = ''
end

##
# Layout in config
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

##
# Extra Tips
# with alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# helpers
# methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript, compressor: Terser.new
# end
