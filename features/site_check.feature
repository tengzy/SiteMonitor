Feature: Report website is down
	In order to make sure the site is not broken
	As website admin
	I want to be informed of website down
	
Scenario: site is up
	When the site is ok
	Then site status is ok
	
Scenario: site is down
	When the site is down
	Then site status is down
	
	
		

	  
	