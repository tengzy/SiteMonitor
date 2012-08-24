require 'open-uri'
require 'net/http'

class PlatformNet
  def initialize url
    @url = url
  end
  
  def check
    page = open(@url)
  end
end