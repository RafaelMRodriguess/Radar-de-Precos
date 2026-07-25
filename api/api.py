import requests
import pandas as pd
import os
from dotenv import load_dotenv

load_dotenv()

def buscar_dados():

    API_URL = os.getenv("API_URL")

    response = requests.get(API_URL)

    dados = response.json()

    df = pd.json_normalize(dados["products"])

    return df

