-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Ago-2021 às 01:59
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cliente`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `descricao` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `descricao`) VALUES
(2, 'Mouse'),
(3, 'Monitor LED'),
(4, 'Gabinete'),
(5, 'Cadeira Gamer');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL,
  `telefone` varchar(16) NOT NULL,
  `senha` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `email`, `telefone`, `senha`) VALUES
(3, 'Renato Oliveira Abreu', 'renato.abreu.info@gmail.com', '64992481630', 'e10adc3949ba59abbe56e057f20f883e'),
(4, 'john', 'john.bds@gmail.com', '64992464170', '3db2770da90c5aee59f593bfa72b9b1b');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itempedido`
--

CREATE TABLE `itempedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_produto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `itempedido`
--

INSERT INTO `itempedido` (`id`, `pedido_id`, `produto_id`, `quantidade`, `valor_produto`) VALUES
(1, 16, 6, 1, 160),
(2, 16, 6, 1, 160),
(3, 16, 6, 1, 160),
(4, 16, 6, 1, 160),
(5, 16, 7, 1, 1135),
(6, 16, 6, 1, 160),
(7, 16, 6, 1, 160),
(8, 16, 6, 1, 160);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `data_pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`id`, `cliente_id`, `data_pedido`) VALUES
(1, 4, '2021-08-19'),
(2, 4, '2021-08-19'),
(3, 4, '2021-08-19'),
(4, 4, '2021-08-19'),
(5, 4, '2021-08-19'),
(6, 4, '2021-08-19'),
(7, 4, '2021-08-19'),
(8, 4, '2021-08-19'),
(9, 4, '2021-08-19'),
(10, 4, '2021-08-19'),
(11, 4, '2021-08-19'),
(12, 4, '2021-08-19'),
(13, 4, '2021-08-19'),
(14, 4, '2021-08-19'),
(15, 4, '2021-08-19'),
(16, 4, '2021-08-19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(240) NOT NULL,
  `descricao` text NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `valor` double NOT NULL,
  `imagem` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `descricao`, `categoria_id`, `valor`, `imagem`) VALUES
(3, 'Monitor Gamer Nitro Acer 23,8', '    Tela 23.8\" Full-HD IPS (1920X1080)\r\n    Taxa de atualização de 144Hz a 165Hz\r\n    Tempo de resposta: de 2ms até 0,5ms.\r\n    2 portas HDMI (2.0) e DisplayPort\r\n    Bordas Finas (Zero Frame)', 3, 1630, '2021.07.08-20.23.52.jpg'),
(4, 'Monitor para PC Full HD UltraWide LG LED IPS 29” - 29WK600 ', '    Onscreen control\r\n    Screen split 2\r\n    Ajuste de ângulo\r\n    Bivolt', 3, 1785, '2021.07.08-20.26.15jpeg'),
(6, 'Mouse Gamer Logitech G203 LIGHTSYNC RGB, Efeito de Ondas de Cores,', '    Sensor de 8.000 DPI - O sensor de nível avançado para jogos responde com precisão aos seus movimentos. Personalize as configurações para se adequar à sensibilidade que você gosta com o software de jogos Logitech G HUB e alterne facilmente até 5 configurações de DPI.\r\n    LIGHTSYNC RGB - Jogue em cores com nosso mais vibrante LIGHTSYNC RGB, com efeitos de ondas de cores personalizáveis em aproximadamente 16,8 milhões de cores. Instale o software Logitech G HUB para escolher cores e animações predefinidas ou criar suas próprias.\r\n    Design clássico, testado por jogadores - Jogue confortavelmente e com controle total. O layout simples de 6 botões e o formato clássico para jogos formam um design confortável, testado e amado. Cada botão pode ser personalizado usando o software Logitech G HUB para simplificar as tarefas.\r\n    Tensionamento de botões por mola de metal - Fornece acionamento preciso dos botões e experiência consistente - clique após clique.\r\n    Disponível em 4 cores: Estilo no jogo importa, escolha a sua cor e prepare-se para jogar.', 2, 160, '2021.07.08-19.42.42.jpg'),
(7, 'Cadeira Gamer Fury 7002 - Couro PU, Reclinável 180º- Premium', '', 5, 1135, '2021.07.08-19.58.33.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `senha` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `telefone`, `senha`) VALUES
(1, 'Renato', 'renato.abreu@ifg.edu.br', '64992481630', 'e10adc3949ba59abbe56e057f20f883e');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `itempedido`
--
ALTER TABLE `itempedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pedido` (`pedido_id`),
  ADD KEY `fk_itempedido_produto` (`produto_id`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente` (`cliente_id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `itempedido`
--
ALTER TABLE `itempedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `itempedido`
--
ALTER TABLE `itempedido`
  ADD CONSTRAINT `fk_itempedido_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `fk_itempedido_produto` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
