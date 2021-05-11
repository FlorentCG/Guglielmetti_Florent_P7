-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 10 mai 2021 à 13:57
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `groupomania`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `idcomments` int(11) NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  `media` varchar(255) DEFAULT NULL,
  `idusers` int(11) NOT NULL,
  `idpublications` int(11) NOT NULL,
  PRIMARY KEY (`idcomments`,`idusers`,`idpublications`),
  KEY `fk_comment_user1_idx` (`idusers`) USING BTREE,
  KEY `fk_comment_publication1_idx` (`idpublications`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `like`
--

DROP TABLE IF EXISTS `like`;
CREATE TABLE IF NOT EXISTS `like` (
  `idlike` int(11) NOT NULL AUTO_INCREMENT,
  `like` tinyint(4) DEFAULT '0',
  `idpublications` int(11) NOT NULL,
  `idusers` int(11) NOT NULL,
  PRIMARY KEY (`idlike`,`idpublications`,`idusers`),
  KEY `fk_like_publication1_idx` (`idpublications`) USING BTREE,
  KEY `fk_like_user1_idx` (`idusers`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `publication`
--

DROP TABLE IF EXISTS `publication`;
CREATE TABLE IF NOT EXISTS `publication` (
  `idpublications` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL,
  `body` text NOT NULL,
  `media` varchar(255) DEFAULT NULL,
  `idusers` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idpublications`,`idusers`),
  KEY `fk_publication_user1_idx` (`idusers`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `admin` tinyint(4) NOT NULL DEFAULT '0',
  `media` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE KEY `userEmail_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idusers`, `firstname`, `lastname`, `email`, `userPassword`, `admin`, `media`, `description`) VALUES
(40, 'Nicolas', 'Augé', 'groupo@gmail.com', '$2b$10$ha.lLl5u7MqWZDlVh5uHnuypic3Q.nQ4Lo6O7y8RKwbCysCgfUb4K', 1, 'http://localhost:3000/images/profile/Red_blue_squares_mirrored.svg.png1620633158567.png', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`idusers`) REFERENCES `user` (`idusers`) ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`idpublications`) REFERENCES `publication` (`idpublications`);

--
-- Contraintes pour la table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `like_ibfk_1` FOREIGN KEY (`idpublications`) REFERENCES `publication` (`idpublications`),
  ADD CONSTRAINT `like_ibfk_2` FOREIGN KEY (`idusers`) REFERENCES `user` (`idusers`);

--
-- Contraintes pour la table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`idusers`) REFERENCES `user` (`idusers`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
