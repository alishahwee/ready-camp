from flask import Flask, render_template, jsonify, request
from dotenv import load_dotenv
from flask.helpers import make_response
from data.models import connect_to_db
from crud import *
from helpers import weather_codes

# Load env vars
load_dotenv()

app = Flask(__name__)
connect_to_db(app, db_uri="TEST_DB_URI")

# Ensure templates are auto-reloaded
app.config["TEMPLATES_AUTO_RELOAD"] = True


@app.route("/", defaults={"path": ""})
@app.route("/<path:path>")
def homepage(path):
    """Load the homepage."""

    return render_template("index.html")


@app.route("/auth/register", methods=["POST"])
def register():
    """Register a new user."""

    data = request.get_json()
    username = data.get("username")
    email = data.get("email")
    password = data.get("password")

    if not user_exists(username, email):
        try:
            token = register_user(username, password, email)
            response = {
                "status": "success",
                "message": "User successfully registered.",
                "token": token.decode(),
            }
            return make_response(jsonify(response)), 201
        except Exception as e:
            print(e)
            response = {
                "status": "fail",
                "message": "Some error occurred. Please try again.",
            }
            return make_response(jsonify(response)), 401
    else:
        response = {
            "status": "fail",
            "message": "User already exists. Please use a different username and/or email.",
        }
        return make_response(jsonify(response)), 403


@app.route("/auth/login", methods=["POST"])
def login():
    """Log in a user."""

    username, password = request.get_json().values()

    if user_exists(username):
        token = login_user(username, password)
        if token:
            response = {
                "status": "success",
                "message": "User successfully logged in.",
                "token": token.decode(),
            }
            return make_response(jsonify(response)), 200
        else:
            response = {
                "status": "fail",
                "message": "Password is incorrect. Please try again.",
            }
            return make_response(jsonify(response)), 403
    else:
        response = {"status": "fail", "message": "Username does not exist."}
        return make_response(jsonify(response)), 403


@app.route("/auth/logout", methods=["POST"])
def logout():
    """Log out a user and blacklist their token."""

    auth_header = request.headers.get("Authorization")
    token = auth_header.split()[1]

    try:
        token_valid = is_token_valid(token)
        if token_valid:
            blacklist_token(token)
            response = {"status": "success", "message": "User successfully logged out."}
            return make_response(jsonify(response)), 200
        else:
            response = {
                "status": "fail",
                "message": "Token is expired, invalid, or blacklisted. Please log in again.",
            }
            return make_response(jsonify(response)), 401
    except Exception as e:
        response = {"status": "fail", "message": e}
        return make_response(jsonify(response)), 401


@app.route("/api/parks")
def parks():
    """Return all parks in JSON."""

    parks = get_park_list()

    return jsonify([{"id": park.id, "name": park.name} for park in parks])


@app.route("/api/items")
def items():
    """Return all the items in an organized JSON."""

    items = get_items()

    item_dict = {}

    for item in items:
        if item.category not in item_dict:
            item_dict[item.category] = [{"id": item.id, "name": item.name}]
        else:
            item_dict[item.category].append({"id": item.id, "name": item.name})

    return jsonify(item_dict)


@app.route("/api/park/<int:id>")
def park(id):
    """Return a park page from ID."""

    park = get_park_info(id)

    return jsonify(
        {
            "id": park.id,
            "name": park.name,
            "address": park.address,
            "coordinates": {"lat": park.lat, "lon": park.lon},
            "url": park.url,
            "images": [image.url for image in park.images],
            "activities": [activity.activity for activity in park.activities],
        }
    )


@app.route("/api/weather/<int:id>")
def weather(id):
    """Return weather data from park ID."""

    weather = get_realtime_weather(id)

    description = weather_codes[weather["weather_code"]["value"]]["description"]

    weather_icons = weather_codes[weather["weather_code"]["value"]]["icon_path"]

    if "day" in weather_icons:
        icon_path = weather_icons["day"]
    else:
        icon_path = weather_icons

    icon = open(icon_path).read()

    return jsonify(
        {
            "temp": str(int(round(weather["temp"]["value"])))
            + " º"
            + weather["temp"]["units"],
            "description": description,
            "icon": icon,
            "windSpeed": str(int(round(weather["wind_speed"]["value"])))
            + " "
            + weather["wind_speed"]["units"],
        }
    )


