"""A file for CRUD operations."""

from data.models import *


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
    """Get weather from park ID."""

    # TODO


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
