require 'gmail'
require 'net/smtp'
require 'rspec'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'localhost',
            :user_name            => 'agiletourchina@gmail.com',
            :password             => 'testtest',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
            
Mail.defaults do
  delivery_method :smtp, options
end

class PlatformMail

  def send_mail status 
    Mail.deliver do
      from  'agiletourchina@agiletour.org'
      to  'agile-tour-china-core@googlegroups.com'
      subject 'agiletour.cn is ' + status
      body 'agiletour.cn is ' + status
    end
  end
  
  def self.assert_email_received
    Gmail.connect('agiletourchina@gmail.com', 'testtest') do |gmail|
      gmail.inbox.count(:unread, :from => "agiletourchina@gmail.com").should > 0
    end
  end
end
