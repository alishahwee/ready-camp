"""A file for CRUD operations."""

from data.models import *
from dotenv import load_dotenv
from os import getenv
import requests

# Import env vars
load_dotenv()


def get_park_info(park_id):
    """Get all park info from park ID."""

    park = Park.query.get(park_id)

    return park


def get_park_list():
    """Get a list of all the park names and IDs."""

    parks = Park.query.all()

    return [{"id": park.id, "name": park.name} for park in parks]


def get_park_id(park_name):
    """Get park id from name."""

    park = Park.query.filter(Park.name.ilike(f"%{park_name}%")).first()

    return park.id


def get_weather(park_id):
    """Get weather dict from park ID."""

    park = get_park_info(park_id)

    url = "https://api.climacell.co/v3/weather/forecast/daily"

    querystring = {
        "lat": park.lat,
        "lon": park.lon,
        "unit_system": "us",
        "start_time": "now",
        "fields": "temp,precipitation,wind_speed",
        "apikey": getenv("CLIMACELL_KEY"),
    }

    response = requests.request("GET", url, params=querystring)

    return response.text


def get_favorites(user_id):
    """Get favorite parks from user ID."""

    # TODO


def register_user(username, password, email):
    """Register a new user."""

    # TODO


def login_user(username, password):
    """Login a user."""

    # TODO


def get_items(is_rainy=False, is_winter=False, is_optional=False):
    """Get all camping items."""

    # TODO


def get_user_items(user_id, park_id):
    """Get items from user and park ID."""

    # TODO
