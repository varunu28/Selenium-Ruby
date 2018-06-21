require "selenium-webdriver"
require "rspec"

timestamp = Time.now.to_i

username = "user #{timestamp}"
user_email = "user#{timestamp}@test.com"
password = "password"

def enter_username(username)
	username_element = @driver.find_element(id: 'user_username')
	username_element.send_keys(username)
end

def enter_email(email)
	email_element = @driver.find_element(id: 'user_email')
	email_element.send_keys(email)
end

def enter_password(password)
	password_element = @driver.find_element(id: 'user_password')
	password_element.send_keys(password)
end

def submit_form()
	submit_element = @driver.find_element(id: 'submit')
	submit_element.click
end

def get_banner_text()
	banner_element = @driver.find_element(id: 'flash_success')
	banner_text = banner_element.text
end

# Test: Signup for a blog
describe "Blog application" do
	describe "signup to blog application" do
		it "confirm that a user can successfully signup" do
			@driver = Selenium::WebDriver.for :firefox
			@driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

			enter_username(username)
			enter_email(user_email)
			enter_password(password)
			submit_form()

			# Confirm user is signed up successfully
			banner_text = get_banner_text()
			expect(banner_text).to eq("Welcome to the alpha blog user #{timestamp}")

			@driver.quit
		end
	end
end