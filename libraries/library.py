from faker import Faker
import names
from datetime import datetime
import time


def lib_create_random_first_name():
    return names.get_first_name(gender='male')


def lib_create_random_last_name():
    return names.get_last_name()


def lib_create_random_address():
    fake = Faker()
    return fake.address()


def lib_get_current_date():
    today = datetime.today()
    return today.strftime("%B %d, %Y")


def lib_get_max_number_from_list(data):
    str = data
    numbers = [int(s) for s in str.split() if s.isdigit()]
    max_number = max(numbers)
    return max_number


def lib_sum(num_1, num_2):
    return int(num_1) + int(num_2)


def lib_catenate_name_with_last_name(name, last_name):
    return str(name) + " " + str(last_name)