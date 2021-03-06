import unittest
from werkzeug.security import generate_password_hash
from app import app
from data.models import connect_to_db, db, User
from crud import blacklist_token
import json
import time
from data import helpers


class TestAuth(unittest.TestCase):
    """Tests for user authentication."""

    def setUp(self) -> None:
        """Create testing client for app."""

        self.client = app.test_client()
        app.config["TESTING"] = True

        # Connect to test db
        connect_to_db(app, db_uri="TEST_DB_URI")

        db.drop_all()
        db.create_all()

        with app.app_context():
            helpers.insert_parks("data/parks.json")
            helpers.insert_items("data/camping-gear.csv")
            helpers.verify_parks("data/parks.tsv")

    def test_registration(self):
        """Can users register an account successfully?"""
        with self.client:
            res = self.client.post(
                "/auth/register",
                data=json.dumps(
                    dict(
                        username="testname",
                        password="testword",
                        email="test@testmail.com",
                    )
                ),
                content_type="application/json",
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "success")
            self.assertTrue(data["message"] == "User successfully registered.")
            self.assertTrue(data["token"])
            self.assertTrue(res.content_type == "application/json")
            self.assertEqual(res.status_code, 201)

    def test_registration_with_existing_username_and_email(self):
        """Test a registration with an existing username and email."""

        create_fake_user()  # testname, testword, test@testmail.com

        with self.client:
            res = self.client.post(
                "/auth/register",
                data=json.dumps(
                    dict(
                        username="testname",
                        password="testword",
                        email="test@testmail.com",
                    )
                ),
                content_type="application/json",
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "fail")
            self.assertTrue(
                data["message"]
                == "User already exists. Please use a different username and/or email."
            )
            self.assertTrue(res.content_type == "application/json")
            self.assertEqual(res.status_code, 403)

    def test_registration_with_existing_username_only(self):
        """Test a user with just an existing username."""

        create_fake_user()  # testname, testword, test@testmail.com

        with self.client:
            res = self.client.post(
                "/auth/register",
                data=json.dumps(
                    dict(
                        username="testname",
                        password="testword",
                        email="new_test@testmail.com",
                    )
                ),
                content_type="application/json",
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "fail")
            self.assertTrue(
                data["message"]
                == "User already exists. Please use a different username and/or email."
            )
            self.assertTrue(res.content_type == "application/json")
            self.assertEqual(res.status_code, 403)

    def test_registration_with_existing_email_only(self):
        """Test a user with just an existing email."""

        create_fake_user()  # testname, testword, test@testmail.com

        with self.client:
            res = self.client.post(
                "/auth/register",
                data=json.dumps(
                    dict(
                        username="new_testname",
                        password="testword",
                        email="test@testmail.com",
                    )
                ),
                content_type="application/json",
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "fail")
            self.assertTrue(
                data["message"]
                == "User already exists. Please use a different username and/or email."
            )
            self.assertTrue(res.content_type == "application/json")
            self.assertEqual(res.status_code, 403)

    def test_registered_user_login(self):
        """Test a log in for a registered user."""

        create_fake_user()  # testname, testword, test@testmail.com

        with self.client:
            res = self.client.post(
                "/auth/login",
                data=json.dumps(dict(username="testname", password="testword")),
                content_type="application/json",
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "success")
            self.assertTrue(data["message"] == "User successfully logged in.")
            self.assertTrue(data["token"])
            self.assertTrue(res.content_type == "application/json")
            self.assertEqual(res.status_code, 200)

    def test_unregistered_user_login(self):
        """Test a log in for an unregistered user."""

        with self.client:
            res = self.client.post(
                "/auth/login",
                data=json.dumps(dict(username="testname", password="testword")),
                content_type="application/json",
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "fail")
            self.assertTrue(data["message"] == "Username does not exist.")
            self.assertTrue(res.content_type == "application/json")
            self.assertEqual(res.status_code, 403)

    def test_registered_user_login_with_incorrect_password(self):
        """Test a log in for a registered user, but with an incorrect password."""

        create_fake_user()  # testname, testword, test@testmail.com

        with self.client:
            res = self.client.post(
                "/auth/login",
                data=json.dumps(
                    dict(username="testname", password="incorrect_password")
                ),
                content_type="application/json",
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "fail")
            self.assertTrue(
                data["message"] == "Password is incorrect. Please try again."
            )
            self.assertTrue(res.content_type == "application/json")
            self.assertEqual(res.status_code, 403)

    def test_valid_logout(self):
        """Test logout before token expires."""

        create_fake_user()  # testname, testword, test@testmail.com

        with self.client:
            token = get_token_from_login(self)  # Successful login returns JWT
            res = self.client.post(
                "/auth/logout", headers=dict(Authorization="Bearer " + token)
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "success")
            self.assertTrue(data["message"] == "User successfully logged out.")
            self.assertEqual(res.status_code, 200)

    def test_invalid_logout(self):
        """Test a logout after a token expires."""

        create_fake_user()  # testname, testword, test@testmail.com

        with self.client:
            token = get_token_from_login(self)  # Successful login returns JWT
            time.sleep(6)  # Cause token to expire
            res = self.client.post(
                "/auth/logout", headers=dict(Authorization="Bearer " + token)
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "fail")
            self.assertTrue(
                data["message"]
                == "Token is expired, invalid, or blacklisted. Please log in again."
            )
            self.assertEqual(res.status_code, 401)

    def test_valid_blacklisted_token_logout(self):
        """Test a logout on a valid blacklisted token."""

        create_fake_user()  # testname, testword, test@testmail.com

        with self.client:
            token = get_token_from_login(self)  # Successful login returns JWT
            blacklist_token(token)
            res = self.client.post(
                "/auth/logout", headers=dict(Authorization="Bearer " + token)
            )

            data = json.loads(res.data.decode())
            self.assertTrue(data["status"] == "fail")
            self.assertTrue(
                data["message"]
                == "Token is expired, invalid, or blacklisted. Please log in again."
            )
            self.assertEqual(res.status_code, 401)


def create_fake_user():
    user = User(
        username="testname",
        password=generate_password_hash("testword"),
        email="test@testmail.com",
    )
    db.session.add(user)
    db.session.commit()


def get_token_from_login(self):
    return json.loads(
        self.client.post(
            "/auth/login",
            data=json.dumps(dict(username="testname", password="testword")),
            content_type="application/json",
        ).data.decode()
    )["token"]


if __name__ == "__main__":
    unittest.main()
