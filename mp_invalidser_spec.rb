#filename: mp_invalidser_spec.#!/usr/bin/env ruby -wKU

require 'selenium-webdriver'

describe 'search' do
	
before(:each) do
@driver = Selenium::WebDriver.for :firefox
end

after(:each) do
	@driver.quit
end

it 'negative' do
	@driver.get 'https://www.moonpig.com/'
	@driver.find_element(id: 'menu-item-search').click
	@driver.find_element(id: 'search-box').send_keys('no return')
	@driver.find_element(class: 'btn-secondary').click

	@driver.manage.timeouts.implicit_wait = 10

	#assertion
	@driver.find_element(id:'noResultsMessage').displayed?.should be_true

end

end