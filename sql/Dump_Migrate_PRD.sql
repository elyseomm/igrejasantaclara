CREATE DATABASE  IF NOT EXISTS `bdsc` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdsc`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdsc
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alunos_ivc`
--

DROP TABLE IF EXISTS `alunos_ivc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `alunos_ivc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mae` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL COMMENT 'Nome da Mãe',
  `pai` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL COMMENT 'Nome do Pai',
  `dtnasc` date NOT NULL,
  `dtcad` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sexo` int NOT NULL DEFAULT '0' COMMENT '0 - Feminino / 1 - Masculino',
  `naturalidade` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL COMMENT 'Estado Natal',
  `estadocivil` int NOT NULL DEFAULT '0' COMMENT '0 - Solteiro/ 1 - Casado',
  `escolaridade` int DEFAULT '0' COMMENT '0 - Analfabeto',
  `endereco` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `nr` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `bairro` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `cidade` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ehengajado` int NOT NULL DEFAULT '0' COMMENT '0 -Não / 1 - Sim',
  `desc_engajamento` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `sacramento` int NOT NULL DEFAULT '0' COMMENT '0 - Nenhum/ 1 - Batismo / 2 - Primeira Eucaristia / 2 - Crisma / 3 - Matrimônio',
  `vaiamissa` int NOT NULL DEFAULT '0' COMMENT '0 - Não / 1 - Sim',
  `outra_religiao` int DEFAULT '0' COMMENT '0 - Não / 1 - Sim',
  `desc_religiao` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ehartista` int DEFAULT '0' COMMENT '0 - Não / 1 - Sim',
  `desc_arte` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `obs` text CHARACTER SET latin1 COLLATE latin1_bin,
  `idresponsavel` int NOT NULL,
  `grauparentesco` int DEFAULT NULL,
  `ativo` int NOT NULL DEFAULT '1' COMMENT '0 -Inativo / 1 - Ativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos_ivc`
--

