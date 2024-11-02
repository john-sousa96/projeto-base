-- Criar o banco de dados
CREATE DATABASE adega;

-- Usar o banco de dados para colocar as tabelas
USE adega;


-- Criar a tabela Usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255),
    endereco TEXT,
    data_nascimento DATE
);

-- Inserir dados na tabela Usuarios
INSERT INTO Usuarios (id_usuario, nome, email, senha, endereco, data_nascimento) VALUES
(1, 'João Silva', 'joao.silva@example.com', 'senha123', 'Rua A, 123, São Paulo', '1990-01-01'),
(2, 'Maria Souza', 'maria.souza@example.com', 'senha456', 'Rua B, 456, Rio de Janeiro', '1985-05-10'),
(3, 'Carlos Pereira', 'carlos.pereira@example.com', 'senha789', 'Avenida C, 789, Belo Horizonte', '1992-03-15'),
(4, 'Ana Costa', 'ana.costa@example.com', 'senha321', 'Praça D, 101, Salvador', '1988-07-22'),
(5, 'Lucas Oliveira', 'lucas.oliveira@example.com', 'senha654', 'Rua E, 202, Curitiba', '1995-12-30'),
(6, 'Fernanda Lima', 'fernanda.lima@example.com', 'senha987', 'Rua F, 303, Porto Alegre', '1993-05-18'),
(7, 'Juliana Santos', 'juliana.santos@example.com', 'senha1234', 'Avenida G, 404, Recife', '1990-11-04'),
(8, 'Ricardo Almeida', 'ricardo.almeida@example.com', 'senha5678', 'Rua H, 505, Fortaleza', '1986-02-27'),
(9, 'Camila Rocha', 'camila.rocha@example.com', 'senha4321', 'Praça I, 606, Brasília', '1991-09-09'),
(10, 'Roberto Dias', 'roberto.dias@example.com', 'senha8765', 'Avenida J, 707, Natal', '1984-06-21'),
(11, 'Patrícia Martins', 'patricia.martins@example.com', 'senha1357', 'Rua K, 808, Goiânia', '1987-10-14'),
(12, 'Tiago Silva', 'tiago.silva@example.com', 'senha2468', 'Avenida L, 909, Manaus', '1994-04-03');


-- Criar a tabela Categorias das bebidas
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

-- Inserir dados na tabela Categorias (Bebidas alcoólicas e não alcoólicas)
INSERT INTO Categorias (id_categoria, nome_categoria) VALUES 
(1, 'Alcoólicas'),
(2, 'Não Alcoólicas');


-- Criar a tabela Produtos
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10, 2),
    quantidade INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

-- Inserir dados na tabela Produtos
INSERT INTO Produtos (id_produto, nome_produto, descricao, preco, quantidade, id_categoria) VALUES 
(1, 'Vinho Branco', 'Bebidas Alcoólicas', 70.00, 50, 1),
(2, 'Cerveja', 'Bebidas Alcoólicas', 8.00, 100, 1),
(3, 'Vinho', 'Bebidas Alcoólicas', 60.00, 30, 1),
(4, 'Cidra', 'Bebidas Alcoólicas', 25.00, 80, 1),
(5, 'Licor', 'Bebidas Alcoólicas', 45.00, 40, 1),
(6, 'Cachaça', 'Bebidas Alcoólicas', 35.00, 70, 1),
(7, 'Sakê', 'Bebidas Alcoólicas', 42.00, 20, 1),
(8, 'Sangria', 'Bebidas Alcoólicas', 20.00, 60, 1),
(9, 'Whisky', 'Bebidas Alcoólicas', 150.00, 10, 1),
(10, 'Tequila', 'Bebidas Alcoólicas', 120.00, 15, 1),
(11, 'Vermute', 'Bebidas Alcoólicas', 55.00, 25, 1),
(12, 'Grappa', 'Bebidas Alcoólicas', 90.00, 12, 1),
(13, 'Absinto', 'Bebidas Alcoólicas', 70.00, 8, 1),
(14, 'Vodka', 'Bebidas Alcoólicas', 40.00, 50, 1),
(15, 'Gin', 'Bebidas Alcoólicas', 85.00, 45, 1),
(16, 'Refrigerante', 'Bebidas Não Alcoólicas', 8.00, 150, 2),
(17, 'Refrigerante Diet', 'Bebidas Não Alcoólicas', 9.00, 150, 2),
(18, 'Suco', 'Bebidas Não Alcoólicas', 10.00, 90, 2),
(19, 'Chá', 'Bebidas Não Alcoólicas', 4.50, 110, 2),
(20, 'Smoothie', 'Bebidas Não Alcoólicas', 12.00, 75, 2),
(21, 'Água', 'Bebidas Não Alcoólicas', 3.00, 200, 2);


-- Criar a tabela Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    endereco_entrega VARCHAR(255) NOT NULL,
    status_pedido VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Inserir dados na tabela Pedidos
INSERT INTO Pedidos (id_pedido, id_usuario, data_pedido, valor_total, endereco_entrega, status_pedido) VALUES
(1, 1, '2024-10-01', 180.00, 'Rua A, 123, São Paulo', 'Entregue'),
(2, 2, '2024-10-03', 320.00, 'Rua B, 456, Rio de Janeiro', 'Pendente'),
(3, 3, '2024-10-05', 75.00, 'Avenida C, 789, Belo Horizonte', 'Entregue'),
(4, 4, '2024-10-07', 210.00, 'Praça D, 101, Salvador', 'Cancelado');


-- Criar a tabela Carrinho
CREATE TABLE Carrinho (
    id_carrinho INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Inserir dados na tabela Carrinho
INSERT INTO Carrinho (id_carrinho, id_usuario) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2);


-- Criar a tabela Pagamentos
CREATE TABLE Pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_usuario INT,
    metodo_pagamento VARCHAR(50),
    status_pagamento VARCHAR(50),
    data_pagamento DATE,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Inserir dados na tabela Pagamentos
INSERT INTO Pagamentos (id_pedido, id_usuario, metodo_pagamento, status_pagamento, data_pagamento) VALUES
(1, 1, 'Cartão de Crédito', 'Pago', '2024-10-02'),
(2, 2, 'Boleto Bancário', 'Pendente', NULL),
(3, 3, 'Cartão de Crédito', 'Pago', '2024-10-06'),
(4, 4, 'Cartão de Crédito', 'Cancelado', '2024-10-08');


-- Criar a tabela Pedido_Produto
CREATE TABLE Pedido_Produto (
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- Inserir dados na tabela Pedido_Produto
INSERT INTO Pedido_Produto (id_pedido, id_produto, quantidade) VALUES 
(1, 1, 2),
(2, 2, 2),
(3, 1, 1),
(3, 2, 3),
(4, 1, 1);