require 'rspec'

class FakeMail
  def initialize 
    @received = false
    @status = ""
  end
  
  def send_mail status
    @status = status
    @received = true
  end
  
  def assert_no_mail_received
    @received.should==false
  end
  
  def assert_notification_mail_received
    @received.should==true
    @status.should == "down"
  end
end