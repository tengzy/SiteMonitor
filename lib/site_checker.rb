require 'open-uri'
require 'net/http'

class SiteChecker
  
  def initialize url
    @url = url
  end
  
  def status
    result = "ok"
    begin
      page = open(@url)
      body = page.read[0, 500]
    rescue OpenURI::HTTPError
      result = "database down"
    end
    result
  end
end