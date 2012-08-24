require 'net/http'

class FakeNet
  def initialize 
    @return_type = "success"
  end
  
  def will_get_http_error
    @return_type = "httperror" 
  end
  
  def check
    case @return_type
    when "success"
      return File.open("data/home.html")
    when "httperror"  
      raise OpenURI::HTTPError.new('','')
    else
      raise NotImplementedError.new "should never get here"
    end
  end
end