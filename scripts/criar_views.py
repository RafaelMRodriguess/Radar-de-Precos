from banco.conexao import conectar

engine = conectar()

if engine is None:
    raise Exception("Não foi possível se conectar ao banco de dados")

with engine.begin() as conn:

    with open("sql/vw_base_produtos.sql", "r", encoding="utf-8") as arquivo:
        sql_base_produtos = arquivo.read()
    conn.exec_driver_sql(sql_base_produtos)

    with open("sql/vw_historico_precos.sql", "r", encoding="utf-8") as arquivo:
        sql_historico_precos = arquivo.read()
    conn.exec_driver_sql(sql_historico_precos)

    with open("sql/vw_posicionamento_categoria.sql", "r", encoding="utf-8") as arquivo:
        sql_posicionamento_categoria = arquivo.read()
    conn.exec_driver_sql(sql_posicionamento_categoria)

    with open("sql/vw_ranking_produtos.sql", "r", encoding="utf-8") as arquivo:
        sql_ranking_produtos = arquivo.read()
    conn.exec_driver_sql(sql_ranking_produtos)

    with open("sql/vw_kpis.sql", "r", encoding="utf-8") as arquivo:
        sql_kpis = arquivo.read()
    conn.exec_driver_sql(sql_kpis)

print("Views criadas com sucesso!")