# read.py
# Lê os dados do banco de dados

# Importa Conector do SQLite
import sqlite3 

# Conecta com banco de dados
conn = sqlite3.connect('database.db') 

# Dica! Os dados do DB retornam como DICT
conn.row_factory = sqlite3.Row

# Inicializa o cursor
cursor = conn.cursor() 

# Executa uma query
cursor.execute(""" 
    SELECT u_id, u_name, u_email
    FROM user
""") 

# A query é um READ (SELECT)
#   fetchall() espera 0 ou mais registros
#   fetchone() espera 0 ou 1 registro
clients = cursor.fetchall() 

# Loop para iterar os registros
for client in clients: 
    print(dict(client))

# Fecha a conexão com o banco de dados para presevar recursos
conn.close() 