from flask import Flask, render_template, jsonify
from dotenv import load_dotenv
from data.models import connect_to_db
from crud import *

# Load env vars
load_dotenv()

app = Flask(__name__)
connect_to_db(app)


@app.route("/")
def homepage():
    """Load the homepage."""

    return render_template("index.html")


@app.route("/api/parks")
def parks():
    """Return all parks in JSON."""

    parks = get_park_list()

    return jsonify([{"id": park.id, "name": park.name} for park in parks])
