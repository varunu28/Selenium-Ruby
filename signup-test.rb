require "selenium-webdriver"
require "rspec"

# Test: Signup for a blog
describe "Blog application" do
	describe "signup to blog application" do
		it "confirm that a user can successfully signup" do
			timestamp = Time.now.to_i
			driver = Selenium::WebDriver.for :firefox
			driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

			username_element = driver.find_element(id: 'user_username')
			username_element.send_keys "user #{timestamp}"

			email_element = driver.find_element(id: 'user_email')
			email_element.send_keys "user#{timestamp}@test.com"

			password_element = driver.find_element(id: 'user_password')
			password_element.send_keys "abc@123"

			submit_element = driver.find_element(id: 'submit')
			submit_element.click

			# Confirm user is signed up successfully
			banner_element = driver.find_element(id: 'flash_success')
			banner_text = banner_element.text
			expect(banner_text).to eq("Welcome to the alpha blog user #{timestamp}")

			driver.quit
		end
	end
end