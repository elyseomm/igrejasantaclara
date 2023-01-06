-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: bdsc
-- Source Schemata: bdsc
-- Created: Tue Dec 27 22:27:34 2022
-- Workbench Version: 8.0.29
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema bdsc
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `bdsc` ;
CREATE SCHEMA IF NOT EXISTS `bdsc` ;

-- ----------------------------------------------------------------------------
-- Table bdsc.alunos_ivc
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`alunos_ivc` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `mae` VARCHAR(100) NULL DEFAULT NULL COMMENT 'Nome da Mãe',
  `pai` VARCHAR(100) NULL DEFAULT NULL COMMENT 'Nome do Pai',
  `dtnasc` DATE NOT NULL,
  `dtcad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sexo` INT NOT NULL DEFAULT '0' COMMENT '0 - Feminino / 1 - Masculino',
  `naturalidade` VARCHAR(80) NULL DEFAULT NULL COMMENT 'Estado Natal',
  `estadocivil` INT NOT NULL DEFAULT '0' COMMENT '0 - Solteiro/ 1 - Casado',
  `escolaridade` INT NULL DEFAULT '0' COMMENT '0 - Analfabeto',
  `endereco` VARCHAR(100) NULL DEFAULT NULL,
  `nr` VARCHAR(15) NULL DEFAULT NULL,
  `bairro` VARCHAR(80) NULL DEFAULT NULL,
  `cidade` VARCHAR(80) NULL DEFAULT NULL,
  `ehengajado` INT NOT NULL DEFAULT '0' COMMENT '0 -Não / 1 - Sim',
  `desc_engajamento` VARCHAR(100) NULL DEFAULT NULL,
  `sacramento` INT NOT NULL DEFAULT '0' COMMENT '0 - Nenhum/ 1 - Batismo / 2 - Primeira Eucaristia / 2 - Crisma / 3 - Matrimônio',
  `vaiamissa` INT NOT NULL DEFAULT '0' COMMENT '0 - Não / 1 - Sim',
  `outra_religiao` INT NULL DEFAULT '0' COMMENT '0 - Não / 1 - Sim',
  `desc_religiao` VARCHAR(80) NULL DEFAULT NULL,
  `ehartista` INT NULL DEFAULT '0' COMMENT '0 - Não / 1 - Sim',
  `desc_arte` VARCHAR(100) NULL DEFAULT NULL,
  `obs` TEXT NULL DEFAULT NULL,
  `idresponsavel` INT NOT NULL,
  `grauparentesco` INT NULL DEFAULT NULL,
  `ativo` INT NOT NULL DEFAULT '1' COMMENT '0 -Inativo / 1 - Ativo',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.batismos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`batismos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idcelebrante` INT NOT NULL,
  `dtcad` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `dtevento` TIMESTAMP NULL DEFAULT NULL COMMENT 'Data do Batismo',
  `pai` VARCHAR(100) NULL DEFAULT NULL,
  `mae` VARCHAR(100) NULL DEFAULT NULL,
  `padrinho` VARCHAR(100) NULL DEFAULT NULL,
  `madrinha` VARCHAR(100) NULL DEFAULT NULL,
  `local` VARCHAR(100) NULL DEFAULT NULL COMMENT 'Local do batiismo',
  `ativo` INT NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.catequistas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`catequistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `telefone` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(80) NULL DEFAULT NULL,
  `endereco` VARCHAR(100) NULL DEFAULT NULL,
  `nr` VARCHAR(15) NULL DEFAULT NULL,
  `bairro` VARCHAR(80) NULL DEFAULT NULL,
  `cidade` VARCHAR(80) NULL DEFAULT NULL,
  `cep` VARCHAR(15) NULL DEFAULT NULL,
  `ativo` INT NOT NULL DEFAULT '1' COMMENT '0 -Inativo / 1 - Ativo',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.contatos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`contatos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `funcao` VARCHAR(100) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `telefone` VARCHAR(15) NULL DEFAULT NULL,
  `obs` TEXT NULL DEFAULT NULL,
  `ativo` INT NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.cursosbatismo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`cursosbatismo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `celebrante` VARCHAR(100) NOT NULL,
  `auxiliar` VARCHAR(100) NULL DEFAULT NULL,
  `telefone` VARCHAR(45) NULL DEFAULT NULL,
  `local` VARCHAR(100) NULL DEFAULT NULL,
  `dtevento` TIMESTAMP NOT NULL,
  `dtcad` TIMESTAMP NOT NULL,
  `ativo` INT NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.docsbatismo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`docsbatismo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `documento` VARCHAR(800) CHARACTER SET 'utf8mb3' NOT NULL COMMENT 'Documentos para o batismo',
  `ativo` INT NOT NULL DEFAULT '1' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.docsmatrimonio
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`docsmatrimonio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `documento` VARCHAR(800) CHARACTER SET 'utf8mb3' NOT NULL COMMENT 'Nome do documento',
  `ativo` INT NULL DEFAULT '1' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.matrimonios
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`matrimonios` (
  `id` INT NOT NULL,
  `idparoco` INT NOT NULL,
  `dtcad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `noivo` VARCHAR(100) NOT NULL,
  `noiva` VARCHAR(100) NOT NULL,
  `data` DATE NOT NULL,
  `hora` VARCHAR(10) NOT NULL,
  `local` VARCHAR(500) NULL DEFAULT NULL,
  `nrlivro` VARCHAR(60) NULL DEFAULT NULL,
  `obs` TEXT NULL DEFAULT NULL,
  `efetuado` INT NOT NULL DEFAULT '0',
  `ativo` INT NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.parocos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`parocos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) CHARACTER SET 'utf8mb3' NOT NULL COMMENT 'Nome dos padres',
  `ehvigario` INT NULL DEFAULT '0' COMMENT 'Caso seja vigário',
  `telefone` VARCHAR(45) NULL DEFAULT NULL,
  `dtnasc` DATE NOT NULL,
  `dtordem` DATE NULL DEFAULT NULL,
  `cidadeorigem` VARCHAR(80) NULL DEFAULT NULL,
  `ativo` INT NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.paroquia
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`paroquia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL COMMENT 'Nome da Igreja',
  `dtcad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de Cadastro',
  `dtfundacao` DATE NULL DEFAULT NULL,
  `endereco` VARCHAR(500) NULL DEFAULT NULL,
  `cep` VARCHAR(10) NULL DEFAULT NULL,
  `telefone` VARCHAR(15) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `facebook` VARCHAR(100) NULL DEFAULT NULL,
  `instagram` VARCHAR(100) NULL DEFAULT NULL,
  `geoloc` VARCHAR(1000) NULL DEFAULT NULL,
  `telefones` VARCHAR(45) NULL DEFAULT NULL,
  `obs` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.requisitospadrinhosbatismo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`requisitospadrinhosbatismo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `requisito` VARCHAR(800) CHARACTER SET 'utf8mb3' NOT NULL COMMENT 'Requisito/Critério para ser padrinho de batismo',
  `ativo` INT NOT NULL DEFAULT '1' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.responsaveis_ivc
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`responsaveis_ivc` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `telefones` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `dtcad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` INT NOT NULL DEFAULT '1' COMMENT '0 -Inativo / 1 - Ativo',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.transferencias
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`transferencias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL COMMENT 'Nome da Pessoa',
  `destparoquia` VARCHAR(100) NOT NULL COMMENT 'Paróquia de Destino',
  `motivo` VARCHAR(500) NULL DEFAULT NULL,
  `dtcad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de cadastro da transferência',
  `dtevento` DATE NULL DEFAULT NULL COMMENT 'Data da ocorrência do evento',
  `ativo` INT NOT NULL DEFAULT '1' COMMENT '1- Ativo / 0- Inativo',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.turma_alunos_ivc
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`turma_alunos_ivc` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idturma` INT NOT NULL,
  `idaluno` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.turmas_ivc
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`turmas_ivc` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `sala` VARCHAR(80) NULL DEFAULT NULL,
  `idcatequista` INT NOT NULL,
  `ano` INT NOT NULL,
  `idade_ini` INT NULL DEFAULT NULL,
  `idade_fim` INT NULL DEFAULT NULL,
  `ativo` INT NOT NULL DEFAULT '1' COMMENT '0 - Inativo / 1 - Ativo',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table bdsc.usuarios
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsc`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(80) NOT NULL,
  `senha` VARCHAR(80) NOT NULL,
  `nivel` INT NOT NULL DEFAULT '0' COMMENT '0 - Anonimo / 1 - Catequista / 2 - Secretario',
  `ativo` INT NOT NULL DEFAULT '1' COMMENT '0 - Inativo / 1 - Ativo',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- View bdsc.vw_turmas
-- ----------------------------------------------------------------------------
USE `bdsc`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vw_turmas` AS select `t`.`id` AS `id`,`t`.`nome` AS `turma`,`t`.`sala` AS `sala`,`c`.`nome` AS `catequista`,`a`.`nome` AS `aluno`,`r`.`nome` AS `responsavel` from ((((`turmas_ivc` `t` left join `turma_alunos_ivc` `ta` on((`ta`.`idturma` = `t`.`id`))) left join `alunos_ivc` `a` on((`a`.`id` = `ta`.`idaluno`))) left join `catequistas` `c` on((`c`.`id` = `t`.`idcatequista`))) left join `responsaveis_ivc` `r` on((`r`.`id` = `a`.`idresponsavel`)));
SET FOREIGN_KEY_CHECKS = 1;
