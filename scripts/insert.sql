-- Inserção de dados na tabela cliente
INSERT INTO cliente (nome, dt_nasc, endereco, telefone, email)
VALUES
    ('João',  '1990-05-15', 'Rua A', '123456789', 'joao.silva@example.com'),
    ('Maria', '1985-09-10', 'Rua B', '987654321', 'maria.santos@example.com'),
    ('Pedro', '1992-02-28', 'Rua C', '555555555', 'pedro.almeida@example.com'),
    ('Ana',  '1998-11-03', 'Rua D', '111111111', 'ana.ferreira@example.com'),
    ('Carlos', '1982-07-20', 'Rua E', '222222222', 'carlos.oliveira@example.com'),
    ('Mariana', '1995-04-12', 'Rua F', '333333333', 'mariana.costa@example.com'),
    ('Lucas', '1991-08-25', 'Rua G', '444444444', 'lucas.ribeiro@example.com'),
    ('Fernanda', '1987-12-18', 'Rua H', '666666666', 'fernanda.gomes@example.com'),
    ('Ricardo', '1997-03-08', 'Rua I', '777777777', 'ricardo.martins@example.com'),
    ( 'Isabela', '1994-06-30', 'Rua J', '999999999', 'isabela.lima@example.com');

-- Inserção de dados na tabela imovel
INSERT INTO imovel (id_proprietario, id_inquilino, endereco, tipo_imovel, valor_imovel, area_imovel, ano_construcao)
VALUES
    (1, 2, 'Rua X', 'Casa', 250000.00, 200.00, 2000),
    (3, NULL, 'Rua Y', 'Apartamento', 150000.00, 100.00, 2010),
    (4, 5, 'Rua Z', 'Casa', 180000.00, 180.50, 1995),
    (6, NULL, 'Rua W', 'Apartamento', 200000.00, 120.00, 2005),
    (7, 8, 'Rua V', 'Casa', 300000.00, 300.00, 2015),
    (9, NULL, 'Rua U', 'Apartamento', 220000.00, 150.00, 2008),
    (10, NULL, 'Rua T', 'Casa', 280000.00, 220.00, 2003),
    (2, NULL, 'Rua S', 'Apartamento', 190000.00, 110.00, 2012),
    (5, 9, 'Rua R', 'Casa', 260000.00, 250.00, 2006),
    ( 8, NULL, 'Rua Q', 'Apartamento', 230000.00, 130.00, 2018);

-- Inserção de dados na tabela apolice
INSERT INTO apolice (id_imovel, dt_inicio, dt_termino, valor_apolice)
VALUES
    (1, '2021-01-01', '2023-12-31', 1500.00),
    (2, '2021-02-01', '2023-07-31', 1200.00),
    (3, '2021-03-01', '2023-11-30', 1350.00),
    (4, '2021-04-01', '2023-09-30', 1400.00),
    (5, '2021-05-01', '2023-10-31', 1600.00),
    (6, '2021-06-01', '2023-05-31', 1300.00),
    (7, '2021-07-01', '2023-12-31', 1700.00),
    (8, '2021-08-01', '2023-10-31', 1250.00),
    (9, '2021-09-01', '2023-11-30', 1450.00),
    ( 10, '2021-10-01', '2023-12-31', 1550.00),
    ( 9, '2023-06-28', '2023-06-30', 1600.00);

-- Inserção de dados na tabela cobertura
INSERT INTO cobertura (descricao, valor)
VALUES
    ('Incêndio', 50000.00),
    ('Roubo', 10000.00),
    ('Danos Elétricos', 15000.00),
    ('Vendaval', 20000.00),
    ('Desmoronamento', 30000.00),
    ('Responsabilidade Civil', 25000.00),
    ('Perda de Aluguel', 1000.00),
    ('Inundação', 35000.00),
    ('Furto', 8000.00),
    ( 'Desastres Naturais', 40000.00);

-- Inserção de dados na tabela apolice_cobertura
INSERT INTO apolice_cobertura (id_apolice, id_cobertura)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 3),
    (3, 4),
    (3, 5),
    (4, 6),
    (4, 7),
    (5, 2),
    (5, 8),
    (5, 9),
    (6, 10);

-- Inserção de dados na tabela sinistro
INSERT INTO sinistro (id_apolice, dt_sinistro, descricao, valor_sinistro)
VALUES
    (1, '2022-03-15', 'Incêndio no imóvel', 20000.00),
    (3, '2022-06-20', 'Desmoronamento parcial', 15000.00),
    (4, '2022-07-10', 'Roubo de pertences', 5000.00),
    (7, '2022-09-05', 'Inundação causada por enchente', 10000.00),
    (8, '2022-11-18', 'Danos elétricos', 8000.00),
    (10, '2022-12-24', 'Vendaval destruiu telhado', 12000.00),
    (10, '2022-12-27', 'Perda de aluguel devido a sinistro', 500.00),
    (2, '2022-05-10', 'Furto de objetos valiosos', 7000.00),
    (5, '2022-08-15', 'Desastre natural causou danos', 18000.00),
    ( 6, '2022-09-30', 'Roubo de aparelhos eletrônicos', 3000.00);

-- Inserção de dados na tabela pagamento
INSERT INTO pagamento (id_apolice, dt_pagamento, valor_pagamento)
VALUES
    (1, '2023-02-05', 300.00),
    (2, '2023-03-10', 250.00),
    (3, '2023-04-15', 275.00),
    (4, '2023-05-20', 280.00),
    (5, '2023-06-25', 320.00),
    (6, '2023-02-12', 260.00),
    (7, '2023-08-05', 340.00),
    (8, '2023-09-10', 225.00),
    (9, '2023-10-15', 290.00),
    ( 10, '2023-11-20', 310.00),
    ( 11, '2023-11-22', 310);

-- Inserção de dados na tabela avaliacao
INSERT INTO avaliacao (id_imovel, dt_avaliacao, valor_avaliado)
VALUES
    (1, '2021-02-20', 260000.00),
    (2, '2021-03-25', 170000.00),
    (3, '2021-04-30', 190000.00),
    (4, '2021-05-05', 210000.00),
    (5, '2021-06-10', 320000.00),
    (6, '2021-07-15', 230000.00),
    (7, '2021-08-20', 270000.00),
    (8, '2021-09-25', 180000.00),
    (9, '2021-10-30', 200000.00),
    ( 10, '2021-11-05', 240000.00);
