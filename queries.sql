-- criação do banco
CREATE DATABASE mentoria
USE mentoria;
-- Criação e população das tabelas do banco

CREATE TABLE `agendamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `id_mentor` int DEFAULT NULL,
  `id_mentorado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_mentor` (`id_mentor`),
  KEY `id_mentorado` (`id_mentorado`),
  CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`id_mentor`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`id_mentorado`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `agendamentos` VALUES (1,'2024-01-15','10:00:00',1,21),(2,'2024-01-15','14:00:00',2,22),(3,'2024-01-16','09:30:00',3,23),(4,'2024-01-16','11:00:00',4,24),(5,'2024-01-17','15:00:00',5,25),(6,'2024-01-18','10:00:00',6,26),(7,'2024-01-19','14:30:00',7,27),(8,'2024-01-20','16:00:00',8,28),(9,'2024-01-21','09:00:00',9,29),(10,'2024-01-22','13:00:00',10,30),(11,'2024-01-23','11:30:00',11,31),(12,'2024-01-24','10:00:00',12,32),(13,'2024-01-25','15:00:00',13,33),(14,'2024-01-26','16:00:00',14,34),(15,'2024-01-27','10:30:00',15,35),(16,'2024-01-28','14:00:00',16,36),(17,'2024-01-29','09:00:00',17,37),(18,'2024-01-30','13:30:00',18,38),(19,'2024-01-31','11:00:00',19,39),(20,'2024-02-01','10:00:00',20,40);

CREATE TABLE `areas_conhecimento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `areas_conhecimento` VALUES (1,'Programação'),(2,'Design Gráfico'),(3,'Marketing Digital'),(4,'Redação Técnica'),(5,'Engenharia de Software'),(6,'Gestão de Projetos'),(7,'Análise de Dados'),(8,'Cybersecurity'),(9,'Desenvolvimento Web'),(10,'Inteligência Artificial'),(11,'Finanças Pessoais'),(12,'Educação Infantil'),(13,'Psicologia Organizacional'),(14,'Fotografia'),(15,'Música');

CREATE TABLE `avaliacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nota` int NOT NULL,
  `comentario` text,
  `id_sessao` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sessao` (`id_sessao`),
  CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`id_sessao`) REFERENCES `sessoes_mentoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `avaliacoes` VALUES (41,5,'Ótima mentoria, muito proveitosa!',1),(42,4,'Foi útil, mas poderia ter mais exemplos práticos.',2),(43,5,'O mentor foi muito atencioso e explicou bem.',3),(44,3,'Sessão boa, mas houve alguns atrasos.',4),(45,5,'Excelente sessão, me ajudou bastante.',5),(46,2,'Não foi tão útil quanto eu esperava.',6),(47,4,'Mentoria boa, mas senti falta de mais materiais de apoio.',7),(48,5,'Perfeita! O mentor é extremamente qualificado.',8),(49,3,'Sessão regular, achei que poderia ser mais clara.',9),(50,4,'Muito bom, gostei da abordagem.',10),(51,5,'Incrível, superou minhas expectativas!',11),(52,4,'Ótima experiência, mas a conexão caiu algumas vezes.',12),(53,5,'O mentor é fantástico! Aprendi muito.',13),(54,3,'Achei que poderia ser mais prática.',14),(55,5,'Excelente, mal posso esperar pela próxima.',15);

