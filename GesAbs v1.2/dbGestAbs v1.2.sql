-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 03 juin 2021 à 21:13
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
-- Structure de la table `absence`
--

CREATE TABLE `absence` (
  `idAbs` int(50) NOT NULL,
  `cneEtd` varchar(50) DEFAULT NULL,
  `idniv` varchar(15) DEFAULT NULL,
  `idseance` varchar(15) DEFAULT NULL,
  `dateAbs` date DEFAULT NULL,
  `etat` varchar(50) DEFAULT 'non justifiée'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(15) NOT NULL,
  `nom` varchar(15) DEFAULT NULL,
  `prenom` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sexe` varchar(15) DEFAULT NULL,
  `login` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `idEtab` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`idAdmin`, `nom`, `prenom`, `email`, `sexe`, `login`, `password`, `idEtab`) VALUES
(1, 'Chemrah', 'Yassin', 'yassin@gmail.com', 'M', 'yassin@bts', '123456', 1);

-- --------------------------------------------------------

--
-- Structure de la table `anneescolaire`
--

CREATE TABLE `anneescolaire` (
  `idAnnee` int(15) NOT NULL,
  `Annee` date DEFAULT NULL,
  `idFiliere` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `idEtab` int(15) NOT NULL,
  `nomEtab` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`idEtab`, `nomEtab`, `ville`) VALUES
(1, 'Ibn sina', 'kenitra');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `cne` varchar(50) NOT NULL,
  `cin` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `datenais` date DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sexe` varchar(15) DEFAULT NULL,
  `lieuNais` varchar(50) DEFAULT NULL,
  `idEtab` int(15) DEFAULT NULL,
  `idNiv` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`cne`, `cin`, `nom`, `prenom`, `datenais`, `login`, `password`, `email`, `sexe`, `lieuNais`, `idEtab`, `idNiv`) VALUES
('j136472289', 'd2659', 'Baaziz', 'Marouan', '1999-09-12', 'marwan@bts', '1234', 'marwan@gmail.com', 'M', 'Khemisset', 1, 2),
('K52665757', 'x45248', 'Darkaoui', 'Sanae', '2000-06-16', 'K52665757@kénitra', 'uRf!K#9y6tD93bA', NULL, 'F', 'Rabat', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `idFiliere` int(15) NOT NULL,
  `nomfiliere` varchar(15) DEFAULT NULL,
  `idetab` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`idFiliere`, `nomfiliere`, `idetab`) VALUES
(1, 'DSI', 1);

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `idmodule` int(15) NOT NULL,
  `nomModule` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `idNiveau` int(15) NOT NULL,
  `nomniv` varchar(15) DEFAULT NULL,
  `idFiliere` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`idNiveau`, `nomniv`, `idFiliere`) VALUES
(1, 'DS1', 1),
(2, 'DSI2', 1);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `idSeance` varchar(15) NOT NULL,
  `heureDeb` varchar(15) DEFAULT NULL,
  `heureFin` varchar(15) DEFAULT NULL,
  `idAnnee` int(15) DEFAULT NULL,
  `idModule` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`idAbs`),
  ADD KEY `s2` (`idniv`),
  ADD KEY `s3` (`idseance`);

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD KEY `fketab` (`idEtab`);

--
-- Index pour la table `anneescolaire`
--
ALTER TABLE `anneescolaire`
  ADD PRIMARY KEY (`idAnnee`),
  ADD KEY `fk3` (`idFiliere`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`cnp`,`cin`),
  ADD KEY `k` (`idEtab`),
  ADD KEY `k2` (`idniveau`),
  ADD KEY `k3` (`idModule`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`idEtab`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`cin`,`cne`),
  ADD KEY `fk21` (`idNiv`),
  ADD KEY `fk__etab` (`idEtab`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`idFiliere`),
  ADD KEY `fk2` (`idetab`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`idmodule`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`idNiveau`),
  ADD KEY `fkfi` (`idFiliere`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`idSeance`),
  ADD KEY `fk5` (`idAnnee`),
  ADD KEY `fk6` (`idModule`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `absence`
--
ALTER TABLE `absence`
  MODIFY `idAbs` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `anneescolaire`
--
ALTER TABLE `anneescolaire`
  MODIFY `idAnnee` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `idEtab` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `idFiliere` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `s3` FOREIGN KEY (`idseance`) REFERENCES `seance` (`idSeance`);

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fketab` FOREIGN KEY (`idEtab`) REFERENCES `etablissement` (`idEtab`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `k` FOREIGN KEY (`idEtab`) REFERENCES `etablissement` (`idEtab`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `k3` FOREIGN KEY (`idModule`) REFERENCES `module` (`idmodule`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `niv_fk` FOREIGN KEY (`idniveau`) REFERENCES `niveau` (`idNiveau`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fkNiv` FOREIGN KEY (`idNiv`) REFERENCES `niveau` (`idNiveau`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk__etab` FOREIGN KEY (`idEtab`) REFERENCES `etablissement` (`idEtab`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD CONSTRAINT `fk_etab` FOREIGN KEY (`idetab`) REFERENCES `etablissement` (`idEtab`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD CONSTRAINT `fkfi` FOREIGN KEY (`idFiliere`) REFERENCES `filiere` (`idFiliere`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `fk6` FOREIGN KEY (`idModule`) REFERENCES `module` (`idmodule`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
