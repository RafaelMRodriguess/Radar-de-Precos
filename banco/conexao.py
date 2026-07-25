from sqlalchemy import create_engine
import os
from dotenv import load_dotenv

load_dotenv()

usuario = os.getenv("DB_USER")
senha = os.getenv("DB_SENHA")
host = os.getenv("DB_HOST")
porta = os.getenv("DB_PORTA")
banco = os.getenv("DB_BANCO")

try:
    engine = create_engine(
        f"postgresql://{usuario}:{senha}@{host}:{porta}/{banco}"
    )

    with engine.connect():
        print("PostgreSQL conectado com sucesso")

except Exception as erro:
    print(f"Falha na conexao: {erro}")