class UsersPage

	# CSS Selectors
	SUCCESS_BANNER = {id: 'flash_success'}

	attr_reader :driver

	# Class Methods
	def initialize(driver)
		@driver = driver
	end

	def get_banner_text()
		banner_element = @driver.find_element(SUCCESS_BANNER)
		banner_text = banner_element.text
	end

end