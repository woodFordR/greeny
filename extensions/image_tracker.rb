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

  def grab_links
    image_urls = URI.open("https://drop.com/buy/drop-olkb-preonic-acute-keycaps") do |f|
      f.read.scan(/.*?<link.*?as="image" href=(".*?").*?/m)
    end
    image_urls.map { |f| /.*(https.*\.png).*/.match(f[0])[1] }
  end

  helpers do

    ##
    # The make_links helper method allows a template to display the image url

    def make_links()
      link_tos = grab_links.map { |url| "<img src=#{url} />" }

      link_tos.join("\n")
    end
  end
end
