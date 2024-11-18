-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/10/2024 às 12:45
-- Versão do servidor: 11.5.2-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `wild`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `Cod_cliente` int(100) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Cpf` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Dt_Nascimento` varchar(100) DEFAULT NULL,
  `Contato` varchar(100) DEFAULT NULL,
  `Senha` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`Cod_cliente`, `Nome`, `Cpf`, `Email`, `Dt_Nascimento`, `Contato`, `Senha`) VALUES
(1, 'Arthur', '12345678901', 'arthur@scatena.com', '2000/09/07', '15998018760', '1234'),
(2, 'Kaua', '47683248402', 'kauazn@gmai.com', '2002/08/', '15998421394', '123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrega`
--

CREATE TABLE `entrega` (
  `Id` varchar(10) NOT NULL,
  `Endereco` varchar(1000) DEFAULT NULL,
  `CEP` varchar(1000) DEFAULT NULL,
  `Ponto_Ref` varchar(1000) DEFAULT NULL,
  `Numero` varchar(100) DEFAULT NULL,
  `bloco_Ape` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `entrega`
--

INSERT INTO `entrega` (`Id`, `Endereco`, `CEP`, `Ponto_Ref`, `Numero`, `bloco_Ape`) VALUES
('1', 'Alimento santos', '17081654', 'Frigorifico barrios', '341', 0),
('2', 'Joaquim Viera', '17069964', 'Carrefour', '85', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `id` varchar(100) NOT NULL,
  `Quantidade` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`id`, `Quantidade`) VALUES
('1', '80'),
('2', '45');

-- --------------------------------------------------------

--
-- Estrutura para tabela `marca`
--

CREATE TABLE `marca` (
  `id` varchar(1) NOT NULL,
  `marca` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` varchar(10) NOT NULL,
  `Nome_Titular` varchar(1000) DEFAULT NULL,
  `CEP` varchar(1000) DEFAULT NULL,
  `Numero_Cartao` varchar(100) DEFAULT NULL,
  `Validade_Cartao` varchar(100) DEFAULT NULL,
  `CVV` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id`, `Nome_Titular`, `CEP`, `Numero_Cartao`, `Validade_Cartao`, `CVV`) VALUES
('1', 'Matheus Grande', '17075654', '1234567890123456', '2027-08-06', '154'),
('2', 'Gabriel Camargo', '17048794', '1234154678123456', '2024-09-24', '696');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `Cod_Produto` int(12) NOT NULL,
  `Nome_Produto` varchar(100) DEFAULT NULL,
  `Marca` varchar(100) DEFAULT NULL,
  `Preco` varchar(10000) DEFAULT NULL,
  `capa` varchar(1000) DEFAULT NULL,
  `foto2` varchar(1000) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`Cod_Produto`, `Nome_Produto`, `Marca`, `Preco`, `capa`, `foto2`, `foto3`, `descricao`) VALUES
(1, 'InfinityRN 4', 'Nike', '1099.99', 'infinity.jpg', 'infinity2.jpeg', 'infinity3.jpeg', 'Com amortecimento de suporte feito para uma corrida macia, o Infinity 4 ajuda você a correr no asfalto. Feito com espuma Nike ReactX macia a confortável para impulso adicional e atualizado com o Flyknit de melhor ajuste da Nike Running já criado, este corredor para o asfalto ajuda você a decolar a qualquer hora, em qualquer lugar sem todo aquele atrito de desgaste. É o tipo de tênis que pode proporcionar a você aquela tranquilidade inestimável para ir mais rápido e mais longe, graças às pilhas de espuma altas e um design intuitivo que suporta cada passada. Este design assimétrico vibrantemente ousado tem tudo a ver com celebrar sua magnificência de misturar e combinar para os km à frente.'),
(2, 'Air Max Plus', 'Nike', '1299.99', 'MaxPlus.jpg', 'maxplus2.jpeg', 'maxplus3.jpeg', 'Leve sua atitude ao extremo com a estrutura em formato de chama que adiciona calor às ruas, enquanto a tela arejada mantém o frescor. O Nike Air Max Plus proporciona uma experiência Nike Air ajustada que oferece estabilidade premium e amortecimento inacreditável.'),
(3, 'Air Pulse', 'Nike', '859.99', 'AirPulse.jpg', 'airPulse2.jpeg', 'airPulse3.jpeg', 'Combinando característica urbana com resistência, o Air Max Pulse proporciona um toque underground à icônica linha Air Max. Sua entressola revestida em tecido e elementos selados a vácuo dão destaque à sua natureza urbana. As cores inspiradas no cenário musical grime de Londres conferem resistência nas bordas. O amortecimento Air — atualizado a partir do Air Max 270 que é incrivelmente macio — proporciona conforto confiável, esteja você realizando as tarefas do dia ou aproveitando o clube.'),
(4, 'Zoom Fly 5', 'Nike', '1019.99', 'Zoom.jpg', 'zoom2.jpeg', 'zoom3.webp', 'Preencha a lacuna entre o treino de fim de semana e o dia da corrida em um design durável que pode ser implantado não apenas na linha de partida de sua corrida favorita, mas nos dias e meses após sua conquista. Oferece conforto e confiabilidade, mas com uma sensação de propulsão que o ajudará a se sentir rápido e fresco. Esse tipo de versatilidade é incomum na arena de corrida.'),
(5, 'GTjump', 'Nike', '1439.99', 'GTjump.jpg', 'gtjump2.jpeg', 'gtjump2.webp', 'Saia do chão mais rapidamente em um design que ajuda você a pairar e se manter no ar quando a ação for vertical. Se você é um atirador tentando adicionar sustentação ao seu pulo, um arranha-céu esperando flutuar entre as estrelas ou uma fera no solo tentando vencer seu oponente para recuperar a cesta, este calçado pode adicionar um elemento de explosão ao seu jogo. A flexibilidade é diferente de tudo que você já sentiu antes, e a aterrissagem é amortecida, ajudando você a saltar para o céu assim que atingir o solo.'),
(6, 'Air Max Alpha', 'Nike', '799.99', 'AirAlpha.jpg', 'airalpha2.webp', 'airalpha2.avif', 'Termine sua última repetição com força e acelere com um rugido que atordoa o chão da academia no Nike Air Max Alpha Trainer 5. Amortecimento Air Max oferece estabilidade confortável para levantar peso, seja um dia leve ou pesado. Uma base ampla e plana oferece estabilidade e aderência aprimoradas para todos os tipos de treinos difíceis sem sacrificar o estilo, enquanto você percorre de estação em estação e de set a set.\r\n\r\n'),
(7, 'Tech Hera', 'Nike', '629.99', 'Hera.jpg', 'hera2.jpeg', 'hera3.jpeg', 'O Tech Hera está aqui para satisfazer todos os seus desejos de tênis robustos. A entressola ondulada elevada e os detalhes em camurça elevam o seu visual, mantendo você confortável. E seu modelo durável resiste lindamente ao uso diário - que é perfeito, porque você com certeza vai querer usá-lo todos os dias.'),
(8, 'Jordan MVP', 'Nike', '1039.99', 'Jordan.jpg', 'jordan2.webp', 'jordan3.jpeg', 'Nós não inventamos o remix - mas considerando o material que podemos amostrar, este é o que você precisa. Acionamos o SP-12 e pegamos elementos do AJ6, 7 e 8, transformando-os em um calçado completamente novo que celebra o primeiro campeonato de 3 turfas de MJ. Com detalhes em couro, tecido e nobuck, esse tênis homenageia um legado enquanto incentiva você a consolidar o seu próprio.'),
(9, 'Air Jordan 1 Low', 'Nike', '1099.09', 'AirJordan.jpg', 'airjordan2.webp', 'airjordan3.webp', 'Inspirado no original que estreou em 1985, o Air Jordan 1 Low oferece um visual clássico e limpo, mas sempre atual. Com um design icônico que combina perfeitamente com qualquer outfit, estes tênis deixam você preparado para tudo.'),
(10, 'Air force 1\'07', 'Nike', '799.99', 'AirForce.jpg', 'airforce2.webp', 'airforce3.webp', 'O brilho perdura no Nike Air Force 1 ’07, o tênis original do basquete que dá um toque de inovação naquilo que você conhece bem: sobreposições costuradas e duráveis, acabamentos simples e a quantidade perfeita de brilho para fazer você se destacar.'),
(11, 'Metcon 9', 'Nike', '1199.08', 'metcon.webp', 'metcon.avif', 'metcon.jpg', 'Seja qual for o seu “porquê” para malhar, o Metcon 9 faz tudo valer a pena. Melhoramos o 8 com uma placa Hyperlift maior e adicionamos um envoltório de corda de borracha. Jurado por alguns dos maiores atletas do mundo, destinado a levantadores, treinadores, empreendedores, ainda é o padrão ouro que oferece dia após dia.'),
(12, 'Freak 5', 'Nike', '719.99', 'Freak.jpg', 'freak2.avif', 'freak3.avif', 'O motor interno de Giannis gira de dentro para fora, exigindo um calçado que possa aproveitar suas habilidades de superpotência. Entre no Freak 5. Empilhado com velocidade impressionante para primeiros passos super rápidos, recheado com aquele tipo de amortecimento elástico que pode suportar a rotina de todos os jogos, seu tênis de assinatura permite que você se sinta como o Greek Freak. Ultrapasse seu oponente a caminho da cesta, mantendo-se com os manipuladores de bola de contração rápida quando uma posição defensiva decide o jogo.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` varchar(100) NOT NULL,
  `Quantidade_Vendidas` varchar(100) DEFAULT NULL,
  `Preco_Total` varchar(1000) DEFAULT NULL,
  `Data_Venda` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`id`, `Quantidade_Vendidas`, `Preco_Total`, `Data_Venda`) VALUES
('1', '38', '12.500', '2023-10-24'),
('2', '46', '18.500', '2023-11-30');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Cod_cliente`);

--
-- Índices de tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`Id`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`Cod_Produto`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Cod_cliente` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `Cod_Produto` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
