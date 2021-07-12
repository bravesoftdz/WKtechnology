-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.19-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela wktechnology.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '0',
  `cidade` varchar(200) NOT NULL DEFAULT '0',
  `uf` char(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wktechnology.clientes: ~17 rows (aproximadamente)
DELETE FROM `clientes`;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`codigo`, `nome`, `cidade`, `uf`) VALUES
	(1, 'MARIA', 'CIANORTE', 'PR'),
	(2, 'PAULO', 'CIANORTE', 'PR'),
	(3, 'MARIA', 'CIANORTE', 'PR'),
	(4, 'IGOR', 'CIANORTE', 'PR'),
	(5, 'JULIO', 'CIANORTE', 'PR'),
	(6, 'EDSON', 'CIANORTE', 'PR'),
	(7, 'CARLOS', 'CIANORTE', 'PR'),
	(8, 'DENIS', 'CIANORTE', 'PR'),
	(9, 'FERNANDA', 'CIANORTE', 'PR'),
	(10, 'ANGELICA', 'CIANORTE', 'PR'),
	(11, 'LETICIA', 'CIANORTE', 'PR'),
	(12, 'IVONE', 'CIANORTE', 'PR'),
	(13, 'CIDA', 'CIANORTE', 'PR'),
	(14, 'LEONARDO', 'CIANORTE', 'PR'),
	(15, 'ROBERTA', 'CIANORTE', 'PR'),
	(16, 'PATRICIA', 'CIANORTE', 'PR'),
	(17, 'RENATO', 'CIANORTE', 'PR'),
	(18, 'JULIANA', 'CIANORTE', 'PR'),
	(19, 'ANDRESSA', 'CIANORTE', 'PR'),
	(20, 'LUCIANA', 'CIANORTE', 'PR');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela wktechnology.pedidos_dados_gerais
CREATE TABLE IF NOT EXISTS `pedidos_dados_gerais` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `data_emissao` date NOT NULL,
  `codigo_cliente` int(11) NOT NULL DEFAULT 0,
  `valor_total` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`numero`),
  KEY `codigo_cliente` (`codigo_cliente`),
  CONSTRAINT `FK_CLIENTES` FOREIGN KEY (`codigo_cliente`) REFERENCES `clientes` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wktechnology.pedidos_dados_gerais: ~0 rows (aproximadamente)
DELETE FROM `pedidos_dados_gerais`;
/*!40000 ALTER TABLE `pedidos_dados_gerais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_dados_gerais` ENABLE KEYS */;

-- Copiando estrutura para tabela wktechnology.pedidos_produtos
CREATE TABLE IF NOT EXISTS `pedidos_produtos` (
  `autoincrem` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) DEFAULT 0,
  `codigo_produto` int(11) NOT NULL DEFAULT 0,
  `quantidade` float DEFAULT NULL,
  `vlr_unitario` float DEFAULT NULL,
  `vlr_total` float DEFAULT NULL,
  PRIMARY KEY (`autoincrem`),
  KEY `codigo_produto` (`codigo_produto`) USING BTREE,
  CONSTRAINT `FK_PRODUTOS` FOREIGN KEY (`codigo_produto`) REFERENCES `produtos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wktechnology.pedidos_produtos: ~0 rows (aproximadamente)
DELETE FROM `pedidos_produtos`;
/*!40000 ALTER TABLE `pedidos_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_produtos` ENABLE KEYS */;

-- Copiando estrutura para tabela wktechnology.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL DEFAULT '0',
  `preco_venda` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wktechnology.produtos: ~20 rows (aproximadamente)
DELETE FROM `produtos`;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`codigo`, `descricao`, `preco_venda`) VALUES
	(1, 'MOUSE GAMER', 100.00),
	(2, 'TECLADO GAMER', 150.00),
	(3, 'PREGO', 1.00),
	(4, 'MARTELO', 40.00),
	(5, 'OCULOS DE SOL', 25.00),
	(6, 'CARTEIRA', 105.00),
	(7, 'PANELA DE PRESSÃO', 60.00),
	(8, 'FURADEIRA', 230.00),
	(9, 'BERMUDA JEANS', 55.00),
	(10, 'MONITOR LCD', 450.00),
	(11, 'GARRAFA AZUL', 15.00),
	(12, 'CAIXA DE SOM JBL', 69.00),
	(13, 'COPO TERMICO', 125.00),
	(14, 'ABAJUR', 105.00),
	(15, 'CARREGADOR 12V', 60.00),
	(16, 'DICIONARIO', 15.00),
	(17, 'TRAVESSEIRO', 25.00),
	(18, 'CADEIRA DE AREA', 32.00),
	(19, 'FONE DE OUVIDO', 50.00),
	(20, 'CELULAR XIAOMI', 1200.00);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
