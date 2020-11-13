"""A file for CRUD operations."""

from data.models import *
from werkzeug.security import generate_password_hash, check_password_hash
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

    parks = Park.query.order_by(Park.name).all()

    return parks


def get_park_id(park_name):
    """Get park id from name."""

    park = Park.query.filter(Park.name.ilike(f"%{park_name}%")).first()

    return park.id


def get_realtime_weather(park_id):
    """Get weather dict from park ID."""

    park = get_park_info(park_id)

    url = "https://api.climacell.co/v3/weather/realtime"

    querystring = {
        "lat": park.lat,
        "lon": park.lon,
        "unit_system": "us",
        "fields": "temp,wind_speed,weather_code",
        "apikey": getenv("CLIMACELL_KEY"),
    }

    response = requests.request("GET", url, params=querystring)

    return response.json()


def get_favorites(user_id):
    """Get favorite parks from user ID."""

    favorites = Favorite.query.filter_by(user_id=user_id)

    return favorites


def register_user(username, password, email):
    """Register a new user."""

    new_user = User(
        username=username, password=generate_password_hash(password), email=email
    )
    db.session.add(new_user)

    try:
        db.session.commit()
    except:
        return {"error": "A user already has that username/email"}, 500

    return {"message": "User registered successfully"}, 201


def login_user(username, password):
    """Login a user."""

    user = User.query.filter_by(username=username).first()

    if user and check_password_hash(user.password, password):
        return user.id  # Add to session in app.py
    else:
        return {"error": "username or password are incorrect"}, 401


def get_items(is_rainy=False, is_winter=False):
    """Get all relevant camping items."""

    items = Item.query.filter(
        ((Item.is_rainy == None) | (Item.is_rainy == is_rainy)),
        ((Item.is_winter == None) | (Item.is_winter == is_winter)),
    ).all()  # Find items that are NULL or equal to the args

    return items


def get_user_items(user_id, park_id):
    """Get item ID and checkmark status from user and park ID."""

    items = UserItem.query.filter(user_id == user_id, park_id == park_id).all()

    return [{"item_id": item.item_id, "is_checked": item.is_checked} for item in items]
