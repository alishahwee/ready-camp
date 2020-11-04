from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
import json
import traceback

parks_url = "https://www.dnr.state.mn.us"

parkfinder = "/parkfinder/index.html"

driver = webdriver.Chrome(ChromeDriverManager().install())

driver.get(parks_url + parkfinder)

html = driver.page_source

soup = BeautifulSoup(html, "html.parser")

parks = []

for link in soup.select(".list a"):

    try:
        name = link.string
        if "Recreation Area" in name:
            print(f"Skip {name}")
            continue
        url = parks_url + link.get("href")
        driver.get(parks_url + link.get("href"))
        WebDriverWait(driver, 30).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, ".page_banner"))
        )
        soup_page = BeautifulSoup(driver.page_source, "html.parser")
        images = [img.get("src") for img in soup_page.select("#thumbs img")]
        images.insert(0, soup_page.find(class_="page_banner").get("src"))
        text_list = [
            text
            for text in soup_page.select_one("#park .row .col-sm-8 p").stripped_strings
        ]
        try:
            address = f"{text_list[0]}, {text_list[1]}"
        except:
            address = ""
            pass
        lat_long = (
            soup_page.select_one("#park .row .col-sm-8 small")
            .a.next_sibling.next_sibling.get("href")
            .split("=")[1]
        )
        activities = [
            activity.string for activity in soup_page.select("#park .row ul li")
        ]
        parks.append(
            dict(
                name=name,
                address=address,
                lat_long=lat_long,
                activities=activities,
                url=url,
                images=images,
            )
        )
    except:
        traceback.print_exc()
        print(f"Caused by this page: {url}")
        continue

driver.close()

with open("parks.json", "w") as outfile:
    json.dump(parks, outfile)
