from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv
from os import getenv
from helpers import *

# Load env vars
load_dotenv()

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = getenv("DB_URI")
app.config["SQLALCHEMY_ECHO"] = True
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db = SQLAlchemy(app)


class Item(db.Model):
    """A class object representing camping equipment."""

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False, unique=True)
    is_rainy = db.Column(db.Boolean)
    is_winter = db.Column(db.Boolean)
    is_optional = db.Column(db.Boolean, nullable=False)
    category = db.Column(db.String(20), nullable=False)

    # user_item = a list of UserItem objects

    def __repr__(self) -> str:
        return "<Item '%s'>" % self.name


class Park(db.Model):
    """A Minnesota state park object."""

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False, unique=True)
    address = db.Column(db.String)
    coordinates = db.Column(db.String, nullable=False)
    url = db.Column(db.String, nullable=False)

    # image = a list of Image objects
    # activity = a list of Activity objects
    # favorite = a list of Favorite objects
    # user_item = a list of UserItem objects

    latlon_as_list = [float(c) for c in coordinates.split(",")]
    lat = latlon_as_list[0]
    lon = latlon_as_list[1]

    def __repr__(self) -> str:
        return "<Park '%s'>" % self.name


class Image(db.Model):
    """Image objects from state parks."""

    id = db.Column(db.Integer, primary_key=True)
    park_id = db.Column(db.Integer, db.ForeignKey("park.id"), nullable=False)
    url = db.Column(db.String)

    park = db.relationship("Park", backref="image")

    def __repr__(self) -> str:
        return "<Image id='%i' park_id='%i'>" % (self.id, self.park_id)


class Activity(db.Model):
    """Activity objects from state parks."""

    id = db.Column(db.Integer, primary_key=True)
    park_id = db.Column(db.Integer, db.ForeignKey("park.id"), nullable=False)
    activity = db.Column(db.String(100))

    park = db.relationship("Park", backref="activity")

    def __repr__(self) -> str:
        return "<Activity '%s'>" % self.activity


class User(db.Model):
    """User object."""

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(30), nullable=False, unique=True)
    password = db.Column(db.String(30), nullable=False)
    email = db.Column(db.String(50), nullable=False, unique=True)

    # favorite = a list of Favorite objects
    # user_item = a list of UserItem objects

    def __repr__(self) -> str:
        return "<User '%s'>" % self.username


class Favorite(db.Model):
    """A favorite parks object."""

    id = db.Column(db.Integer, primary_key=True)
    park_id = db.Column(db.Integer, db.ForeignKey("park.id"), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), nullable=False)

    park = db.relationship("Park", backref="favorite")
    user = db.relationship("User", backref="favorite")

    def __repr__(self) -> str:
        return "<Favorite park_id='%i' user_id='%i'>" % (self.park_id, self.user_id)


class UserItem(db.Model):
    """An object representing items belonging to a User."""

    id = db.Column(db.Integer, primary_key=True)
    park_id = db.Column(db.Integer, db.ForeignKey("park.id"), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), nullable=False)
    item_id = db.Column(db.Integer, db.ForeignKey("item.id"), nullable=False)
    is_checked = db.Column(db.Boolean)

    park = db.relationship("Park", backref="user_item")
    user = db.relationship("User", backref="user_item")
    item = db.relationship("Item", backref="user_item")

    def __repr__(self) -> str:
        return "<UserItem park_id='%i' user_id='%i' item_id='%i'>" % (
            self.park_id,
            self.user_id,
            self.item_id,
        )


if __name__ == "__main__":
    db.create_all()
    insert_parks("parks.json")
    insert_items("camping-gear.csv")
    verify_parks("parks.tsv")
