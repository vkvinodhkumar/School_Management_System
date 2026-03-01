import random
from datetime import datetime


def generate_admission_number():
    now = datetime.now()
    year = now.strftime("%Y")
    month = now.strftime("%m")
    day = now.strftime("%d")
    random_digits = str(random.randint(100000, 999999))

    return f"{year}{month}{day}{random_digits}"