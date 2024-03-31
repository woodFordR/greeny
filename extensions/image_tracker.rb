##
# The ImageTracker class is a middleman extension for requesting 
# and retrieving image information

class ImageTracker < Middleman::Extension
  expose_to_template :grab_links

  def initialize(app, options_hash={}, &block)
    super
    require "open-uri"
  end

  ##
  # The grab_links method parses a website for image urls

  def grab_links(uri)
    image_urls = URI.open(uri) do |f|
      f.read.scan(/.*?<link.*?as="image" href=(".*?").*?/m)
    end
    image_urls.map { |f| /.*(https.*\.png).*/.match(f[0])[1] }
  end

  helpers do

    ##
    # The make_links helper method allows a template to display the image url

    def make_images(uri)
      link_tos = grab_links(uri).uniq[0,3].map { |x| "<img src=#{x} />" }

      link_tos.join("\n")
    end
  end
end
