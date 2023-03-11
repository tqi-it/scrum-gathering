#!/usr/bin/python3

import requests
import sys
import random
from datetime import datetime


def validate_argv():
    if (len(sys.argv) != 3):
        print("Usage: ./populate_db.py [PORT] [QUANTITY]")
        sys.exit()


d: dict = {
    'RJ': ['Macaé', 'Rio de Janeiro', 'Belford Roxo'],
    'SP': ['Santo André', 'São Paulo', 'Ribeirão Preto'],
    'PR': ['Cascavel', 'Curitiba', 'Maringá'],
    'GO': ['Goiânia', 'Itumbiara', 'Rio Verde'],
}


def populate():
    port: int = int(sys.argv[1])
    quantiy: int = int(sys.argv[2])
    url = f"http://localhost:{port}/event"
    for i in range(0, quantiy):
        r = random.choice(list(d.keys()))
        name = f"SG in {r}"
        state = r
        city = random.choice(d[state])
        params = {
            'id': '0',
            'name': name,
            'city': city,
            'state': state,
            'date': str(datetime.now()),
        }
        requests.post(url, json=params)


if __name__ == '__main__':
    validate_argv()
    populate()
