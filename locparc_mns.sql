-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 26 juin 2023 à 12:10
-- Version du serveur : 5.6.20-log
-- Version de PHP : 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `locparc_mns`
--

-- --------------------------------------------------------

--
-- Structure de la table `cause`
--

CREATE TABLE `cause` (
                         `id` int(11) NOT NULL,
                         `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cause`
--

INSERT INTO `cause` (`id`, `nom`) VALUES
                                      (1, 'VOL'),
                                      (2, 'PERTE'),
                                      (3, 'DEGAT'),
                                      (4, 'PANNE'),
                                      (5, 'INCONNU');

-- --------------------------------------------------------

--
-- Structure de la table `declaration`
--

CREATE TABLE `declaration` (
                               `cause_id` int(11) NOT NULL,
                               `etat_id` int(11) NOT NULL,
                               `materiel_id` int(11) NOT NULL,
                               `pret_id` int(11) NOT NULL,
                               `date_declaration` date DEFAULT NULL,
                               `date_retour_anticipe` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `declaration`
--

INSERT INTO `declaration` (`cause_id`, `etat_id`, `materiel_id`, `pret_id`, `date_declaration`, `date_retour_anticipe`) VALUES
                                                                                                                            (2, 3, 5, 2, '2023-06-26', '2023-06-26'),
                                                                                                                            (3, 2, 1, 2, '2023-06-26', '2023-06-26'),
                                                                                                                            (4, 1, 3, 1, '2023-06-26', '2023-06-26');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
                        `id` int(11) NOT NULL,
                        `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `nom`) VALUES
                                     (1, 'TRES BON'),
                                     (2, 'BON'),
                                     (3, 'CORRECT'),
                                     (4, 'MAUVAIS'),
                                     (5, 'HORS SERVICE'),
                                     (6, 'EN REPARATION');

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE `materiel` (
                            `id` int(11) NOT NULL,
                            `date_debut_emprunt` datetime DEFAULT NULL,
                            `date_fin_emprunt` datetime DEFAULT NULL,
                            `marque` varchar(50) NOT NULL,
                            `modele` varchar(50) NOT NULL,
                            `nom_image_materiel` varchar(255) DEFAULT NULL,
                            `reference` varchar(50) NOT NULL,
                            `etat_id` int(11) DEFAULT NULL,
                            `pret_id` int(11) DEFAULT NULL,
                            `statut_id` int(11) DEFAULT NULL,
                            `type_id` int(11) DEFAULT NULL,
                            `utilisateur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`id`, `date_debut_emprunt`, `date_fin_emprunt`, `marque`, `modele`, `nom_image_materiel`, `reference`, `etat_id`, `pret_id`, `statut_id`, `type_id`, `utilisateur_id`) VALUES
                                                                                                                                                                                                   (1, NULL, NULL, 'ACER', 'ACER', 'webcamexample.jpg', 'ACER x900', 1, NULL, 1, 1, NULL),
                                                                                                                                                                                                   (2, NULL, NULL, 'ACER', 'ACER', 'ordiportlenovoexample.jpg', 'ACER x1900', 6, NULL, 2, 3, NULL),
                                                                                                                                                                                                   (3, NULL, NULL, 'Corsaire', 'Corsaire', 'casquevrexemple.jpg', 'Corsaire Y900', 2, NULL, 1, 2, NULL),
                                                                                                                                                                                                   (4, NULL, NULL, 'Projector', 'Projector', NULL, 'Projo 9000', 3, NULL, 1, 4, NULL),
                                                                                                                                                                                                   (5, NULL, NULL, 'Projector', 'Projector', NULL, 'ProX 9500', 4, NULL, 2, 4, NULL),
                                                                                                                                                                                                   (6, NULL, NULL, 'lenovo', 'ACER', 'ordiportlenovoexample.jpg', 'ACER x1900', 1, NULL, 1, 3, NULL),
                                                                                                                                                                                                   (7, NULL, NULL, 'lenovo', 'ACER', 'ordiportlenovoexample.jpg', 'ACER x1900', 1, NULL, 1, 3, NULL),
                                                                                                                                                                                                   (8, NULL, NULL, 'lenovo', 'ACER', 'ordiportlenovoexample.jpg', 'ACER x1900', 1, NULL, 1, 3, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `pret`
--

CREATE TABLE `pret` (
                        `id` int(11) NOT NULL,
                        `commentaire` varchar(255) DEFAULT NULL,
                        `date_debut` datetime DEFAULT NULL,
                        `date_fin` datetime DEFAULT NULL,
                        `motif` varchar(255) DEFAULT NULL,
                        `reference_pret` varchar(255) DEFAULT NULL,
                        `materiel_id` int(11) DEFAULT NULL,
                        `statut_id` int(11) DEFAULT NULL,
                        `utilisateur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pret`
--

INSERT INTO `pret` (`id`, `commentaire`, `date_debut`, `date_fin`, `motif`, `reference_pret`, `materiel_id`, `statut_id`, `utilisateur_id`) VALUES
                                                                                                                                                (1, 'Materiel en bon etat', '2023-06-26 07:50:10', '2023-07-06 07:50:10', 'Besoin personel', NULL, 3, NULL, 1),
                                                                                                                                                (2, 'Materiel correct', '2023-06-26 07:50:10', '2023-07-11 07:50:10', 'Besoin personel', NULL, 4, NULL, 2),
                                                                                                                                                (3, 'Materiel en mauvais etat', '2023-06-26 07:50:10', '2023-07-04 07:50:10', 'Besoin personel', NULL, 5, NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
                        `id` int(11) NOT NULL,
                        `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `nom`) VALUES
                                     (1, 'ROLE_ADMINISTRATEUR'),
                                     (2, 'ROLE_GESTIONNAIRE'),
                                     (3, 'ROLE_UTILISATEUR');

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
                          `id` int(11) NOT NULL,
                          `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`id`, `nom`) VALUES
                                       (1, 'disponible'),
                                       (2, 'indisponible');

-- --------------------------------------------------------

--
-- Structure de la table `suivi_pret`
--

CREATE TABLE `suivi_pret` (
                              `id` int(11) NOT NULL,
                              `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
                        `id` int(11) NOT NULL,
                        `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `nom`) VALUES
                                     (1, 'WEBCAM'),
                                     (2, 'CASQUE_VR'),
                                     (3, 'ORDINATEUR_PORTABLE'),
                                     (4, 'VIDEOPROJECTEUR');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
                               `id` int(11) NOT NULL,
                               `date_creation` date DEFAULT NULL,
                               `date_miseajour` datetime DEFAULT NULL,
                               `email` varchar(50) NOT NULL,
                               `mot_de_passe` varchar(255) DEFAULT NULL,
                               `nom` varchar(50) NOT NULL,
                               `nom_image_profil` varchar(255) DEFAULT NULL,
                               `prenom` varchar(50) NOT NULL,
                               `telephone` varchar(20) NOT NULL,
                               `pret_id` int(11) DEFAULT NULL,
                               `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `date_creation`, `date_miseajour`, `email`, `mot_de_passe`, `nom`, `nom_image_profil`, `prenom`, `telephone`, `pret_id`, `role_id`) VALUES
                                                                                                                                                                         (1, '2023-06-26', '2023-06-26 07:50:10', 'ab@c.com', '$2a$10$wXW2wHA2bu1TdQ26p.2UoehWv8m92w88kabSeL.348VqkpWvSt51q', 'PATATE', 'utilisateur.jpg', 'Chips', '0698765432', NULL, 1),
                                                                                                                                                                         (2, '2023-06-26', '2023-06-26 07:50:10', 'ab@y.com', '$2a$10$wXW2wHA2bu1TdQ26p.2UoehWv8m92w88kabSeL.348VqkpWvSt51q', 'JOYEUX', 'utilisateur.jpg', 'Kevin', '0698765430', NULL, 2),
                                                                                                                                                                         (3, '2023-06-26', '2023-06-26 07:50:10', 'ab@z.com', '$2a$10$wXW2wHA2bu1TdQ26p.2UoehWv8m92w88kabSeL.348VqkpWvSt51q', 'ADAM', 'utilisateur.jpg', 'Damien', '0698765439', NULL, 1),
                                                                                                                                                                         (4, '2023-06-26', '2023-06-26 07:50:10', 'ab@x.com', '$2a$10$wXW2wHA2bu1TdQ26p.2UoehWv8m92w88kabSeL.348VqkpWvSt51q', 'TRICHOT', NULL, 'Robin', '0698765438', NULL, 2),
                                                                                                                                                                         (5, '2023-06-26', '2023-06-26 07:50:10', 'ab@w.com', '$2a$10$wXW2wHA2bu1TdQ26p.2UoehWv8m92w88kabSeL.348VqkpWvSt51q', 'CASTELLI', NULL, 'Luigi', '0698765437', NULL, 2),
                                                                                                                                                                         (6, '2023-06-26', '2023-06-26 07:50:10', 'ab@a.com', '$2a$10$wXW2wHA2bu1TdQ26p.2UoehWv8m92w88kabSeL.348VqkpWvSt51q', 'John', NULL, 'DOE', '065412345', NULL, 1),
                                                                                                                                                                         (7, '2023-06-26', '2023-06-26 07:50:10', 'zz@z.com', '$2a$10$wXW2wHA2bu1TdQ26p.2UoehWv8m92w88kabSeL.348VqkpWvSt51q', 'Jack', NULL, 'Sparrow', '065412345', NULL, 3),
                                                                                                                                                                         (8, '2023-06-26', '2023-06-26 07:53:15', 'test@a.com', '$2a$10$8jiu.jWfbwopjeO73npoaONs0.dQ/vuPfiLZWYEIL21ToRxW4hs.O', 'Jordan', NULL, 'michael', '0621458547', NULL, 3),
                                                                                                                                                                         (9, '2023-06-26', '2023-06-26 07:54:13', 'nuize@gmail.com', '$2a$10$jKx73/3AY0bW0JsLWj4HVOoUO0CHDUZ.gNk0kB/xWe7WLFhivjgWy', 'jordanv2', NULL, 'michaelv2', '452125698745', NULL, 3),
                                                                                                                                                                         (10, '2023-06-26', '2023-06-26 07:54:28', 'jjdd@com', '$2a$10$Uunzl3D85O4Fs.ylR9tfXO6fFsvB1.2poxpZBlEee.FDEPD3IdC7K', 'fhfhfhfhf', NULL, 'michaelv3', '05214236589', NULL, 3),
                                                                                                                                                                         (11, '2023-06-26', '2023-06-26 07:54:44', 'tedt2@com', '$2a$10$2KMTCOwUpu.wx33Ja8A8mekVoEQXAOfQB2a6wPfowYnD4eRb3JLwa', 'bvhuvdh', NULL, 'vbhvjhdfh', '5824589', NULL, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cause`
--
ALTER TABLE `cause`
    ADD PRIMARY KEY (`id`);

--
-- Index pour la table `declaration`
--
ALTER TABLE `declaration`
    ADD PRIMARY KEY (`cause_id`,`etat_id`,`materiel_id`,`pret_id`),
  ADD KEY `FK1y1s7faftp5fkcugqtiyaiq4b` (`etat_id`),
  ADD KEY `FK5e8rsmg4gr842ddlt81j2j19i` (`materiel_id`),
  ADD KEY `FKmqa12n0yxoq8sjoojtvpa5pki` (`pret_id`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
    ADD PRIMARY KEY (`id`);

--
-- Index pour la table `materiel`
--
ALTER TABLE `materiel`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKhpjtf783bawjupveeb1gtwt1k` (`etat_id`),
  ADD KEY `FK87q7phdp8qeuv085ntjbhjx8x` (`pret_id`),
  ADD KEY `FKdw20jjqpmw41funpnono3vwfb` (`statut_id`),
  ADD KEY `FKnqm0ujpetfyejxk3yu34myejb` (`type_id`),
  ADD KEY `FKsuqq7lg33xylwwqfwrbukhi88` (`utilisateur_id`);

--
-- Index pour la table `pret`
--
ALTER TABLE `pret`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKnhkexbwubbjia1t61ao3y189n` (`materiel_id`),
  ADD KEY `FKrbbbegkxh6c9wnybu9phurbs3` (`statut_id`),
  ADD KEY `FKcpi972agyjsxlxf6hie4sstuu` (`utilisateur_id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
    ADD PRIMARY KEY (`id`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
    ADD PRIMARY KEY (`id`);

--
-- Index pour la table `suivi_pret`
--
ALTER TABLE `suivi_pret`
    ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
    ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKe95u89kxcmh01s6b4lfy4lj7a` (`pret_id`),
  ADD KEY `FKaqe8xtajee4k0wlqrvh2pso4l` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cause`
--
ALTER TABLE `cause`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `etat`
--
ALTER TABLE `etat`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `materiel`
--
ALTER TABLE `materiel`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `pret`
--
ALTER TABLE `pret`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `statut`
--
ALTER TABLE `statut`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `suivi_pret`
--
ALTER TABLE `suivi_pret`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `declaration`
--
ALTER TABLE `declaration`
    ADD CONSTRAINT `FK1y1s7faftp5fkcugqtiyaiq4b` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `FK5e8rsmg4gr842ddlt81j2j19i` FOREIGN KEY (`materiel_id`) REFERENCES `materiel` (`id`),
  ADD CONSTRAINT `FKm4c6ruhfylac0w2p49r3rgijv` FOREIGN KEY (`cause_id`) REFERENCES `cause` (`id`),
  ADD CONSTRAINT `FKmqa12n0yxoq8sjoojtvpa5pki` FOREIGN KEY (`pret_id`) REFERENCES `pret` (`id`);

--
-- Contraintes pour la table `materiel`
--
ALTER TABLE `materiel`
    ADD CONSTRAINT `FK87q7phdp8qeuv085ntjbhjx8x` FOREIGN KEY (`pret_id`) REFERENCES `pret` (`id`),
  ADD CONSTRAINT `FKdw20jjqpmw41funpnono3vwfb` FOREIGN KEY (`statut_id`) REFERENCES `statut` (`id`),
  ADD CONSTRAINT `FKhpjtf783bawjupveeb1gtwt1k` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `FKnqm0ujpetfyejxk3yu34myejb` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `FKsuqq7lg33xylwwqfwrbukhi88` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `pret`
--
ALTER TABLE `pret`
    ADD CONSTRAINT `FKcpi972agyjsxlxf6hie4sstuu` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FKnhkexbwubbjia1t61ao3y189n` FOREIGN KEY (`materiel_id`) REFERENCES `materiel` (`id`),
  ADD CONSTRAINT `FKrbbbegkxh6c9wnybu9phurbs3` FOREIGN KEY (`statut_id`) REFERENCES `statut` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
    ADD CONSTRAINT `FKaqe8xtajee4k0wlqrvh2pso4l` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FKe95u89kxcmh01s6b4lfy4lj7a` FOREIGN KEY (`pret_id`) REFERENCES `pret` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
