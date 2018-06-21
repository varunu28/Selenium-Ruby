class SignupPage
	
	# CSS Selectors
	USERNAME_FIELD = {id: 'user_username'}
	EMAIL_FIELD = {id: 'user_email'}
	PASSWORD_FIELD = {id: 'user_password'}
	SUBMIT_BUTTON = {id: 'submit'}

	attr_reader :driver

	# Class Methods
	def initialize(driver)
		@driver = driver
	end

	def enter_username(username)
		username_element = @driver.find_element(USERNAME_FIELD)
		username_element.send_keys(username)
	end

	def enter_email(email)
		email_element = @driver.find_element(EMAIL_FIELD)
		email_element.send_keys(email)
	end

	def enter_password(password)
		password_element = @driver.find_element(PASSWORD_FIELD)
		password_element.send_keys(password)
	end

	def submit_form()
		submit_element = @driver.find_element(SUBMIT_BUTTON)
		submit_element.click
	end

end