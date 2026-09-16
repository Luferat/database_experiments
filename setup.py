# setup.py
# Faz o setup inicial do banco de dados se necessário

import sqlite3

# Abre (ou cria) o banco de dados
connection = sqlite3.connect("database.db")

# Lê o arquivo SQL
with open("database.sqlite.sql", "r", encoding="utf-8") as file:
    sql = file.read()

# Executa todo o script SQL
connection.executescript(sql)

# Fecha a conexão
connection.close()

print("Banco de dados preparado com sucesso!")