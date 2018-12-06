-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Dez-2018 às 01:45
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cursojsf`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamento`
--

CREATE TABLE IF NOT EXISTS `lancamento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `codigo_pessoa` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_vencimento` date NOT NULL,
  `pago` bit(1) NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_pessoa` (`codigo_pessoa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `lancamento`
--

INSERT INTO `lancamento` (`codigo`, `tipo`, `codigo_pessoa`, `descricao`, `valor`, `data_vencimento`, `pago`, `data_pagamento`) VALUES
(6, 'DESPESA', 5, 'Leite', '10.00', '2012-07-10', b'1', '2012-07-01'),
(10, 'RECEITA', 3, 'Salário ref. Junho/2012', '1200.00', '2012-07-08', b'1', '2012-07-08'),
(11, 'DESPESA', 4, 'Pães', '10.00', '2012-07-10', b'0', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissao_usuario`
--

CREATE TABLE IF NOT EXISTS `permissao_usuario` (
  `nome_usuario` varchar(15) NOT NULL,
  `nome_permissao` varchar(15) NOT NULL,
  PRIMARY KEY (`nome_usuario`,`nome_permissao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `permissao_usuario`
--

INSERT INTO `permissao_usuario` (`nome_usuario`, `nome_permissao`) VALUES
('joao', 'cadastro'),
('maria', 'consulta'),
('sebastiao', 'cadastro'),
('sebastiao', 'consulta');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`codigo`, `nome`) VALUES
(1, 'João das Couves'),
(2, 'Tchau Telecom'),
(3, 'Pastelaria 99'),
(4, 'Panificadora do José'),
(5, 'Mercado Preço Bom');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `nome_usuario` varchar(15) NOT NULL,
  `senha` varchar(32) NOT NULL,
  PRIMARY KEY (`nome_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`nome_usuario`, `senha`) VALUES
('joao', 'dccd96c256bc7dd39bae41a405f25e43'),
('maria', '263bce650e68ab4e23f28263760b9fa5'),
('sebastiao', '2b492cc70ad15ad496389e4d2ef4e8d2');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `lancamento`
--
ALTER TABLE `lancamento`
  ADD CONSTRAINT `lancamento_ibfk_1` FOREIGN KEY (`codigo_pessoa`) REFERENCES `pessoa` (`codigo`);

--
-- Limitadores para a tabela `permissao_usuario`
--
ALTER TABLE `permissao_usuario`
  ADD CONSTRAINT `permissao_usuario_ibfk_1` FOREIGN KEY (`nome_usuario`) REFERENCES `usuario` (`nome_usuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
