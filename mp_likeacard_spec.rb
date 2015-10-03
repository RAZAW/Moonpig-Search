#filename: mp_likeacard_spec.#!/usr/bin/env ruby -wKU

require 'selenium-webdriver'

describe 'search' do

	before (:each) do
		@driver = Selenium::WebDriver.for :firefox
	end

	after(:each) do
		@driver.quit
	end

	it 'likes' do
		@driver.get 'https://www.moonpig.com/'
		#adding implicit wait 
		@driver.manage.timeouts.implicit_wait = 10


		@driver.find_element(id: 'menu-item-search').click
		@driver.find_element(id: 'search-box').send_keys('birthdays')
		@driver.find_element(id: 'search-btn').click

		@driver.find_element(xpath: '//*[@id="productGrid"]/div[3]/div[2]/div').click
		@driver.find_element(id: 'myLikesFix').displayed?.should be_true
	end
end

