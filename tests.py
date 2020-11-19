import unittest
from werkzeug.security import generate_password_hash
from app import app
from data.models import connect_to_db, db, User
import json


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
        with self.client:
            res = self.client.post(
                "/auth/register",
                data=dict(
                    username="testname", password="testword", email="test@testmail.com"
                ),
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "success")
            self.assertTrue(data["message"] == "User successfully registered.")
            self.assertTrue(data["token"])
            self.assertTrue(res.content_type == "application/json")
            self.assertEqual(res.status_code, 201)

    def test_registration_with_existing_user(self):
        """Test whether user will get rejected with an existing account."""

        user = User(
            username="testname",
            password=generate_password_hash("testword"),
            email="test@testmail.com",
        )
        db.session.add(user)
        db.session.commit()

        with self.client:
            res = self.client.post(
                "/auth/register",
                data=dict(
                    username="testname", password="testword", email="test@testmail.com"
                ),
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "fail")
            self.assertTrue(data["message"] == "User already exists. Please log in.")
            self.assertTrue(res.content_type == "application/json")
            self.assertEqual(res.status_code, 202)


if __name__ == "__main__":
    unittest.main()
