-- ---------------------------- --
-- Cria o banco de dados "mydb" --
-- ---------------------------- --

-- Apaga as tabelas
-- CUIDADO! Só faça isso em desenvolvimento
DROP TABLE IF EXISTS content;
DROP TABLE IF EXISTS user;

-- Cria a tabela "user"
CREATE TABLE user (
	u_id INTEGER PRIMARY KEY,
    u_created_at TEXT DEFAULT CURRENT_TIMESTAMP,
	u_name TEXT NOT NULL,
    u_email TEXT NOT NULL,
    u_password TEXT NOT NULL    
);

-- Cria a tabela "content"
CREATE TABLE content (
	c_id INTEGER PRIMARY KEY,
    c_created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    c_title TEXT NOT NULL,
    c_text TEXT,
    c_status TEXT DEFAULT 'on',
    c_owner INTEGER,
    FOREIGN KEY (c_owner) REFERENCES user (u_id)
);

-- Cadastra alguns "user" para experimentos
INSERT INTO user 
( u_name, u_email, u_password ) VALUES
( "Joca da Silva", "jocasilva@email.com", "Senha@123" ),
( "Setembrino Trocataps", "setbrino@email.com", "Senha@123" ),
( "Marineuza Siriliano", "marisiri@email.com", "Senha@123" ),
( "Hemengarda Sirigarda", "hemesiri@email.com", "Senha@123" );

-- Cadastra alguns "content" para experimentos
INSERT INTO content
(c_title, c_text, c_owner ) VALUES
("Como fazer suco de maçã?", "Duis in nunc quis orci elementum tempor. Fusce pretium, nulla quis consequat mollis, augue diam efficitur ligula, eu molestie odio sapien quis augue.", "1"),
("Quando comprar na Amazom", "Duis in nunc quis orci elementum tempor. Fusce pretium, nulla quis consequat mollis, augue diam efficitur ligula, eu molestie odio sapien quis augue.", "2"),
("Fazendo dinheiro com pipoca", "Duis in nunc quis orci elementum tempor. Fusce pretium, nulla quis consequat mollis, augue diam efficitur ligula, eu molestie odio sapien quis augue.", "3"),
("O dia em que a IA falou comigo", "Duis in nunc quis orci elementum tempor. Fusce pretium, nulla quis consequat mollis, augue diam efficitur ligula, eu molestie odio sapien quis augue.", "3"),
("Tem certeza que quer ser programador?", "Duis in nunc quis orci elementum tempor. Fusce pretium, nulla quis consequat mollis, augue diam efficitur ligula, eu molestie odio sapien quis augue.", "2"),
("Por que os acentos não funcionam no meu teclado?", "Duis in nunc quis orci elementum tempor. Fusce pretium, nulla quis consequat mollis, augue diam efficitur ligula, eu molestie odio sapien quis augue.", "1"),
("Administrando serviços na Web", "Duis in nunc quis orci elementum tempor. Fusce pretium, nulla quis consequat mollis, augue diam efficitur ligula, eu molestie odio sapien quis augue.", "1"),
("Escolhendo um mouse de qualidade", "Duis in nunc quis orci elementum tempor. Fusce pretium, nulla quis consequat mollis, augue diam efficitur ligula, eu molestie odio sapien quis augue.", "4");
