-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 24 juin 2021 à 04:02
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
  `idniv` int(15) DEFAULT NULL,
  `idseance` int(15) DEFAULT NULL,
  `dateAbs` date DEFAULT NULL,
  `etat` varchar(50) DEFAULT 'non justifiee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `absence`
--

INSERT INTO `absence` (`idAbs`, `cneEtd`, `idniv`, `idseance`, `dateAbs`, `etat`) VALUES
(1, 'K256324559', 1, 1, '2021-06-01', 'non justifiee'),
(15, 'K256324559', 1, 14, '2021-06-23', 'non justifiee'),
(16, 'K256324559', 1, 15, '2021-06-15', 'non justifiee'),
(17, 'K256324559', 1, 16, '2021-06-09', 'non justifiee'),
(18, 'K52665757', 2, 17, '2021-06-14', 'non justifiee'),
(21, 'K256324559', 1, 20, '2021-06-08', 'justifiee'),
(22, 'K256324559', 1, 21, '2021-06-11', 'justifiee'),
(23, 'K52665757', 2, 22, '2021-06-20', 'non justifiee'),
(24, 'K256324559', 1, 23, '2021-06-20', 'justifiee'),
(25, 'K256324559', 1, 24, '2021-06-20', 'non justifiee'),
(26, 'K52665757', 2, 25, '2021-06-20', 'non justifiee'),
(27, 'K52665757', 2, 26, '2021-06-15', 'non justifiee'),
(28, 'K256324559', 1, 27, '2021-06-20', 'justifiee'),
(29, 'K52665757', 2, 28, '2021-06-21', 'non justifiee'),
(30, 'N506054125', 1, 29, '2021-06-22', 'non justifiee'),
(31, 'K256324559', 1, 30, '2021-06-22', 'non justifiee');

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
  `idEtab` int(15) DEFAULT NULL,
  `photo` varchar(100) DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`idAdmin`, `nom`, `prenom`, `email`, `sexe`, `login`, `password`, `idEtab`, `photo`) VALUES
(1, 'Chemrah', 'Yassin', 'yassin@gmail.com', 'M', 'yassin@bts', '123456', 1, 'default.jpg');

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
  `idEtab` int(15) DEFAULT NULL,
  `photo` varchar(100) DEFAULT 'prof.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`idEns`, `cnp`, `cin`, `nom`, `prenom`, `dateNais`, `login`, `password`, `email`, `sexe`, `tele`, `idEtab`, `photo`) VALUES
(19, 'C535355889', 'F35588', 'Maarouf', 'Kamal', '1987-03-24', 'C535355889-kenitra', 'P2DJ%?Ci^h5!M46', 'kamal@gmail.com', 'H', '06325987452', 1, 'prof.png'),
(8, 'D343656654', 'A35688', 'Darkaoui', 'Fouad', '1989-06-07', 'D343656654-kenitra', '&q^$ojxoaZL1Gut', 'fouad@gmail.com', 'H', '062348621', 1, 'prof.png'),
(6, 'J1452965545', 'L26585', 'Daoudi', 'Hamid', '2021-06-26', 'J1452965545-kenitra', 'BDb1T#X&hh8X0TC', 'hamid_daoudi@gmail.com', 'H', '062548763', 1, 'prof.png'),
(7, 'M52425755', 'P58656', 'Rafiq', 'Achraf', '1990-06-13', 'M52425755-kenitra', '^T^KJ5%J0C27pze', 'rafiq@gmail.com', 'H', '0632569874', 1, 'prof.png'),
(1, 'p22156', 'M25142', 'Tawfik', 'Hassan', '1980-06-09', 'hassan@bts', '123456', 'hassan@gmail.com', 'M', '063265021', 1, 'prof.png'),
(13, 'T6565454', 'D23259', 'Manta', 'Fatima', '1991-07-20', 'T6565454-kenitra', 'Dt!A2pglU2?&kDd', 'fatima@gmail.com', 'F', '0632985647', 1, 'prof.png');

-- --------------------------------------------------------

--
-- Structure de la table `enseigner`
--

