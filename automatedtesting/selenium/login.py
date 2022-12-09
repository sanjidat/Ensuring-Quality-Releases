# #!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.common.by import By
import time

# Start the browser and login with standard_user
def login (user, password):
    print ('Starting the browser...')
    # --uncomment when running in Azure DevOps.
    # options = ChromeOptions()
    # options.add_argument("--headless") 
    # driver = webdriver.Chrome(options=options)
    opts = ChromeOptions()
    opts.add_experimental_option("detach", True)
    driver = webdriver.Chrome(chrome_options=opts)
    print ('Browser started successfully. Navigating to the demo page to login.')
    driver.get('https://www.saucedemo.com/')

    username = "standard_user"
    uname = driver.find_element("id","user-name")
    uname.send_keys(username)

    password = "secret_sauce"
    pw = driver.find_element("id","password")
    pw.send_keys(password)
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "login-button").click()
    print("The User ",username, "is trying to login and the login is successful")
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "add-to-cart-sauce-labs-backpack").click()
    print("The item 'Bagpack' is added to the cart")
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "add-to-cart-sauce-labs-bike-light").click()
    print("The item 'Bike light' is added to the cart")
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "add-to-cart-sauce-labs-bolt-t-shirt").click()
    print("The item Sauce Labs 'Bolt T Shirt' is added to the cart")
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "add-to-cart-sauce-labs-fleece-jacket").click()
    print("The item Sauce Labs 'Fleese Jacket' is added to the cart")
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "add-to-cart-sauce-labs-onesie").click()
    print("The item Sauce Labs 'Onesie' is added to the cart")
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "add-to-cart-test.allthethings()-t-shirt-(red)").click()
    print("The item Sauce Labs 'Red T Shirt' is added to the cart")
    driver.implicitly_wait(15)

    driver.find_element(By.ID, "remove-sauce-labs-backpack").click()
    print("The item Sauce Labs 'Bagpack' is removed from the cart")
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "remove-sauce-labs-bike-light").click()
    print("The item 'Bike light' is removed from the cart")
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "remove-sauce-labs-bolt-t-shirt").click()
    print("The item Sauce Labs 'Bolt T Shirt' is removed from the cart")
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "remove-sauce-labs-fleece-jacket").click()
    print("The item Sauce Labs 'Fleese Jacket' is removed from the cart")
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "remove-sauce-labs-onesie").click()
    print("The item Sauce Labs 'Onesie' is removed from the cart")
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "remove-test.allthethings()-t-shirt-(red)").click()
    print("The item Sauce Labs 'Red T Shirt' is removed from the cart")

login('standard_user', 'secret_sauce')

