from flask import Flask, render_template, jsonify, request
from dotenv import load_dotenv
from data.models import connect_to_db
from crud import *
from helpers import weather_codes

# Load env vars
load_dotenv()

app = Flask(__name__)
connect_to_db(app)

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

    username, password, email = request.form

    res = register_user(username, password, email)

    return jsonify(res)


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
            "images": [image.url for image in park.image],
            "activities": [activity.activity for activity in park.activity],
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