@app.route("/api/faves")
def get_faves():
    """Get favorite items from user ID in JWT."""

    auth_header = request.headers.get("Authorization")
    token = auth_header.split()[1]

    try:
        token_valid = is_token_valid(token)
        if token_valid:
            parks = get_favorites(token_valid["user_id"])
            response = [{"id": park.id, "name": park.name} for park in parks]
            return make_response(jsonify(response)), 200
        else:
            response = {
                "status": "fail",
                "message": "Token is expired, invalid, or blacklisted. Please log in again.",
            }
            return make_response(jsonify(response)), 401
    except Exception as e:
        response = {"status": "fail", "message": e}
        return make_response(jsonify(response)), 401


@app.route("/api/<int:park_id>/favorite", methods=["POST"])
def favorite(park_id):
    """Add a park to a user's favorites."""

    auth_header = request.headers.get("Authorization")
    token = auth_header.split()[1]

    try:
        token_valid = is_token_valid(token)
        if token_valid:
            new_fave = add_favorite(token_valid["user_id"], park_id)
            if new_fave:
                response = {
                    "status": "success",
                    "message": "Park successfully added to user favorites.",
                }
                return make_response(jsonify(response)), 201
            else:
                return make_response("Internal server error."), 500
        else:
            response = {
                "status": "fail",
                "message": "Token is expired, invalid, or blacklisted. Please log in again.",
            }
            return make_response(jsonify(response)), 401
    except Exception as e:
        response = {"status": "fail", "message": e}
        return make_response(jsonify(response)), 401


@app.route("/api/<int:park_id>/unfavorite", methods=["POST"])
def unfavorite(park_id):
    """Remove a park from user's favorites."""

    auth_header = request.headers.get("Authorization")
    token = auth_header.split()[1]

    try:
        token_valid = is_token_valid(token)
        if token_valid:
            fave_removed = rm_favorite(token_valid["user_id"], park_id)
            if fave_removed:
                response = {
                    "status": "success",
                    "message": "Park successfully removed from user favorites.",
                }
                return make_response(jsonify(response)), 201
            else:
                return make_response("Internal server error."), 500
        else:
            response = {
                "status": "fail",
                "message": "Token is expired, invalid, or blacklisted. Please log in again.",
            }
            return make_response(jsonify(response)), 401
    except Exception as e:
        response = {"status": "fail", "message": e}
        return make_response(jsonify(response)), 401


@app.route("/api/checked")
def checked_items():
    """Get all the checked items from user ID (JWT) and park ID (query)."""

    auth_header = request.headers.get("Authorization")
    token = auth_header.split()[1]

    park_id = request.args.get("park_id")

    try:
        token_valid = is_token_valid(token)
        if token_valid:
            items = get_checked_items(token_valid["user_id"], park_id)
            response = [{"id": item.id, "name": item.name} for item in items]
            return make_response(jsonify(response)), 200
        else:
            response = {
                "status": "fail",
                "message": "Token is expired, invalid, or blacklisted. Please log in again.",
            }
            return make_response(jsonify(response)), 401
    except Exception as e:
        response = {"status": "fail", "message": e}
        return make_response(jsonify(response)), 401


@app.route("/api/<int:park_id>/check", methods=["POST"])
def check_item(park_id):
    """Add a park-specific item to a user's checked items."""

    auth_header = request.headers.get("Authorization")
    token = auth_header.split()[1]

    item_id = request.get_json().get("item_id")

    try:
        token_valid = is_token_valid(token)
        if token_valid:
            checked_item = check_user_item(token_valid["user_id"], park_id, item_id)
            if checked_item:
                response = {
                    "status": "success",
                    "message": f"{checked_item.item.name} successfully checked.",
                }
                return make_response(jsonify(response)), 201
            else:
                return make_response("Item already checked."), 204
        else:
            response = {
                "status": "fail",
                "message": "Token is expired, invalid, or blacklisted. Please log in again.",
            }
            return make_response(jsonify(response)), 401
    except Exception as e:
        response = {"status": "fail", "message": e}
        return make_response(jsonify(response)), 401


@app.route("/api/<int:park_id>/uncheck", methods=["DELETE"])
def uncheck_item(park_id):
    """Remove a park-specific item from a user's checked items."""

    auth_header = request.headers.get("Authorization")
    token = auth_header.split()[1]

    item_id = request.get_json().get("item_id")

    try:
        token_valid = is_token_valid(token)
        if token_valid:
            unchecked_item = uncheck_user_item(token_valid["user_id"], park_id, item_id)
            if unchecked_item:
                response = {
                    "status": "success",
                    "message": "Item successfully unchecked.",
                }
                return make_response(jsonify(response)), 201
            else:
                return make_response("Item already unchecked."), 500
        else:
            response = {
                "status": "fail",
                "message": "Token is expired, invalid, or blacklisted. Please log in again.",
            }
            return make_response(jsonify(response)), 401
    except Exception as e:
        response = {"status": "fail", "message": e}
        return make_response(jsonify(response)), 401
