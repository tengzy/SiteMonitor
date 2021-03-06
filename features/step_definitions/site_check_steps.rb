require "site_checker"
require "rspec"
require "platform_mail"
require "platform_net"

When /^detect status$/ do
  @checker = SiteChecker.new PlatformMail.new, PlatformNet.new("http://www.agiletour.cn")
  @checker.inform_status
end

When /^site is up$/ do
  
end

Then /^no notification mail is sent$/ do
  assert_no_email_received 
end

def assert_email_received 
  PlatformMail.assert_email_received
end

def assert_no_email_received 
  PlatformMail.assert_no_email_received
end
