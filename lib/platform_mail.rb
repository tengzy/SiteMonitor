require 'gmail'
require 'net/smtp'
require 'rspec'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'localhost',
            :user_name            => 'agiletourcn@gmail.com',
            :password             => 'AgileTourCn',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
            
Mail.defaults do
  delivery_method :smtp, options
end

class PlatformMail

  def send_mail status 
    Mail.deliver do
      from  'agiletourcn@gmail.com'
      to  'agile-tour-china-core@googlegroups.com'
      subject 'agiletour.cn is ' + status
      body 'agiletour.cn is ' + status
    end
  end
  
  def self.assert_email_received
    Gmail.connect('agiletourcn@gmail.com', 'AgileTourCn') do |gmail|
      gmail.inbox.count(:unread, :from => "agiletourcn@gmail.com").should > 0
    end
  end
  
  def self.assert_no_email_received
    Gmail.connect('agiletourcn@gmail.com', 'AgileTourCn') do |gmail|
      gmail.inbox.count(:unread, :from => "agiletourcn@gmail.com").should == 0
    end
  end
end
