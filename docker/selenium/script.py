from selenium import webdriver
from selenium.webdriver.chrome.options import Options

chrome_options = Options()
chrome_options.add_argument("--headless")  # Run Chrome in headless mode
chrome_options.add_argument("--no-sandbox")  # Bypass OS security model
chrome_options.add_argument("--disable-dev-shm-usage")  # Overcome limited resource problems

# Path to the chromedriver executable
chromedriver_path = "/usr/local/bin/chromedriver"

# Initialize the Chrome WebDriver
driver = webdriver.Chrome(options=chrome_options)

# URL of the website you want to visit
url = "https://www.example.com"

# Navigate to the website
driver.get(url)

# Get the page source and save it to a file
with open("homepage.html", "w") as f:
    f.write(driver.page_source)

# Capture a screenshot
screenshot_path = 'screenshot.png'
driver.save_screenshot(screenshot_path)

# Quit the WebDriver
driver.quit()

print("DOM and screenshot saved successfully.")