LOCK TABLES `alunos_ivc` WRITE;
/*!40000 ALTER TABLE `alunos_ivc` DISABLE KEYS */;
INSERT INTO `alunos_ivc` VALUES (1,'Meu Teste da Silva','Luiza Carla da Costa','','2022-10-05','2022-10-22 05:10:35',0,'',0,0,'','','','',0,'',0,1,0,'',0,'','',1,0,1),(2,'Teste 3','Luiza Carla da Costa','','2022-10-03','2022-10-25 02:40:10',1,'',0,0,'','','','',0,'',1,1,0,'',0,'','',1,0,1),(3,'Teste 31','Luiza Carla da Costa','','2022-10-25','2022-10-25 15:27:06',0,'',0,0,'','','','',0,'',0,1,0,'',0,'','',1,0,1),(4,'Teste 32','Luiza Carla da Costa','','2022-10-03','2022-10-25 15:32:00',0,'',0,0,'','','','',0,'',0,1,0,'',0,'','',1,0,1);
/*!40000 ALTER TABLE `alunos_ivc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batismos`
--

DROP TABLE IF EXISTS `batismos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `batismos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `idcelebrante` int NOT NULL,
  `dtcad` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dtevento` timestamp NULL DEFAULT NULL COMMENT 'Data do Batismo',
  `pai` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `mae` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `padrinho` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `madrinha` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `local` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL COMMENT 'Local do batiismo',
  `ativo` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batismos`
--

LOCK TABLES `batismos` WRITE;
/*!40000 ALTER TABLE `batismos` DISABLE KEYS */;
/*!40000 ALTER TABLE `batismos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catequistas`
--

DROP TABLE IF EXISTS `catequistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `catequistas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `telefone` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `email` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `endereco` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `nr` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `bairro` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `cidade` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `cep` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ativo` int NOT NULL DEFAULT '1' COMMENT '0 -Inativo / 1 - Ativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catequistas`
--

LOCK TABLES `catequistas` WRITE;
/*!40000 ALTER TABLE `catequistas` DISABLE KEYS */;
INSERT INTO `catequistas` VALUES (1,'Alex Silva dos Santos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,'Cíntia Cassiano',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(3,'Edgar Laborda',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(4,'Elyseo Mesquita','92-982041339','elyseomm@gmail.com',NULL,NULL,'Aleixo','Manaus','69060-103',1),(5,'Hannah Amoedo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(6,'Igor Santos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(7,'Italo Brasil Reis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(8,'Josinete Correia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(9,'Letícia Holanda de Almeida',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10,'Maria Elizeth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(11,'Tatiane',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `catequistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contatos`
--

DROP TABLE IF EXISTS `contatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `contatos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `funcao` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `telefone` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `obs` text CHARACTER SET latin1 COLLATE latin1_bin,
  `ativo` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contatos`
--

LOCK TABLES `contatos` WRITE;
/*!40000 ALTER TABLE `contatos` DISABLE KEYS */;
INSERT INTO `contatos` VALUES (1,'Secretário Paroquial','Antônio',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `contatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursosbatismo`
--

DROP TABLE IF EXISTS `cursosbatismo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `cursosbatismo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `celebrante` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `auxiliar` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `telefone` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `local` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `dtevento` timestamp NOT NULL,
  `dtcad` TIMESTAMP NOT NULL,
  `ativo` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursosbatismo`
--

LOCK TABLES `cursosbatismo` WRITE;
/*!40000 ALTER TABLE `cursosbatismo` DISABLE KEYS */;
INSERT INTO `cursosbatismo` VALUES (1,'Alvino Golveia','Genoveva Valente',NULL,'Paróqui de Santa Clara','2022-12-10 03:00:00','2022-10-15 16:48:19',1);
/*!40000 ALTER TABLE `cursosbatismo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docsbatismo`
--

DROP TABLE IF EXISTS `docsbatismo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `docsbatismo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `documento` varchar(800) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'Documentos para o batismo',
  `ativo` int NOT NULL DEFAULT '1' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docsbatismo`
--

LOCK TABLES `docsbatismo` WRITE;
/*!40000 ALTER TABLE `docsbatismo` DISABLE KEYS */;
INSERT INTO `docsbatismo` VALUES (1,'Criança: Cópia de Certidão de Nascimento',1),(2,'Pais: Se casados no religioso, cópia da certidão de casamento religioso(católico); Cópia do comprovante de residência',1),(3,'Padrinhos: Se casados, cópia da certidão de casamento religioso; Se solteiros, cópia do RG; Cópia da Certidão ou lembrança do Crisma(se houver)',1),(4,'Cópia do Comprovante de preparação para o Batismo, caso pais e/ou padrinhos tenham feito o curso em outro local',1),(5,'Se a criança não for residente nesta comunidade, trazer a transferência da paróquia ou Área Missionária onde reside',1);
/*!40000 ALTER TABLE `docsbatismo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docsmatrimonio`
--

DROP TABLE IF EXISTS `docsmatrimonio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `docsmatrimonio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `documento` varchar(800) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'Nome do documento',
  `ativo` int DEFAULT '1' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docsmatrimonio`
--

LOCK TABLES `docsmatrimonio` WRITE;
/*!40000 ALTER TABLE `docsmatrimonio` DISABLE KEYS */;
INSERT INTO `docsmatrimonio` VALUES (1,'Protocolo do Processo Civil e/ou Certidão de Casamento Civil',1),(2,'Cópias RG dos Noivos',1),(3,'Cópia do Comprovante de Residência do Casal',1),(4,'Cópias RG das testemunhas e comprovante de Residência',1),(5,'Certidão de Batismo do Casal/Fins Matrimoniais',1),(6,'Certidão de Óbito, caso um dos noivos seja Viúvo(a)',1),(7,'Transferência da paróquia de origem(se for o caso)',1);
/*!40000 ALTER TABLE `docsmatrimonio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrimonios`
--

DROP TABLE IF EXISTS `matrimonios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `matrimonios` (
  `id` int NOT NULL,
  `idparoco` int NOT NULL,
  `dtcad` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `noivo` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `noiva` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `data` date NOT NULL,
  `hora` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `local` varchar(500) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `nrlivro` varchar(60) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `obs` text CHARACTER SET latin1 COLLATE latin1_bin,
  `efetuado` int NOT NULL DEFAULT '0',
  `ativo` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrimonios`
--

LOCK TABLES `matrimonios` WRITE;
/*!40000 ALTER TABLE `matrimonios` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrimonios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parocos`
--

DROP TABLE IF EXISTS `parocos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `parocos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'Nome dos padres',
  `ehvigario` int DEFAULT '0' COMMENT 'Caso seja vigário',
  `telefone` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `dtnasc` date NOT NULL,
  `dtordem` date DEFAULT NULL,
  `cidadeorigem` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ativo` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parocos`
--

LOCK TABLES `parocos` WRITE;
/*!40000 ALTER TABLE `parocos` DISABLE KEYS */;
INSERT INTO `parocos` VALUES (1,'Jailson',0,NULL,'1965-05-12',NULL,'Salvador',1),(2,'Amado',1,NULL,'1965-05-12',NULL,NULL,1);
/*!40000 ALTER TABLE `parocos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paroquia`
--

DROP TABLE IF EXISTS `paroquia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `paroquia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'Nome da Igreja',
  `dtcad` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de Cadastro',
  `dtfundacao` date DEFAULT NULL,
  `endereco` varchar(500) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `cep` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `telefone` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `facebook` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `instagram` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `geoloc` varchar(1000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `telefones` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `obs` text CHARACTER SET latin1 COLLATE latin1_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paroquia`
--

LOCK TABLES `paroquia` WRITE;
/*!40000 ALTER TABLE `paroquia` DISABLE KEYS */;
INSERT INTO `paroquia` VALUES (1,'Igreja de Santa Clara','2022-10-15 17:00:12',NULL,'R. 31, 1-169 - Cidade Nova, Manaus - AM','69097-758','3304-1774','santaclara400@gmail.com','https://m.facebook.com/profile.php?id=100070845896710&_rdr',NULL,'https://www.google.com/maps/dir/-3.0758917,-59.9912634/Igreja+Católica+Santa+Clara+-+R.+31,+1-169+-+Cidade+Nova,+Manaus+-+AM,+69097-758/@-3.0443107,-60.0087601,13z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x926c190d281bc01b:0x5c9f2e65399f9d48!2m2!1d-59.9710091!2d-3.0132874',NULL,NULL);
/*!40000 ALTER TABLE `paroquia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisitospadrinhosbatismo`
--

DROP TABLE IF EXISTS `requisitospadrinhosbatismo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `requisitospadrinhosbatismo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `requisito` varchar(800) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'Requisito/Critério para ser padrinho de batismo',
  `ativo` int NOT NULL DEFAULT '1' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisitospadrinhosbatismo`
--

LOCK TABLES `requisitospadrinhosbatismo` WRITE;
/*!40000 ALTER TABLE `requisitospadrinhosbatismo` DISABLE KEYS */;
INSERT INTO `requisitospadrinhosbatismo` VALUES (1,'1) Para alguém, ser padrinho ou madrinha é necessário:  a) Ser designado pelo próprio batizado, se adultop, por seus pais, ou por quem lhes faz ser vezes, na falta deles,  	   pelo próprio pároco ou ministro, e ter aptidão e intenção de cumprir as obrigações desse encargo; 	b) Ter completado dezesseis anos de idade; 	c) Ser católico, conformado(CRISMA), já tenha recebido o Santíssimo Sacramento da Eucaristia e leve uma vida de  	   acordo com a Fé e encargo que vai assumir; 	d) Não tenha sido atingido por nenhuma pena canônica legitimamente declarada; 	e) Não ser Pai ou Mãe do batizado (cf. Câm. 874, $1); 	f) Participar de preparação feita em data antecedente ao Batismo;\r',1),(2,'2)Para evitar o modismo social e obedecer à preceituação canônica, não se admita mais de um casal para padrinhos de batismo',1),(3,'3) Membros de Igreja ou comunidade eclesial não católica não podem ser padrinhos no sentido litúrgico e canônico, mas, havendo justa causa(parentesco, amizade, etc), junto com um padrinho católico, só podem ser admitidos como testemunhas do Batismo. Tais fatos deverão ser registrados nos Livros de Batismo(cf. Cân. 874,$2)',1),(4,'4) Basta apenas um padrinho ou madrinha. \"Se não houver padrinho, aquele que administra o Batismo cuide que haja pelo menos uma testemunha, pela qual se possa provar a administração do Batismo\" (Cân. 875)',1),(5,'5) Caso os padrinhos não reúnam todos os critérios requeridos pela Igreja, devem conversar com o pároco na Secretaria, às Terças, Quintas e Sábados, nos horários das 9h às 11:30 e das 15h às 17h',1);
/*!40000 ALTER TABLE `requisitospadrinhosbatismo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsaveis_ivc`
--

DROP TABLE IF EXISTS `responsaveis_ivc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `responsaveis_ivc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `telefones` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `dtcad` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` int NOT NULL DEFAULT '1' COMMENT '0 -Inativo / 1 - Ativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsaveis_ivc`
--

LOCK TABLES `responsaveis_ivc` WRITE;
/*!40000 ALTER TABLE `responsaveis_ivc` DISABLE KEYS */;
INSERT INTO `responsaveis_ivc` VALUES (1,'Luiza Carla da Costa','92994147990','','2022-10-20 21:11:49',1);
/*!40000 ALTER TABLE `responsaveis_ivc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferencias`
--

DROP TABLE IF EXISTS `transferencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `transferencias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL COMMENT 'Nome da Pessoa',
  `destparoquia` varchar(100) NOT NULL COMMENT 'Paróquia de Destino',
  `motivo` varchar(500) DEFAULT NULL,
  `dtcad` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de cadastro da transferência',
  `dtevento` date DEFAULT NULL COMMENT 'Data da ocorrência do evento',
  `ativo` int NOT NULL DEFAULT '1' COMMENT '1- Ativo / 0- Inativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferencias`
--

LOCK TABLES `transferencias` WRITE;
/*!40000 ALTER TABLE `transferencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_alunos_ivc`
--

DROP TABLE IF EXISTS `turma_alunos_ivc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `turma_alunos_ivc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idturma` int NOT NULL,
  `idaluno` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_alunos_ivc`
--

LOCK TABLES `turma_alunos_ivc` WRITE;
/*!40000 ALTER TABLE `turma_alunos_ivc` DISABLE KEYS */;
INSERT INTO `turma_alunos_ivc` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4);
/*!40000 ALTER TABLE `turma_alunos_ivc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turmas_ivc`
--

DROP TABLE IF EXISTS `turmas_ivc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `turmas_ivc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `sala` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `idcatequista` int NOT NULL,
  `ano` int NOT NULL,
  `idade_ini` int DEFAULT NULL,
  `idade_fim` int DEFAULT NULL,
  `ativo` int NOT NULL DEFAULT '1' COMMENT '0 - Inativo / 1 - Ativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turmas_ivc`
--

LOCK TABLES `turmas_ivc` WRITE;
/*!40000 ALTER TABLE `turmas_ivc` DISABLE KEYS */;
INSERT INTO `turmas_ivc` VALUES (1,'Turma Alex',NULL,1,2022,NULL,NULL,1),(2,'Crisma Adultos - Edgar','São Pe Pio',3,2022,14,17,1),(3,'Turma Cíntia',NULL,2,2022,6,10,1),(4,'Crisma Adultos - Letícia',NULL,9,2022,14,17,1),(5,'Turma Ítalo ',NULL,7,2022,NULL,NULL,1);
/*!40000 ALTER TABLE `turmas_ivc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = latin1 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `senha` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `nivel` int NOT NULL DEFAULT '0' COMMENT '0 - Anonimo / 1 - Catequista / 2 - Secretario',
  `ativo` int NOT NULL DEFAULT '1' COMMENT '0 - Inativo / 1 - Ativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','admin',3,1),(2,'elyseo','123456',2,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_turmas`
--

DROP TABLE IF EXISTS `vw_turmas`;
/*!50001 DROP VIEW IF EXISTS `vw_turmas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = latin1 */;
/*!50001 CREATE VIEW `vw_turmas` AS SELECT 
 1 AS `id`,
 1 AS `turma`,
 1 AS `sala`,
 1 AS `catequista`,
 1 AS `aluno`,
 1 AS `responsavel`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_turmas`
--

/*!50001 DROP VIEW IF EXISTS `vw_turmas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_bin */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_turmas` AS select `t`.`id` AS `id`,`t`.`nome` AS `turma`,`t`.`sala` AS `sala`,`c`.`nome` AS `catequista`,`a`.`nome` AS `aluno`,`r`.`nome` AS `responsavel` from ((((`turmas_ivc` `t` left join `turma_alunos_ivc` `ta` on((`ta`.`idturma` = `t`.`id`))) left join `alunos_ivc` `a` on((`a`.`id` = `ta`.`idaluno`))) left join `catequistas` `c` on((`c`.`id` = `t`.`idcatequista`))) left join `responsaveis_ivc` `r` on((`r`.`id` = `a`.`idresponsavel`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-28  0:09:28
