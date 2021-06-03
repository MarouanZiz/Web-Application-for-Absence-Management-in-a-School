-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 03 juin 2021 à 08:56
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbgestabs`
--

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `cnp` varchar(50) NOT NULL,
  `cin` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `dateNais` date DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sexe` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `tele` varchar(50) DEFAULT NULL,
  `idEtab` int(15) DEFAULT NULL,
  `idniveau` int(15) DEFAULT NULL,
  `idModule` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`cnp`, `cin`, `nom`, `prenom`, `dateNais`, `login`, `email`, `sexe`, `password`, `tele`, `idEtab`, `idniveau`, `idModule`) VALUES
('p22156', 'M25142', 'Tawfik', 'Hassan', '1980-06-09', 'hassan@bts', 'hassan@gmail.com', 'M', '123456', '063265021', NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`cnp`,`cin`),
  ADD KEY `k` (`idEtab`),
  ADD KEY `k2` (`idniveau`),
  ADD KEY `k3` (`idModule`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `k` FOREIGN KEY (`idEtab`) REFERENCES `etablissement` (`idEtab`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `k3` FOREIGN KEY (`idModule`) REFERENCES `module` (`idmodule`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `niv_fk` FOREIGN KEY (`idniveau`) REFERENCES `niveau` (`idNiveau`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
