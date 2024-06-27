from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service

chrome_options = Options()
chrome_options.add_argument("--headless")  # Run Chrome in headless mode
chrome_options.add_argument("--no-sandbox")  # Bypass OS security model
chrome_options.add_argument("--disable-dev-shm-usage")  # Overcome limited resource problems
chrome_options.add_argument("--window-size=1920x1080")
chrome_options.add_argument("--enable-javascript")

# Prevent detection
chrome_options.add_experimental_option('excludeSwitches', ['enable-automation'])
chrome_options.add_experimental_option('useAutomationExtension', False)

# Path to the chromedriver executable
chromedriver_path = "/usr/local/bin/chromedriver"

# Initialize the Chrome WebDriver
service = Service(chromedriver_path)
driver = webdriver.Chrome(options=chrome_options)
# driver = webdriver.Chrome(service=service, options=chrome_options)


# URL of the website you want to visit
url = 'https://bio2024.mapyourshow.com/8_0/explore/exhibitor-alphalist.cfm?nav=1#/alpha/0'

# Navigate to the website
driver.get(url)

# Wait for the page to fully load (optional)
driver.implicitly_wait(30)

# Additional settings to further obscure automation
driver.execute_script("Object.defineProperty(navigator, 'webdriver', {get: () => undefined})")


dom = driver.page_source

# Get the page source and save it to a file
with open("alpha-0.html", "w") as f:
    f.write(dom)

# Capture a screenshot
screenshot_path = 'alpha-0.png'
driver.save_screenshot(screenshot_path)

# Quit the WebDriver
driver.quit()

print("DOM and screenshot saved successfully.")



