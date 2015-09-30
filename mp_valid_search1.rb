#filename: mp_basic_search.#!/usr/bin/env ruby -wKU
require 'selenium-webdriver'

describe 'search' do

	before(:each) do
		@driver = Selenium::WebDriver.for :firefox
	end

	#after(:each) do
	#	@driver.quit
	#end

	it 'positive' do
		@driver.get 'https://www.moonpig.com/'
		@driver.find_element(id: 'menu-item-search').click
		@driver.find_element(id: 'search-box').send_keys('Wedding')
		@driver.find_element(id: 'search-btn').click
		#assertion
		@driver.find_element(id: 'noResultsMessage').displayed?.should be_false



	end
end

