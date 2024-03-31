##
# The ImageTracker class is a middleman extension for requesting 
# and retrieving image information

class ImageTracker < Middleman::Extension
  expose_to_template :grab_links

  def initialize(app, options_hash={}, &block)
    super

    require "open-uri"
  end

  def grab_links
    image_urls = URI.open("https://drop.com/buy/drop-olkb-preonic-acute-keycaps") do |f|
      f.read.scan(/.*?<link.*?as="image" href=(".*?").*?/m)
    end
    image_urls.map!{ |f| /.*(https.*\.png).*/.match(f[0])[1] }
  end

  helpers do
    def make_links(text)        
      "<img src='#{grab_links[0]}'>'#{text}'</img>"
    end
  end
end