CREATE TABLE `enseigner` (
  `idNiv` int(15) NOT NULL,
  `idEns` int(15) NOT NULL,
  `idModule` int(15) DEFAULT NULL,
  `annee` year(4) DEFAULT 2021
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enseigner`
--

INSERT INTO `enseigner` (`idNiv`, `idEns`, `idModule`, `annee`) VALUES
(1, 1, 1, 2021),
(1, 8, 3, 2021),
(1, 13, 4, 2021),
(2, 1, 1, 2021),
(3, 7, 4, 2021),
(3, 19, 2, 2021),
(4, 6, 2, 2021),
(4, 19, 2, 2021),
(5, 13, 4, 2021),
(5, 19, 2, 2021),
(6, 13, 4, 2021),
(6, 19, 2, 2021),
(7, 13, 4, 2021),
(7, 19, 2, 2021);

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
  `idNiv` int(15) DEFAULT NULL,
  `photo` varchar(100) DEFAULT 'etd.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`cne`, `cin`, `nom`, `prenom`, `datenais`, `login`, `password`, `email`, `sexe`, `lieuNais`, `idEtab`, `idNiv`, `photo`) VALUES
('P53542455', 'L65853', 'Daoudi', 'Farouk', '1999-07-23', 'P53542455@kenitra', 'Xr#N#Nt7?9kh%#l', NULL, 'H', 'Casa', 1, 5, 'etd.png'),
('K256324559', 'M12564', 'Hakimi', 'Youssef', '2002-07-04', 'K256324559@kenitra', '3V0Wp#pCa?i6%4A', NULL, 'H', 'Tanger', 1, 1, 'etd.png'),
('L35655636', 'O33565', 'Dandoun', 'Laila', '2001-07-23', 'L35655636@kenitra', 'fx9nAC&dapYA%Uc', NULL, 'F', 'Maknes', 1, 4, 'etd.png'),
('N506054125', 'S35552', 'Kassimi', 'Rachid', '2002-06-25', 'N506054125@kenitra', 'F&?TN0$foa0WSrp', NULL, 'H', 'Rabat', 1, 1, 'etd.png'),
('K52665757', 'x45248', 'Darkaoui', 'Sanae', '2000-06-17', 'K52665757@kénitra', 'uRf!K#9y6tD93bA', NULL, 'F', 'Rabat', 1, 2, 'etd.png');

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
(1, 'DSI', 1),
(2, 'PME', 1),
(3, 'CPI', 1),
(4, 'MI', 1);

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
(1, 'DSI1', 1),
(2, 'DSI2', 1),
(3, 'PME1', 2),
(4, 'PME2', 2),
(5, 'CPI1', 3),
(6, 'CPI2', 3),
(7, 'MI1', 4),
(8, 'MI2', 4);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `idSeance` int(15) NOT NULL,
  `heureDeb` time DEFAULT NULL,
  `heureFin` time DEFAULT NULL,
  `idModule` int(15) DEFAULT NULL,
  `idAnnee` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`idSeance`, `heureDeb`, `heureFin`, `idModule`, `idAnnee`) VALUES
(1, '08:00:00', '10:00:00', 1, 1),
(14, '15:08:00', '17:07:00', 1, 1),
(15, '14:08:00', '15:08:00', 1, 1),
(16, '14:28:00', '15:28:00', 1, 1),
(17, '16:00:00', '18:00:00', 1, 1),
(18, '16:36:00', '16:36:00', 1, 1),
(20, '15:37:00', '18:37:00', 1, 1),
(21, '15:00:00', '18:00:00', 1, 1),
(22, '16:00:00', '17:00:00', 1, 1),
(23, '18:05:00', '19:05:00', 1, 1),
(24, '16:08:00', '17:10:00', 1, 1),
(25, '16:09:00', '16:14:00', 1, 1),
(26, '08:00:00', '00:00:00', 1, 1),
(27, '21:32:00', '19:32:00', 1, 1),
(28, '14:54:00', '14:54:00', 1, 1),
(29, '14:00:00', '15:00:00', 1, 1),
(30, '23:00:00', '00:00:00', 1, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`idAbs`),
  ADD UNIQUE KEY `idAbs` (`idAbs`),
  ADD UNIQUE KEY `indexse` (`idseance`),
  ADD KEY `s2` (`idniv`);

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
  ADD KEY `fk_mod` (`idModule`),
  ADD KEY `jkkj` (`idEns`);

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
  ADD KEY `fkan` (`idAnnee`),
  ADD KEY `fkmodule` (`idModule`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `absence`
--
ALTER TABLE `absence`
  MODIFY `idAbs` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `idEns` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `idEtab` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `idFiliere` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `idSeance` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `fSea` FOREIGN KEY (`idseance`) REFERENCES `seance` (`idSeance`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `niv_fkk` FOREIGN KEY (`idniv`) REFERENCES `niveau` (`idNiveau`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fketab` FOREIGN KEY (`idEtab`) REFERENCES `etablissement` (`idEtab`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `anneescolaire`
--
ALTER TABLE `anneescolaire`
  ADD CONSTRAINT `fkfil` FOREIGN KEY (`idFiliere`) REFERENCES `filiere` (`idFiliere`) ON DELETE SET NULL ON UPDATE SET NULL;

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
  ADD CONSTRAINT `jkkj` FOREIGN KEY (`idEns`) REFERENCES `enseignant` (`idEns`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fkan` FOREIGN KEY (`idAnnee`) REFERENCES `anneescolaire` (`idAnnee`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fkmodule` FOREIGN KEY (`idModule`) REFERENCES `module` (`idmodule`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
