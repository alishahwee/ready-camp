from flask import Flask, render_template, request, redirect, jsonify
from dotenv import load_dotenv
from crud import *

# Load env vars
load_dotenv()

app = Flask(__name__)


@app.route("/")
def homepage():
    """Load the homepage."""

    return render_template("index.html")
