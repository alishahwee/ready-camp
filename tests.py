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
        connect_to_db(app, db_uri="TEST_DB_URI", echo=False)

        db.drop_all()
        db.create_all()

    def test_registration(self):
        """Can users register an account successfully?"""
        data = {
            "username": "testname",
            "password": "testword",
            "email": "test@testmail.com",
        }
        res = self.client.post("/auth/register", data=data)

        self.assertIn(b"User registered successfully", res.data)


if __name__ == "__main__":
    unittest.main()
