import unittest
from app import app
from data.models import connect_to_db, db
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


if __name__ == "__main__":
    unittest.main()
