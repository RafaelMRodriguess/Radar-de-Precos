from banco.conexao import conectar

engine = conectar()

if engine is None:
    raise Exception("Não foi possível conectar ao banco de dados.")

with open("sql/create_tables.sql", "r", encoding="utf-8") as arquivo:
    sql = arquivo.read()

with engine.begin() as conn:
    conn.exec_driver_sql(sql)

print("Tabelas criadas com sucesso!")