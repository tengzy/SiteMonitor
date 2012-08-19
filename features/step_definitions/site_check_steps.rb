require "site_checker"
require "rspec"

When /^the site is ok$/ do
  @checker = SiteChecker.new "http://www.agiletour.cn"
end

Then /^site status is ok$/ do
  @checker.status.should == "ok"
end

When /^the site is down$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^site status is down$/ do
  pending # express the regexp above with the code you wish you had
end