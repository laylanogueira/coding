CREATE DATABASE  IF NOT EXISTS `coding_` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `coding_`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: coding_
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `alternativa_perguntas`
--

DROP TABLE IF EXISTS `alternativa_perguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alternativa_perguntas` (
  `ID_ALTERNATIVA` int unsigned NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(500) NOT NULL,
  `RESPOSTA_CERTA` int NOT NULL DEFAULT '0',
  `DATA_CRIACAO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PERGUNTAS_AVALIACAO_ID_PERGUNTA` int unsigned NOT NULL,
  PRIMARY KEY (`ID_ALTERNATIVA`),
  KEY `fk_ALTERNATIVA_PERGUNTAS_PERGUNTAS_AVALIACAO1_idx` (`PERGUNTAS_AVALIACAO_ID_PERGUNTA`),
  CONSTRAINT `fk_ALTERNATIVA_PERGUNTAS_PERGUNTAS_AVALIACAO1` FOREIGN KEY (`PERGUNTAS_AVALIACAO_ID_PERGUNTA`) REFERENCES `perguntas_avaliacao` (`ID_PERGUNTA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternativa_perguntas`
--

LOCK TABLES `alternativa_perguntas` WRITE;
/*!40000 ALTER TABLE `alternativa_perguntas` DISABLE KEYS */;
INSERT INTO `alternativa_perguntas` VALUES (1,'0 2 1 0 2 1 0 2 1',2,'2020-06-22 22:15:03',1),(2,'1 1 1 2 2 1 0 2 1',0,'2020-06-22 22:15:03',1),(3,'2 2 1 2 0 1 0 2 2',0,'2020-06-22 22:15:03',1),(4,'xicara de café',1,'2020-06-22 22:15:03',2),(5,'Xicara de chá',0,'2020-06-22 22:15:03',2),(6,'Xicara de mentira',0,'2020-06-22 22:15:03',2),(7,'+',1,'2020-06-22 22:15:03',3),(8,'-',0,'2020-06-22 22:15:03',3),(9,'%',0,'2020-06-22 22:15:03',3);
/*!40000 ALTER TABLE `alternativa_perguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `ID_ALUNO` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(50) NOT NULL,
  `SOBRENOME` varchar(45) NOT NULL,
  `EMAIL_USUARIO` varchar(50) NOT NULL,
  `DATA_NASC` datetime NOT NULL,
  `SENHA` varchar(50) NOT NULL,
  `DATA_CADASTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_ALUNO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (2,'Juan','Nogueira','jsnogueira.web@gmail.com','1994-07-04 00:00:00','123456','2020-06-22 22:01:14'),(3,'Layla','Nogueira','layla.lsn83@gmail.com','2003-05-29 00:00:00','123456','2020-06-22 22:01:39');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aulas` (
  `ID_AULA` int unsigned NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(45) NOT NULL,
  `DESCRICAO` varchar(45) NOT NULL,
  `CONTEUDO_AULA` text NOT NULL,
  `FOTO_CAPA` varchar(45) DEFAULT NULL,
  `CURSO_ID_CURSO` int NOT NULL,
  PRIMARY KEY (`ID_AULA`),
  KEY `fk_AULAS_CURSO1_idx` (`CURSO_ID_CURSO`),
  CONSTRAINT `fk_AULAS_CURSO1` FOREIGN KEY (`CURSO_ID_CURSO`) REFERENCES `cursos` (`ID_CURSO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
INSERT INTO `aulas` VALUES (1,'Aula 1 - Introdução ao Java','Introdução ao Java','Conteúdo',NULL,2),(2,'Aula 2 - Variáveis','conhecendo variáveis','Conteúdo',NULL,2),(3,'Aula 3 - Operadores','conhecendo operadores','Conteúdo',NULL,2),(4,'Aula 4 - Introdução a orientação a objeto','conhecendo orientação a objeto','conteúdo',NULL,2);
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao_cursos`
--

DROP TABLE IF EXISTS `avaliacao_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao_cursos` (
  `ID_AVALIACAO` int unsigned NOT NULL AUTO_INCREMENT,
  `NOME` varchar(45) NOT NULL,
  `DESCRICAO` varchar(300) NOT NULL,
  `DATA_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `CURSO_ID_CURSO` int NOT NULL,
  `ACERTOS_APROVACAO` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`ID_AVALIACAO`),
  KEY `fk_AVALIACAO_CURSOS_CURSO1_idx` (`CURSO_ID_CURSO`),
  CONSTRAINT `fk_AVALIACAO_CURSOS_CURSO1` FOREIGN KEY (`CURSO_ID_CURSO`) REFERENCES `cursos` (`ID_CURSO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao_cursos`
--

LOCK TABLES `avaliacao_cursos` WRITE;
/*!40000 ALTER TABLE `avaliacao_cursos` DISABLE KEYS */;
INSERT INTO `avaliacao_cursos` VALUES (1,'Prova final','Avaliação final curso de Java básico','2020-06-22 22:08:18',2,5);
/*!40000 ALTER TABLE `avaliacao_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `ID_CATEGORIA` int unsigned NOT NULL AUTO_INCREMENT,
  `NOME` varchar(45) NOT NULL,
  `DATA_CRIACAO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Java','2020-06-22 22:02:08'),(2,'HTML','2020-06-22 22:02:08'),(3,'Git','2020-06-22 22:02:08');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `ID_CURSO` int NOT NULL AUTO_INCREMENT,
  `CATEGORIA_ID_CATEGORIA` int unsigned NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `DESCRICAO` varchar(500) NOT NULL,
  `FOTO` varchar(45) DEFAULT NULL,
  `DATA_CRIACAO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_CURSO`),
  KEY `fk_CURSO_CATEGORIA1_idx` (`CATEGORIA_ID_CATEGORIA`),
  CONSTRAINT `fk_CURSO_CATEGORIA1` FOREIGN KEY (`CATEGORIA_ID_CATEGORIA`) REFERENCES `categorias` (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (2,1,'Java Básico','Curso básico de java - lógica de programação, orientação a objeto e polimorfismo.',NULL,'2020-06-22 22:03:57');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perguntas_avaliacao`
--

DROP TABLE IF EXISTS `perguntas_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perguntas_avaliacao` (
  `ID_PERGUNTA` int unsigned NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(1000) NOT NULL,
  `DATA_CRIACAO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AVALIACAO_CURSOS_ID_AVALIACAO` int unsigned NOT NULL,
  PRIMARY KEY (`ID_PERGUNTA`),
  KEY `fk_PERGUNTAS_AVALIACAO_AVALIACAO_CURSOS1_idx` (`AVALIACAO_CURSOS_ID_AVALIACAO`),
  CONSTRAINT `fk_PERGUNTAS_AVALIACAO_AVALIACAO_CURSOS1` FOREIGN KEY (`AVALIACAO_CURSOS_ID_AVALIACAO`) REFERENCES `avaliacao_cursos` (`ID_AVALIACAO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perguntas_avaliacao`
--

LOCK TABLES `perguntas_avaliacao` WRITE;
/*!40000 ALTER TABLE `perguntas_avaliacao` DISABLE KEYS */;
INSERT INTO `perguntas_avaliacao` VALUES (1,'Os operadores possuem regras que são aplicadas nsa expressões aritméticas do Java, que são as mesmas seguidas em álgebra. quando dizemos que os operadores são aplicados da esquerda para a direita, estamos nos referindo à sua associatividade. Considere o programa abaixo escrito em Java: public class Prog{ public static void main(String args[]){ for(int = 3; i < 20; i+=2) System.out.print((i%3) + \" \"); }}}','2020-06-22 22:11:12',1),(2,'Qual o símbolo do Java?','2020-06-22 22:13:00',1),(3,'Qual operador utilizado para somar dois valores inteiros?','2020-06-22 22:13:00',1);
/*!40000 ALTER TABLE `perguntas_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progresso_aulas`
--

DROP TABLE IF EXISTS `progresso_aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progresso_aulas` (
  `cadastro_ID_USUARIO` int NOT NULL,
  `AULAS_ID_AULA` int unsigned NOT NULL,
  `DATA_PROGRESSO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cadastro_ID_USUARIO`,`AULAS_ID_AULA`),
  KEY `fk_PROGRESSO_AULAS_cadastro1_idx` (`cadastro_ID_USUARIO`),
  KEY `fk_PROGRESSO_AULAS_AULAS1_idx` (`AULAS_ID_AULA`),
  CONSTRAINT `fk_PROGRESSO_AULAS_AULAS1` FOREIGN KEY (`AULAS_ID_AULA`) REFERENCES `aulas` (`ID_AULA`),
  CONSTRAINT `fk_PROGRESSO_AULAS_cadastro1` FOREIGN KEY (`cadastro_ID_USUARIO`) REFERENCES `alunos` (`ID_ALUNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progresso_aulas`
--

LOCK TABLES `progresso_aulas` WRITE;
/*!40000 ALTER TABLE `progresso_aulas` DISABLE KEYS */;
INSERT INTO `progresso_aulas` VALUES (2,1,'2020-06-22 22:23:04');
/*!40000 ALTER TABLE `progresso_aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provas_cursos`
--

DROP TABLE IF EXISTS `provas_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provas_cursos` (
  `ID_PROVA` int unsigned NOT NULL AUTO_INCREMENT,
  `DATA_REALIZACAO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ALUNOS_ID_ALUNO` int NOT NULL,
  `AVALIACAO_CURSOS_ID_AVALIACAO` int unsigned NOT NULL,
  `QUANTIDADE_ACERTOS` int NOT NULL,
  `RESULTADO` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_PROVA`),
  KEY `fk_PROVAS_CURSOS_ALUNOS1_idx` (`ALUNOS_ID_ALUNO`),
  KEY `fk_PROVAS_CURSOS_AVALIACAO_CURSOS1_idx` (`AVALIACAO_CURSOS_ID_AVALIACAO`),
  CONSTRAINT `fk_PROVAS_CURSOS_ALUNOS1` FOREIGN KEY (`ALUNOS_ID_ALUNO`) REFERENCES `alunos` (`ID_ALUNO`),
  CONSTRAINT `fk_PROVAS_CURSOS_AVALIACAO_CURSOS1` FOREIGN KEY (`AVALIACAO_CURSOS_ID_AVALIACAO`) REFERENCES `avaliacao_cursos` (`ID_AVALIACAO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provas_cursos`
--

LOCK TABLES `provas_cursos` WRITE;
/*!40000 ALTER TABLE `provas_cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `provas_cursos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-22 22:46:26