CREATE TABLE `mensagens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conteudo` text NOT NULL,
  `id_remetente` int DEFAULT NULL,
  `id_destinatario` int DEFAULT NULL,
  `data_hora` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_remetente` (`id_remetente`),
  KEY `id_destinatario` (`id_destinatario`),
  CONSTRAINT `mensagens_ibfk_1` FOREIGN KEY (`id_remetente`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `mensagens_ibfk_2` FOREIGN KEY (`id_destinatario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `mensagens` VALUES (1,'Olá, gostaria de saber mais sobre o tema da nossa próxima mentoria!',1,2,'2024-12-27 08:00:00'),(2,'Oi, estou disponível para agendar a próxima sessão. Qual horário é melhor para você?',2,1,'2024-12-27 09:00:00'),(3,'Bom dia! Gostaria de discutir a estratégia que você sugeriu na última reunião.',3,4,'2024-12-27 10:00:00'),(4,'Estou disponível para uma mentoria sobre design gráfico na próxima semana.',4,5,'2024-12-27 11:00:00'),(5,'Tenho uma dúvida sobre o último conteúdo que discutimos, pode me ajudar?',5,6,'2024-12-27 12:00:00'),(6,'Oi, estou com uma questão sobre programação, poderia me ajudar?',6,7,'2024-12-27 13:00:00'),(7,'Gostaria de saber mais sobre como melhorar a organização do meu tempo.',7,8,'2024-12-27 14:00:00'),(8,'Você pode me ajudar a entender melhor o conceito de UX?',8,9,'2024-12-27 15:00:00'),(9,'Estou com dificuldades em entender o último código que você me passou.',9,10,'2024-12-27 16:00:00'),(10,'Quando podemos marcar nossa próxima sessão? Preciso de ajuda com o marketing digital.',10,11,'2024-12-27 17:00:00'),(11,'Quais são as ferramentas que você recomenda para trabalhar com design gráfico?',11,12,'2024-12-27 18:00:00'),(12,'Consegui terminar o que você me pediu, podemos revisar juntos?',12,13,'2024-12-27 19:00:00'),(13,'Olá, preciso de mais orientações sobre como melhorar meu pitch de vendas.',13,14,'2024-12-27 20:00:00'),(14,'Gostaria de discutir a parte final do meu projeto. Você pode me ajudar?',14,15,'2024-12-27 21:00:00'),(15,'Oi, estou com uma dúvida sobre a estrutura do meu código, pode me orientar?',15,16,'2024-12-27 22:00:00'),(16,'Preciso de sua ajuda para revisar o último design que fiz.',16,17,'2024-12-27 23:00:00'),(17,'Você pode me ajudar a organizar minhas ideias para a apresentação?',17,18,'2024-12-28 08:00:00'),(18,'Gostaria de saber como aplicar melhor os conceitos de marketing nas minhas redes sociais.',18,19,'2024-12-28 09:00:00'),(19,'Oi, tenho uma dúvida sobre como otimizar meu site para SEO. Pode me ajudar?',19,20,'2024-12-28 10:00:00'),(20,'Estou com dificuldades para entender como criar uma landing page. Alguma sugestão?',20,1,'2024-12-28 11:00:00');

