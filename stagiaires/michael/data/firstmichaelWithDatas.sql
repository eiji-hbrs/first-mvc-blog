-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 12 juin 2026 à 12:13
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `firstmichael`
--
DROP DATABASE IF EXISTS `firstmichael`;
CREATE DATABASE IF NOT EXISTS `firstmichael` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `firstmichael`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Temps du serveur actuel : CURRENT_TIMESTAMP ou NOW()',
  `published` tinyint UNSIGNED DEFAULT '1' COMMENT 'Valeur de 0 à 255\n0 => non publié\n1 => publié\n2 => caché',
  `user_id` int UNSIGNED NOT NULL COMMENT 'Un article ne peut avoir 1 seul user',
  PRIMARY KEY (`id`),
  KEY `fk_article_user_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `date`, `published`, `user_id`) VALUES
(1, 'PHP Sandbox', 'Donate and get premium\r\nI depend on donations and ad revenue to keep this website running, donations are very much appreciated!\r\n\r\nAny donation helps, and it will give you a year of premium, you decide what you want to pay.\r\n\r\nYou have premium, thank you so much for donating! Your premium features will be active for another 102 days. Donating again will add 365 days to the expiration date.', '2026-06-12 12:08:11', 1, 1),
(2, 'first-mvc-blog', 'En PHP Procédural, structure MVC et base de donnée MySQL\r\n\r\n\r\nNous allons faire un blog avec des utilisateurs, des articles et des rubriques\r\n\r\nPrincipes de la structure MVC\r\n\r\nModèle (Model) : C\'est la partie qui gère les données et la logique métier de l\'application. Il interagit avec la base de données pour récupérer, insérer, mettre à jour ou supprimer des données. Le modèle ne contient aucune logique de présentation.\r\n\r\nVue (View) : C\'est la partie qui gère la présentation des données. Elle est responsable de l\'affichage des informations à l\'utilisateur. La vue reçoit les données du modèle et les affiche de manière appropriée, souvent en utilisant du HTML, CSS et parfois du JavaScript.\r\n\r\nContrôleur (Controller) : C\'est la partie qui agit comme un intermédiaire entre le modèle et la vue. Le contrôleur reçoit les requêtes de l\'utilisateur, interagit avec le modèle pour traiter les données, puis sélectionne la vue appropriée pour afficher les résultats à l\'utilisateur.', '2026-06-12 12:10:59', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(1, 'categ1', 'categ1'),
(2, 'categ2', 'categ2'),
(3, 'categ3', 'categ3');

-- --------------------------------------------------------

--
-- Structure de la table `category_has_article`
--

DROP TABLE IF EXISTS `category_has_article`;
CREATE TABLE IF NOT EXISTS `category_has_article` (
  `category_id` int UNSIGNED NOT NULL,
  `article_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`category_id`,`article_id`),
  KEY `fk_category_has_article_article1_idx` (`article_id`),
  KEY `fk_category_has_article_category1_idx` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category_has_article`
--

INSERT INTO `category_has_article` (`category_id`, `article_id`) VALUES
(1, 1),
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id par défaut\nobligatoire mais autoincrément\nunsigned',
  `username` varchar(30) NOT NULL COMMENT 'Pour se connecter',
  `email` varchar(120) NOT NULL COMMENT 'mail de user',
  `realname` varchar(60) DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'Mot de passe haché, sera géré par PHP\nchangement de case, il doit être case sensitive (cs)\nVoir password_hash() et password_verify()\n255 carcatères pour avenir',
  `actif` tinyint DEFAULT '0' COMMENT 'basé sur 1 octet, donc 256 posibilités\n\n0 => inscrit non validé par mail\n1 => actif grâce au mail \n2 => bannie',
  `uniqid` char(59) NOT NULL COMMENT 'uniqid est créé avec la fonction uniquid(true) de PHP et on rajoute des bytes transformés en haxadécimal',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `realname`, `pwd`, `actif`, `uniqid`) VALUES
(1, 'admin', 'admin@cf2m.be', 'The Admin', '$2y$12$bTevGRNr5aGCDc2vOWnF6OCyg/XAJkuzmcct.8sZgA3ZjPriRkqo.', 1, 'id_6a2bd9d57b4638.35240519_ede72737780cde046ece7d27f3229367');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `category_has_article`
--
ALTER TABLE `category_has_article`
  ADD CONSTRAINT `fk_category_has_article_article1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category_has_article_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
