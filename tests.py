import unittest
from app import app
from data.models import connect_to_db, db


class TestAuth(unittest.TestCase):
    """Tests for user authentication."""

    def setUp(self) -> None:
        """Create testing client for app."""

        self.client = app.test_client()
        app.config["TESTING"] = True

        # Connect to test db
        connect_to_db(app, db_uri="TEST_DB_URI")

        db.create_all()
        db.session.commit()

    def tearDown(self) -> None:
        db.session.remove()
        db.drop_all()

    def test_registration(self):
        """Can users register an account successfully?"""