CREATE TABLE `mentor_area` (
  `id_mentor` int NOT NULL,
  `id_area` int NOT NULL,
  PRIMARY KEY (`id_mentor`,`id_area`),
  KEY `id_area` (`id_area`),
  CONSTRAINT `mentor_area_ibfk_1` FOREIGN KEY (`id_mentor`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `mentor_area_ibfk_2` FOREIGN KEY (`id_area`) REFERENCES `areas_conhecimento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `mentor_area` VALUES (1,1),(5,1),(14,1),(2,2),(15,2),(3,3),(16,3),(4,4),(17,4),(1,5),(2,6),(5,7),(6,8),(7,9),(8,10),(9,11),(10,12),(11,13),(12,14),(13,15);

CREATE TABLE `sessoes_mentoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `duracao` int NOT NULL,
  `status` enum('Agendada','Concluída','Cancelada') NOT NULL,
  `id_mentor` int DEFAULT NULL,
  `id_mentorado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_mentor` (`id_mentor`),
  KEY `id_mentorado` (`id_mentorado`),
  CONSTRAINT `sessoes_mentoria_ibfk_1` FOREIGN KEY (`id_mentor`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `sessoes_mentoria_ibfk_2` FOREIGN KEY (`id_mentorado`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `sessoes_mentoria` VALUES (1,'2024-12-01','10:00:00',60,'Concluída',1,11),(2,'2024-12-02','14:30:00',90,'Concluída',2,12),(3,'2024-12-03','09:00:00',45,'Agendada',3,13),(4,'2024-12-04','16:00:00',120,'Concluída',4,14),(5,'2024-12-05','11:15:00',30,'Cancelada',5,15),(6,'2024-12-06','13:00:00',60,'Concluída',6,16),(7,'2024-12-07','15:45:00',90,'Agendada',7,17),(8,'2024-12-08','08:30:00',60,'Concluída',8,18),(9,'2024-12-09','10:30:00',45,'Cancelada',9,19),(10,'2024-12-10','12:00:00',60,'Concluída',10,20),(11,'2024-12-11','17:00:00',90,'Agendada',11,21),(12,'2024-12-12','14:00:00',120,'Concluída',12,22),(13,'2024-12-13','09:30:00',60,'Cancelada',13,23),(14,'2024-12-14','15:00:00',60,'Concluída',14,24),(15,'2024-12-15','10:45:00',90,'Agendada',15,25);

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `bIsMentorado` tinyint(1) NOT NULL DEFAULT '0',
  `bIsMentor` tinyint(1) NOT NULL DEFAULT '0',
  `bIsAdmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `usuarios` VALUES (1,'João Silva','joao.silva@email.com','senha123',1,0,0),(2,'Maria Oliveira','maria.oliveira@email.com','senha123',0,1,0),(3,'Pedro Santos','pedro.santos@email.com','senha123',1,1,0),(4,'Ana Costa','ana.costa@email.com','senha123',0,0,1),(5,'Carlos Pereira','carlos.pereira@email.com','senha123',1,0,0),(6,'Juliana Rocha','juliana.rocha@email.com','senha123',0,1,0),(7,'Lucas Almeida','lucas.almeida@email.com','senha123',1,1,0),(8,'Cláudia Martins','claudia.martins@email.com','senha123',0,0,1),(9,'Gabriel Lima','gabriel.lima@email.com','senha123',1,0,0),(10,'Larissa Silva','larissa.silva@email.com','senha123',0,1,0),(11,'Felipe Costa','felipe.costa@email.com','senha123',1,1,0),(12,'Tatiane Ferreira','tatiane.ferreira@email.com','senha123',0,0,1),(13,'Ricardo Souza','ricardo.souza@email.com','senha123',1,0,0),(14,'Isabela Almeida','isabela.almeida@email.com','senha123',0,1,0),(15,'Eduardo Oliveira','eduardo.oliveira@email.com','senha123',1,1,0),(16,'Beatriz Santos','beatriz.santos@email.com','senha123',0,0,1),(17,'Marcelo Rocha','marcelo.rocha@email.com','senha123',1,0,0),(18,'Fernanda Costa','fernanda.costa@email.com','senha123',0,1,0),(19,'Vinícius Lima','vinicius.lima@email.com','senha123',1,1,0),(20,'Patrícia Martins','patricia.martins@email.com','senha123',0,0,1),(21,'Rafael Souza','rafael.souza@email.com','senha123',1,0,0),(22,'Gabriela Almeida','gabriela.almeida@email.com','senha123',0,1,0),(23,'André Oliveira','andre.oliveira@email.com','senha123',1,1,0),(24,'Renata Pereira','renata.pereira@email.com','senha123',0,0,1),(25,'Vitor Costa','vitor.costa@email.com','senha123',1,0,0),(26,'Paula Rocha','paula.rocha@email.com','senha123',0,1,0),(27,'Gustavo Santos','gustavo.santos@email.com','senha123',1,1,0),(28,'Carla Martins','carla.martins@email.com','senha123',0,0,1),(29,'Jorge Lima','jorge.lima@email.com','senha123',1,0,0),(30,'Vanessa Almeida','vanessa.almeida@email.com','senha123',0,1,0),(31,'Felipe Rocha','felipe.rocha@email.com','senha123',1,1,0),(32,'Sabrina Souza','sabrina.souza@email.com','senha123',0,0,1),(33,'Rogério Pereira','rogerio.pereira@email.com','senha123',1,0,0),(34,'Milena Costa','milena.costa@email.com','senha123',0,1,0),(35,'Eduardo Martins','eduardo.martins@email.com','senha123',1,1,0),(36,'Juliana Lima','juliana.lima@email.com','senha123',0,0,1),(37,'Gabrielle Rocha','gabrielle.rocha@email.com','senha123',1,0,0),(38,'Mariana Oliveira','mariana.oliveira@email.com','senha123',0,1,0),(39,'Victor Santos','victor.santos@email.com','senha123',1,1,0),(40,'Marta Almeida','marta.almeida@email.com','senha123',0,0,1),(41,'Júlio Pereira','julio.pereira@email.com','senha123',1,0,0),(42,'Núbia Rocha','nubia.rocha@email.com','senha123',0,1,0),(43,'Samuel Lima','samuel.lima@email.com','senha123',1,1,0),(44,'Caroline Martins','caroline.martins@email.com','senha123',0,0,1),(45,'Alice Lima','alice.lima@email.com','senha123',1,0,0),(46,'Daniela Rocha','daniela.rocha@email.com','senha123',0,1,0),(47,'Marcelo Almeida','marcelo.almeida@email.com','senha123',1,1,0),(48,'Cláudio Souza','claudio.souza@email.com','senha123',0,0,1),(49,'Sílvia Oliveira','silvia.oliveira@email.com','senha123',1,0,0),(50,'Roberta Costa','roberta.costa@email.com','senha123',0,1,0),(51,'Fábio Santos','fabio.santos@email.com','senha123',1,1,0),(52,'Thais Martins','thais.martins@email.com','senha123',0,0,1),(53,'Guilherme Pereira','guilherme.pereira@email.com','senha123',1,0,0),(54,'Patrícia Rocha','patricia.rocha@email.com','senha123',0,1,0),(55,'Renato Costa','renato.costa@email.com','senha123',1,1,0),(56,'Karla Almeida','karla.almeida@email.com','senha123',0,0,1),(57,'Vinícius Santos','vinicius.santos@email.com','senha123',1,0,0),(58,'Sabrina Lima','sabrina.lima@email.com','senha123',0,1,0),(59,'Maurício Rocha','mauricio.rocha@email.com','senha123',1,1,0),(60,'Tatiane Souza','tatiane.souza@email.com','senha123',0,0,1),(61,'Douglas Costa','douglas.costa@email.com','senha123',1,0,0),(62,'Juliana Martins','juliana.martins@email.com','senha123',0,1,0),(63,'Luiz Fernando Almeida','luiz.fernando@email.com','senha123',1,1,0),(64,'Bruna Rocha','bruna.rocha@email.com','senha123',0,0,1),(65,'Fernando Pereira','fernando.pereira@email.com','senha123',1,0,0),(66,'Vanessa Costa','vanessa.costa@email.com','senha123',0,1,0),(67,'Lucas Martins','lucas.martins@email.com','senha123',1,1,0),(68,'Elisabete Lima','elisabete.lima@email.com','senha123',0,0,1),(69,'Tiago Rocha','tiago.rocha@email.com','senha123',1,0,0),(70,'Adriana Souza','adriana.souza@email.com','senha123',0,1,0),(71,'José Almeida','jose.almeida@email.com','senha123',1,1,0),(72,'Lúcia Costa','lucia.costa@email.com','senha123',0,0,1),(73,'Robson Martins','robson.martins@email.com','senha123',1,0,0),(74,'Camila Rocha','camila.rocha@email.com','senha123',0,1,0),(75,'Gustavo Almeida','gustavo.almeida@email.com','senha123',1,1,0),(76,'Sandra Souza','sandra.souza@email.com','senha123',0,0,1),(77,'Fábio Lima','fabio.lima@email.com','senha123',1,0,0),(78,'Rita Martins','rita.martins@email.com','senha123',0,1,0),(79,'Joana Pereira','joana.pereira@email.com','senha123',1,1,0),(80,'Roberta Almeida','roberta.almeida@email.com','senha123',0,0,1),(81,'Leandro Rocha','leandro.rocha@email.com','senha123',1,0,0),(82,'Monique Costa','monique.costa@email.com','senha123',0,1,0),(83,'Aline Souza','aline.souza@email.com','senha123',1,1,0),(84,'Marcio Lima','marcio.lima@email.com','senha123',0,0,1),(85,'Bruna Pereira','bruna.pereira@email.com','senha123',1,0,0),(86,'Adriano Rocha','adriano.rocha@email.com','senha123',0,1,0),(87,'Flávia Almeida','flavia.almeida@email.com','senha123',1,1,0),(88,'Robson Pereira','robson.pereira@email.com','senha123',0,0,1);