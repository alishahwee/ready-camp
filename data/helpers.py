import json
from csv import DictReader, reader
from models import db, Item, Park, Image, Activity


def insert_parks(json_file):
    """Decode json and insert into database."""

    with open(json_file) as f:
        parks = json.load(f)

        for park in parks:
            park_obj = Park(
                name=park["name"],
                address=park["address"],
                coordinates=park["lat_long"],
                url=park["url"],
            )
            db.session.add(park_obj)

            for url in park["images"]:
                park_img = Image(park=park_obj, url=url)
                db.session.add(park_img)

            for activity in park["activities"]:
                park_activity = Activity(park=park_obj, activity=activity)
                db.session.add(park_activity)

        db.session.commit()


def insert_items(csv_file):
    """Parse CSV and insert into database."""

    with open(csv_file, newline="") as f:
        reader = DictReader(f)
        for row in reader:
            item = Item(
                name=row["name"],
                is_rainy=eval(row["is_rainy"]),
                is_winter=eval(row["is_winter"]),
                is_optional=eval(row["is_optional"]),
                category=row["category"],
            )

            db.session.add(item)

        db.session.commit()


def verify_parks(tsv_file):
    """Ensure that parks have the right address."""

    with open(tsv_file, newline="") as f:
        rd = reader(f, delimiter="\t")
        for row in rd:
            park = Park.query.get(int(row[0]))
            if park.address != row[2]:
                park.address = row[2]
                db.session.commit()
            else:
                continue
