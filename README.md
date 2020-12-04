# ready-camp :tent:
> An all-in-one camping planner lets users efficiently plan camping trips in Minnesota. Simply look up your favorite state park, and start planning.

![Lines of code](https://img.shields.io/tokei/lines/github/alishahwee/ready-camp?label=lines%20of%20code)
![Repo size](https://img.shields.io/github/repo-size/alishahwee/ready-camp)

## Prerequisites

- NodeJS and Yarn package manager.
- Latest version of Python and Pip3.
- PostgresQL database named "state_parks".
- A Mapbox API public token.
- A ClimaCell API key.

## Installation

React frontend:
```
yarn install
```

Flask backend (start a virtual environment first):
```
pip3 install -r requirements.txt
```

Initialize database:
```
psql state_parks < data/state_parks.sql
```

A .flaskenv in the root directory with these contents:
```
FLASK_ENV=development
FLASK_APP="app.py"
```

A .env in the root directory with these contents:
```
NODE_ENV=development
DB_URI="postgresql:///state_parks"
TEST_DB_URI="postgresql:///test_state_parks"
MAPBOX_TOKEN=<insert your mapbox token here>
CLIMACELL_KEY=<insert your climacell key here>
SECRET_KEY=<insert a generated secret key here>
```

## Usage

Start up the server and navigate to localhost:5000:
```
flask run
```

To test the backend API:
```
createdb test_state_parks
psql test_state_parks < data/state_parks.sql
python3 tests.py
```

## Project Proposal

### Overview

Ready Camp is a full-stack, mobile-first, single-page app that’s an all-in-one camping planner styled with TailwindCSS. A RESTful Flask API serves web-scraped data from a PostgresQL database via SQLAlchemy. The React frontend consumes the data using AJAX. The entire app lives on a single proxy thanks to Webpack, an asset bundler. Client-side routing was implemented with React-Router with non-existent routes leading to a 404 page.

### Technologies used

- React
- Flask
- BeautifulSoup
- Selenium
- Mapbox API
- ClimaCell API
- Webpack v5
- Babel
- Tailwind CSS (twin.macro)
- CSS-in-JS (Emotion)
- React Router
- React Helmet
- React Hook Form
- PyJWT

### Data

- Minnesota State Parks
- Users
- Favorite parks
- Camping items
- JWT blacklist

### Roadmap

#### MVP :white_check_mark:

- Look up any Minnesota state park and view relevant info
- Maps with direction capability
- Current weather report

#### 2.0 :white_check_mark:

- Park pages have a recommended camping checklist
- Users can regsiter an account
- Users can favorite parks
- Users can checkmark items (persisted data)

#### 3.0

- Search page for parks (view all, or through search query)
- Image carousel per park
- Expanded weather widget with 15 day forecast

### Notes

Given the potential of this project, there are plans to reach all the state parks in the USA, as well as additional features such as item customization, weather forecasting, and dynamic recommendations.
