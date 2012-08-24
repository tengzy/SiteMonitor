require 'rspec'
require 'site_checker'
require 'fake_mail'
require 'fake_net'

describe "SiteChecker" do
  before(:each) do
    @fake_mail = FakeMail.new
    @fake_net = FakeNet.new 
    @checker = SiteChecker.new @fake_mail,@fake_net   
  end
  
  context "site up running" do
    it "should do nothing" do
      # arrange
      
      # action
      @checker.inform_status
      
      # assert
      @fake_mail.assert_no_mail_received
    end
    
  end
  
  context "site is down" do
    it "should send out email" do
      # arrange
      @fake_net.will_get_http_error
       
      # action
      @checker.inform_status
      
      # assert
      @fake_mail.assert_notification_mail_received    
    end
  end
end