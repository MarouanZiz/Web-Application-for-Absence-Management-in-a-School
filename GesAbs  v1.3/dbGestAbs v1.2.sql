-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 12 juin 2021 à 14:07
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
  `cneEtd` varchar(50) NOT NULL,
  `idniv` int(15) DEFAULT NULL,
  `idseance` int(15) DEFAULT NULL,
  `dateAbs` date DEFAULT NULL,
  `etat` varchar(50) DEFAULT 'non justifiée'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `absence`
--

INSERT INTO `absence` (`idAbs`, `cneEtd`, `idniv`, `idseance`, `dateAbs`, `etat`) VALUES
(1, 'K256324559', 1, 1, '2021-06-01', 'non justifiée');

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
  `Annee` year(4) DEFAULT NULL,
  `idFiliere` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `anneescolaire`
--

INSERT INTO `anneescolaire` (`idAnnee`, `Annee`, `idFiliere`) VALUES
(1, 2021, 1);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `idEns` int(15) NOT NULL,
  `cnp` varchar(50) NOT NULL,
  `cin` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `dateNais` date DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sexe` varchar(50) DEFAULT NULL,
  `tele` varchar(50) DEFAULT NULL,
  `idEtab` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`idEns`, `cnp`, `cin`, `nom`, `prenom`, `dateNais`, `login`, `password`, `email`, `sexe`, `tele`, `idEtab`) VALUES
(6, 'J1452965545', 'L26585', 'Daoudi', 'Hamid', '2021-06-26', 'J1452965545-kenitra', 'BDb1T#X&hh8X0TC', 'hamid_daoudi@gmail.com', 'H', '062548763', 1),
(1, 'p22156', 'M25142', 'Tawfik', 'Hassan', '1980-06-09', 'hassan@bts', '123456', 'hassan@gmail.com', 'M', '063265021', 1);

-- --------------------------------------------------------

--
-- Structure de la table `enseigner`
--

CREATE TABLE `enseigner` (
  `idNiv` int(15) NOT NULL,
  `idEns` int(15) NOT NULL,
  `idModule` int(15) DEFAULT NULL,
  `annee` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enseigner`
--

INSERT INTO `enseigner` (`idNiv`, `idEns`, `idModule`, `annee`) VALUES
(1, 1, 1, 2021),
(2, 1, 1, 2021);

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
('K256324559', 'M12564', 'Hakimi', 'Youssef', '2002-07-01', 'K256324559@kenitra', '3V0Wp#pCa?i6%4A', NULL, 'H', 'Tanger', 1, 1),
('K52665757', 'x45248', 'Darkaoui', 'Sanae', '2000-06-16', 'K52665757@kénitra', 'uRf!K#9y6tD93bA', NULL, 'F', 'Rabat', 1, 2);

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

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`idmodule`, `nomModule`) VALUES
(1, 'Math'),
(2, 'economie'),
(3, 'Anglais'),
(4, 'Arabe');

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
  `idSeance` int(15) NOT NULL,
  `heureDeb` time DEFAULT NULL,
  `heureFin` time DEFAULT NULL,
  `idAnnee` int(15) DEFAULT NULL,
  `idModule` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`idSeance`, `heureDeb`, `heureFin`, `idAnnee`, `idModule`) VALUES
(1, '08:00:00', '10:00:00', 1, 1);

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
  ADD PRIMARY KEY (`cnp`,`idEns`) USING BTREE,
  ADD UNIQUE KEY `indEns` (`idEns`),
  ADD KEY `k` (`idEtab`);

--
-- Index pour la table `enseigner`
--
ALTER TABLE `enseigner`
  ADD PRIMARY KEY (`idNiv`,`idEns`),
  ADD KEY `jkkj` (`idEns`),
  ADD KEY `fk_mod` (`idModule`);

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
  MODIFY `idAbs` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `anneescolaire`
--
ALTER TABLE `anneescolaire`
  MODIFY `idAnnee` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `idEns` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `fksean` FOREIGN KEY (`idseance`) REFERENCES `seance` (`idSeance`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `niv_fkk` FOREIGN KEY (`idniv`) REFERENCES `niveau` (`idNiveau`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fketab` FOREIGN KEY (`idEtab`) REFERENCES `etablissement` (`idEtab`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `k` FOREIGN KEY (`idEtab`) REFERENCES `etablissement` (`idEtab`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `enseigner`
--
ALTER TABLE `enseigner`
  ADD CONSTRAINT `fk_mod` FOREIGN KEY (`idModule`) REFERENCES `module` (`idmodule`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fknivv` FOREIGN KEY (`idNiv`) REFERENCES `niveau` (`idNiveau`),
  ADD CONSTRAINT `jkkj` FOREIGN KEY (`idEns`) REFERENCES `enseignant` (`idEns`);

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
