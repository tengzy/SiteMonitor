Feature: Monitor site status
	In order to avoid timely restore of agiletour.cn
	As website admin
	I want to monitor the status of website
	
Scenario: check site status
	When detect status
	And site is up
	Then no notification mail is sent

		

	  
	