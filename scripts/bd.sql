--Procedure responsável pelo relatório do window
DELIMITER $$
CREATE PROCEDURE sp_relatorio1 (
	IN dataini DATE,
    IN datafim DATE
)
BEGIN
	SELECT
		c.nome,
		a.dt_inicio AS datainicial,
        a.dt_termino AS datafinal,
        a.valor_apolice,
        i.id_imovel,
        (CASE WHEN EXISTS (SELECT COUNT(*) FROM sinistro s WHERE s.id_apolice = a.id_apolice) THEN 'Sim' ELSE 'Não' END) AS tem_sinistro,
        (
            SELECT GROUP_CONCAT(co.descricao SEPARATOR ', ')
            FROM cobertura co
            INNER JOIN apolice_cobertura ac ON ac.id_cobertura = co.id_cobertura
            WHERE ac.id_apolice = a.id_apolice
		) AS coberturas,
        (CASE WHEN CURDATE() BETWEEN a.dt_inicio AND a.dt_termino THEN 'Sim' ELSE 'Não' END) AS esta_vigente
	FROM cliente c
	JOIN imovel i ON i.id_proprietario = c.id_cliente
	JOIN apolice a ON a.id_imovel = i.id_imovel
	WHERE a.dt_inicio BETWEEN dataini AND datafim;
END$$

-- Trigger para evitar o pagamento caso a apólice já esteja expirada:
DELIMITER $$
CREATE TRIGGER bloquear_pagamento_cancelado
BEFORE INSERT ON pagamento
FOR EACH ROW
BEGIN
  DECLARE apolice_cancelada INT;
  SET apolice_cancelada = (SELECT COUNT(*) FROM apolice WHERE id_apolice = NEW.id_apolice AND dt_termino < CURDATE());
  IF apolice_cancelada > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Não é possível inserir pagamento para uma apólice expirada';
  END IF;
END$$

-- Função para verificar apólice ativa
DELIMITER $$
CREATE FUNCTION IF NOT EXISTS verificar_apolice_ativa(id INT)
RETURNS VARCHAR(3) READS SQL DATA
BEGIN
  DECLARE apolice_ativa VARCHAR(3);
  SET apolice_ativa = 'Sim';
  
  IF (SELECT COUNT(*) FROM apolice WHERE id_imovel = id AND CURDATE() BETWEEN dt_inicio AND dt_termino) = 0 THEN
    SET apolice_ativa = 'Não';
  END IF;
  
  RETURN apolice_ativa;
END$$
