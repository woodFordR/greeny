require "open-uri"

##
# The ImageTracker class is a middleman extension for requesting 
# and retrieving image information

class ImageTracker < Middleman::Extension
  expose_to_config :grab_url
  # TRACKING_NUMBER = "1Z2467EY0341356387"
  # headers = {'Content-type' => 'application/json; charset=UTF-8'}
  # uri = URI("https://www.google.com")
  # Net::HTTP.get(uri, headers).scan(/<a href=(".*?")/m).uniq[0,3]
  # Net::HTTP.start("drop.com", Net::HTTP.default_port, use_ssl: true) do |http|
  #   request = Net::HTTP::Get.new(uri)
  #   response = http.request(request)
  #   if response.code == "200"
  #     puts response.body.scan(/<img class=".*?" src="(.*?)"/m).uniq[0,3]
  #   end
  # end
  # URI.open("https://drop.com/buy/drop-olkb-preonic-acute-keycaps") do |f|
  #   puts f.read.scan(/.*?<link.*?as="image" href=(".*?").*?/m)
  # end
  
  def initialize(app, options_hash={}, &block)
    super
    # @ups_uri = URI.open("https://www.ups.com/track?tracknum=1Z2467EY0341356387/") do |f|
    #   puts f.read.scan(/<div class="ups-card_content"><div class="ng-star-inserted">(<div class="ups-error_alert-list">)/m)
    # end
  end

  def grab_url
    # p Time.new(2024, 04, 03)
    "https://massdrop-s3.imgix.net/product-images/drop-olkb-preonic-acute-keycaps/FP/fsbalEIBQPii2KSD1HDD_i1hze0JQQ3qLe5JnAO4H_acute.png"
  end

  alias :included :registered
end

::Middleman::Extensions.register(:image_tracker, ImageTracker)
