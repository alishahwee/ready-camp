from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.ext.hybrid import hybrid_property
from os import getenv
import datetime
from dotenv import load_dotenv
from . import helpers

# Load env vars
load_dotenv()

db = SQLAlchemy()


class Item(db.Model):
    """A class object representing camping equipment."""

    __tablename__ = "items"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False, unique=True)
    is_rainy = db.Column(db.Boolean)
    is_winter = db.Column(db.Boolean)
    is_optional = db.Column(db.Boolean, nullable=False)
    category = db.Column(db.String(20), nullable=False)

    # checked_items = a list of CheckedItem objects

    def __repr__(self) -> str:
        return "<Item '%s'>" % self.name


class Park(db.Model):
    """A Minnesota state park object."""

    __tablename__ = "parks"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False, unique=True)
    address = db.Column(db.String)
    coordinates = db.Column(db.String, nullable=False)
    url = db.Column(db.String, nullable=False)

    # images = a list of Image objects
    # activities = a list of Activity objects
    # favorites = a list of Favorite objects
    # checked_items = a list of CheckedItem objects

    @hybrid_property
    def latlon_as_list(self):
        return [float(c) for c in self.coordinates.split(",")]

    @hybrid_property
    def lat(self):
        return self.latlon_as_list[0]

    @hybrid_property
    def lon(self):
        return self.latlon_as_list[1]

    def __repr__(self) -> str:
        return "<Park '%s'>" % self.name


class Image(db.Model):
    """Image objects from state parks."""

    __tablename__ = "images"

    id = db.Column(db.Integer, primary_key=True)
    park_id = db.Column(db.Integer, db.ForeignKey("parks.id"), nullable=False)
    url = db.Column(db.String)

    park = db.relationship("Park", backref="images")

    def __repr__(self) -> str:
        return "<Image id='%i' park_id='%i'>" % (self.id, self.park_id)


class Activity(db.Model):
    """Activity objects from state parks."""

    __tablename__ = "activities"

    id = db.Column(db.Integer, primary_key=True)
    park_id = db.Column(db.Integer, db.ForeignKey("parks.id"), nullable=False)
    activity = db.Column(db.String(100))

    park = db.relationship("Park", backref="activities")

    def __repr__(self) -> str:
        return "<Activity '%s'>" % self.activity


class User(db.Model):
    """User object."""

    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(30), nullable=False, unique=True)
    password = db.Column(db.String, nullable=False)
    email = db.Column(db.String(50), nullable=False, unique=True)

    # favorites = a list of Favorite objects
    # checked_items = a list of CheckedItem objects

    def __repr__(self) -> str:
        return "<User '%s'>" % self.username


class Favorite(db.Model):
    """A favorite parks object."""

    __tablename__ = "favorites"

    id = db.Column(db.Integer, primary_key=True)
    park_id = db.Column(db.Integer, db.ForeignKey("parks.id"), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)

    park = db.relationship("Park", backref="favorites")
    user = db.relationship("User", backref="favorites")

    def __repr__(self) -> str:
        return "<Favorite park_id='%i' user_id='%i'>" % (self.park_id, self.user_id)


class CheckedItem(db.Model):
    """An object representing a checked item belonging to a User."""

    __tablename__ = "checked_items"

    id = db.Column(db.Integer, primary_key=True)
    park_id = db.Column(db.Integer, db.ForeignKey("parks.id"), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)
    item_id = db.Column(db.Integer, db.ForeignKey("items.id"), nullable=False)

    park = db.relationship("Park", backref="checked_items")
    user = db.relationship("User", backref="checked_items")
    item = db.relationship("Item", backref="checked_items")

    def __repr__(self) -> str:
        return "<CheckedItem park_id='%i' user_id='%i' item_id='%i'>" % (
            self.park_id,
            self.user_id,
            self.item_id,
        )


class BlacklistToken(db.Model):
    """Token Model for storing JWT tokens."""

    __tablename__ = "blacklist_tokens"

    id = db.Column(db.Integer, primary_key=True)
    token = db.Column(db.String(500), unique=True, nullable=False)
    blacklisted_on = db.Column(db.DateTime, nullable=False)

    def __init__(self, token):
        self.token = token
        self.blacklisted_on = datetime.datetime.now()

    def __repr__(self):
        return "<BlacklistToken token='%s'>" % self.token


def connect_to_db(flask_app, db_uri="DB_URI", echo=False):
    flask_app.config["SQLALCHEMY_DATABASE_URI"] = getenv(db_uri)
    flask_app.config["SQLALCHEMY_ECHO"] = echo
    flask_app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.app = flask_app
    db.init_app(flask_app)


if __name__ == "__main__":
    from app import app

    connect_to_db(app)
    db.drop_all()
    db.create_all()

    with app.app_context():
        helpers.insert_parks("data/parks.json")
        helpers.insert_items("data/camping-gear.csv")
        helpers.verify_parks("data/parks.tsv")
