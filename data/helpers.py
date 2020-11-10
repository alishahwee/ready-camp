import json
from csv import DictReader, reader
from . import models


def insert_parks(json_file):
    """Decode json and insert into database."""

    with open(json_file) as f:
        parks = json.load(f)

        for park in parks:
            park_obj = models.Park(
                name=park["name"],
                address=park["address"],
                coordinates=park["lat_long"],
                url=park["url"],
            )
            models.db.session.add(park_obj)

            for url in park["images"]:
                park_img = models.Image(park=park_obj, url=url)
                models.db.session.add(park_img)

            for activity in park["activities"]:
                park_activity = models.Activity(park=park_obj, activity=activity)
                models.db.session.add(park_activity)

        models.db.session.commit()


def insert_items(csv_file):
    """Parse CSV and insert into database."""

    with open(csv_file, newline="") as f:
        reader = DictReader(f)
        for row in reader:
            item = models.Item(
                name=row["name"],
                is_rainy=eval(row["is_rainy"]),
                is_winter=eval(row["is_winter"]),
                is_optional=eval(row["is_optional"]),
                category=row["category"],
            )

            models.db.session.add(item)

        models.db.session.commit()


def verify_parks(tsv_file):
    """Ensure that parks have the right address."""

    with open(tsv_file, newline="") as f:
        rd = reader(f, delimiter="\t")
        for row in rd:
            park = models.Park.query.get(int(row[0]))
            if park.address != row[2]:
                park.address = row[2]
                models.db.session.commit()
            else:
                continue
