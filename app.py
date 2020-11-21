from flask import Flask, render_template, jsonify, request
from dotenv import load_dotenv
from flask.helpers import make_response
from data.models import connect_to_db
from crud import *
from helpers import weather_codes

# Load env vars
load_dotenv()

app = Flask(__name__)
connect_to_db(app, echo=False)

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

    username = request.form.get("username")
    password = request.form.get("password")
    email = request.form.get("email")

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

    username = request.form.get("username")
    password = request.form.get("password")

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
                "message": "Password is incorrect. Please try again."
            }
            return make_response(jsonify(response)), 403
    else:
        response = {
            "status": "fail",
            "message": "Username does not exist."
        }
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
            response = {
                "status": "success",
                "message": "User successfully logged out."
            }
            return make_response(jsonify(response)), 200
        else:
            response = {
                "status": "fail",
                "message": "Token is expired, invalid, or blacklisted. Please log in again."
            }
            return make_response(jsonify(response)), 401
    except Exception as e:
        response = {
            "status": "fail", 
            "message": e
        }
        return make_response(jsonify(response)), 401



@app.route("/api/parks")
def parks():
    """Return all parks in JSON."""

    parks = get_park_list()

    return jsonify([{"id": park.id, "name": park.name} for park in parks])


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
