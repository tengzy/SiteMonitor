require_relative 'platform_mail'
require_relative 'platform_net'

class SiteChecker
  
  def initialize mail, net
    @mail = mail
    @net = net
  end
  
  def inform_status
    status = check_site
    @mail.send_mail(status) if (status == "down")
  end
  
  private
  def check_site
    result = "ok"
    begin
      page = @net.check
      body = page.read[0, 500]
    rescue OpenURI::HTTPError
      result = "down"
    end
    result
  end
end