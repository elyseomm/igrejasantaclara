CREATE TABLE `docsBatismo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `documento` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Documentos para o batismo',
  `ativo` int NOT NULL DEFAULT '1' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;