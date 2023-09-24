-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 30 août 2023 à 15:04
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbressource2`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add bon livraison', 6, 'add_bonlivraison'),
(22, 'Can change bon livraison', 6, 'change_bonlivraison'),
(23, 'Can delete bon livraison', 6, 'delete_bonlivraison'),
(24, 'Can view bon livraison', 6, 'view_bonlivraison'),
(25, 'Can add demande model', 7, 'add_demandemodel'),
(26, 'Can change demande model', 7, 'change_demandemodel'),
(27, 'Can delete demande model', 7, 'delete_demandemodel'),
(28, 'Can view demande model', 7, 'view_demandemodel'),
(29, 'Can add departement', 8, 'add_departement'),
(30, 'Can change departement', 8, 'change_departement'),
(31, 'Can delete departement', 8, 'delete_departement'),
(32, 'Can view departement', 8, 'view_departement'),
(33, 'Can add filial', 9, 'add_filial'),
(34, 'Can change filial', 9, 'change_filial'),
(35, 'Can delete filial', 9, 'delete_filial'),
(36, 'Can view filial', 9, 'view_filial'),
(37, 'Can add items list', 10, 'add_itemslist'),
(38, 'Can change items list', 10, 'change_itemslist'),
(39, 'Can delete items list', 10, 'delete_itemslist'),
(40, 'Can view items list', 10, 'view_itemslist'),
(41, 'Can add items', 11, 'add_items'),
(42, 'Can change items', 11, 'change_items'),
(43, 'Can delete items', 11, 'delete_items'),
(44, 'Can view items', 11, 'view_items'),
(45, 'Can add item livrai', 12, 'add_itemlivrai'),
(46, 'Can change item livrai', 12, 'change_itemlivrai'),
(47, 'Can delete item livrai', 12, 'delete_itemlivrai'),
(48, 'Can view item livrai', 12, 'view_itemlivrai'),
(49, 'Can add user', 13, 'add_user'),
(50, 'Can change user', 13, 'change_user'),
(51, 'Can delete user', 13, 'delete_user'),
(52, 'Can view user', 13, 'view_user'),
(53, 'Can add chauffeur', 14, 'add_chauffeur'),
(54, 'Can change chauffeur', 14, 'change_chauffeur'),
(55, 'Can delete chauffeur', 14, 'delete_chauffeur'),
(56, 'Can view chauffeur', 14, 'view_chauffeur'),
(57, 'Can add manager', 15, 'add_manager'),
(58, 'Can change manager', 15, 'change_manager'),
(59, 'Can delete manager', 15, 'delete_manager'),
(60, 'Can view manager', 15, 'view_manager'),
(61, 'Can add employee', 16, 'add_employee'),
(62, 'Can change employee', 16, 'change_employee'),
(63, 'Can delete employee', 16, 'delete_employee'),
(64, 'Can view employee', 16, 'view_employee'),
(65, 'Can add demande chauffeur', 17, 'add_demandechauffeur'),
(66, 'Can change demande chauffeur', 17, 'change_demandechauffeur'),
(67, 'Can delete demande chauffeur', 17, 'delete_demandechauffeur'),
(68, 'Can view demande chauffeur', 17, 'view_demandechauffeur'),
(69, 'Can add reserver', 18, 'add_reserver'),
(70, 'Can change reserver', 18, 'change_reserver'),
(71, 'Can delete reserver', 18, 'delete_reserver'),
(72, 'Can view reserver', 18, 'view_reserver');

-- --------------------------------------------------------

--
-- Structure de la table `demandechauffeur_demandechauffeur`
--

CREATE TABLE `demandechauffeur_demandechauffeur` (
  `demande_id` int(11) NOT NULL,
  `reserve` tinyint(1) NOT NULL,
  `created_on` date NOT NULL,
  `date_deplacement` datetime(6) NOT NULL,
  `admin_approuver` tinyint(1) NOT NULL,
  `lieu_deplacement` varchar(500) NOT NULL,
  `coordonees` varchar(200) NOT NULL,
  `mission` varchar(200) NOT NULL,
  `duree` int(11) NOT NULL,
  `last_modified` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `chauffeur_id` bigint(20) DEFAULT NULL,
  `demandeur_id` bigint(20) DEFAULT NULL,
  `duree_type` varchar(8) NOT NULL,
  `date_retour` datetime(6) NOT NULL,
  `manager_valider` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demandechauffeur_demandechauffeur`
--

INSERT INTO `demandechauffeur_demandechauffeur` (`demande_id`, `reserve`, `created_on`, `date_deplacement`, `admin_approuver`, `lieu_deplacement`, `coordonees`, `mission`, `duree`, `last_modified`, `status`, `chauffeur_id`, `demandeur_id`, `duree_type`, `date_retour`, `manager_valider`) VALUES
(94, 0, '2023-08-29', '2023-08-29 18:20:00.000000', 1, 'n,sdqjn', 'qndqj', 'qnd', 1, '2023-08-29', 'Demande annuler', 4, 1, 'Minutes', '2023-08-29 18:21:00.000000', 1),
(95, 0, '2023-08-29', '2023-08-29 18:21:00.000000', 1, 'kjdqq', 'qrkqdnq', 'jdq', 1, '2023-08-29', 'Demande annuler', 4, 1, 'Minutes', '2023-08-29 18:22:00.000000', 1),
(96, 0, '2023-08-30', '2023-08-01 08:53:00.000000', 1, 'slkdkqksd', 'ldlqkdk', 'lq,l', 1, '2023-08-30', 'Choisissez nouvelle dates', 4, 1, 'Minutes', '2023-08-01 08:54:00.000000', 1),
(97, 0, '2023-08-30', '2023-08-01 09:04:00.000000', 1, 'snjjqnd', 'ndqnnj', '1', 1, '2023-08-30', 'Confirmer par admin', 4, 1, 'Minutes', '2023-08-01 09:05:00.000000', 1),
(98, 0, '2023-08-30', '2023-08-30 09:07:00.000000', 1, 'lkdkqkd', 'lqdlkdjk', '1', 1, '2023-08-30', 'Confirmer par admin', 4, 1, 'Minutes', '2023-08-30 09:08:00.000000', 1),
(99, 0, '2023-08-30', '2023-08-30 09:10:00.000000', 1, ',;dqkd,', 'qdq,dkq', 'q,kdkqkk', 1, '2023-08-30', 'Confirmer par admin', 4, 3, 'Minutes', '2023-08-30 09:11:00.000000', 1),
(100, 0, '2023-08-30', '2023-08-30 09:12:00.000000', 1, 'fmlqlmd', ';l;dql;dl', 'ldql,', 1, '2023-08-30', 'Confirmer par admin', 4, 1, 'Minutes', '2023-08-30 09:13:00.000000', 1),
(101, 0, '2023-08-30', '2023-08-30 09:14:00.000000', 1, ',sd,kqk', ',dqk,d', 'qd,kk,q', 1, '2023-08-30', 'Demande annuler', 4, 2, 'Minutes', '2023-08-30 09:15:00.000000', 1),
(102, 0, '2023-08-30', '2023-08-30 13:56:00.000000', 1, '1', '1', '1', 1, '2023-08-30', 'Confirmer par admin', 4, 2, 'Minutes', '2023-08-30 13:57:00.000000', 1),
(103, 0, '2023-08-30', '2023-08-30 13:59:00.000000', 1, 'nasnj', ',bS', 'BNSB', 1, '2023-08-30', 'Confirmer par admin', 4, 2, 'Minutes', '2023-08-30 14:00:00.000000', 1);

-- --------------------------------------------------------

--
-- Structure de la table `demandechauffeur_reserver`
--

CREATE TABLE `demandechauffeur_reserver` (
  `id` bigint(20) NOT NULL,
  `date_reserver` datetime(6) NOT NULL,
  `chauffeur_id` bigint(20) DEFAULT NULL,
  `demande_id` int(11) DEFAULT NULL,
  `date_retour` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demandechauffeur_reserver`
--

INSERT INTO `demandechauffeur_reserver` (`id`, `date_reserver`, `chauffeur_id`, `demande_id`, `date_retour`) VALUES
(38, '2023-08-01 08:53:00.000000', 4, 96, '2023-08-01 08:54:00.000000'),
(39, '2023-08-01 09:04:00.000000', 4, 97, '2023-08-01 09:05:00.000000'),
(40, '2023-08-30 09:07:00.000000', 4, 98, '2023-08-30 09:08:00.000000'),
(41, '2023-08-30 09:12:00.000000', 4, 100, '2023-08-30 09:13:00.000000'),
(42, '2023-08-30 09:10:00.000000', 4, 99, '2023-08-30 09:11:00.000000'),
(43, '2023-08-30 13:56:00.000000', 4, 102, '2023-08-30 13:57:00.000000'),
(44, '2023-08-30 13:59:00.000000', 4, 103, '2023-08-30 14:00:00.000000');

-- --------------------------------------------------------

--
-- Structure de la table `demandemateriel_bonlivraison`
--

CREATE TABLE `demandemateriel_bonlivraison` (
  `bl_id` int(11) NOT NULL,
  `commentaire` varchar(500) DEFAULT NULL,
  `demande_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demandemateriel_bonlivraison`
--

INSERT INTO `demandemateriel_bonlivraison` (`bl_id`, `commentaire`, `demande_id`) VALUES
(1, 'RAS', 1),
(2, '', 4),
(3, '', 7),
(4, '', 6);

-- --------------------------------------------------------

--
-- Structure de la table `demandemateriel_demandemodel`
--

CREATE TABLE `demandemateriel_demandemodel` (
  `demande_id` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `manager_valider` tinyint(1) NOT NULL,
  `admin_valider` tinyint(1) NOT NULL,
  `terminer` tinyint(1) NOT NULL,
  `commentaire` varchar(500) DEFAULT NULL,
  `last_modified` date NOT NULL,
  `demandeur_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demandemateriel_demandemodel`
--

INSERT INTO `demandemateriel_demandemodel` (`demande_id`, `created_on`, `status`, `manager_valider`, `admin_valider`, `terminer`, `commentaire`, `last_modified`, `demandeur_id`) VALUES
(1, '2023-08-24', 'Cloturer', 1, 1, 1, 'RAS', '2023-08-24', 2),
(2, '2023-08-24', 'Nouvelle Demande', 0, 0, 0, NULL, '2023-08-24', 2),
(3, '2023-08-24', 'Nouvelle Demande', 0, 0, 0, NULL, '2023-08-24', 2),
(4, '2023-08-26', 'Cloturer', 1, 1, 1, NULL, '2023-08-26', 2),
(5, '2023-08-26', 'Nouvelle Demande', 0, 0, 0, NULL, '2023-08-26', 3),
(6, '2023-08-26', 'Cloturer', 1, 1, 1, NULL, '2023-08-26', 6),
(7, '2023-08-26', 'Cloturer', 1, 1, 1, NULL, '2023-08-26', 7);

-- --------------------------------------------------------

--
-- Structure de la table `demandemateriel_departement`
--

CREATE TABLE `demandemateriel_departement` (
  `departement_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demandemateriel_departement`
--

INSERT INTO `demandemateriel_departement` (`departement_id`, `name`) VALUES
(4, 'DACA'),
(1, 'DAOSI'),
(2, 'DEP'),
(5, 'DG'),
(3, 'DTD');

-- --------------------------------------------------------

--
-- Structure de la table `demandemateriel_filial`
--

CREATE TABLE `demandemateriel_filial` (
  `filial_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demandemateriel_filial`
--

INSERT INTO `demandemateriel_filial` (`filial_id`, `name`) VALUES
(2, 'BAM Casabalnca'),
(4, 'BAM Eljadida'),
(5, 'BAM Meknes'),
(3, 'BAM Rabat'),
(6, 'BG Agadir'),
(14, 'BG casa 1'),
(15, 'BG casa 2'),
(16, 'BG casa 3'),
(8, 'BG Essaouira'),
(11, 'BG Fes'),
(9, 'BG Khouribga'),
(10, 'BG Marrakech'),
(12, 'BG Meknes'),
(13, 'BG Oujda'),
(7, 'BG Rabat'),
(1, 'Siege');

-- --------------------------------------------------------

--
-- Structure de la table `demandemateriel_itemlivrai`
--

CREATE TABLE `demandemateriel_itemlivrai` (
  `item_id` int(11) NOT NULL,
  `contite` int(11) NOT NULL,
  `bonlivraison_id` int(11) DEFAULT NULL,
  `name_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demandemateriel_itemlivrai`
--

INSERT INTO `demandemateriel_itemlivrai` (`item_id`, `contite`, `bonlivraison_id`, `name_id`) VALUES
(1, 5, 1, 1),
(2, 5, 2, 2),
(3, 3, 2, 3),
(4, 1, 3, 3),
(5, 1, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `demandemateriel_items`
--

CREATE TABLE `demandemateriel_items` (
  `item_id` int(11) NOT NULL,
  `contite` int(11) NOT NULL,
  `demande_id` int(11) DEFAULT NULL,
  `name_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demandemateriel_items`
--

INSERT INTO `demandemateriel_items` (`item_id`, `contite`, `demande_id`, `name_id`) VALUES
(1, 4, 1, 1),
(2, 5, 2, 2),
(3, 5, 3, 1),
(4, 5, 4, 2),
(5, 3, 4, 3),
(6, 3, 5, 1),
(7, 1, 6, 1),
(8, 1, 7, 3);

-- --------------------------------------------------------

--
-- Structure de la table `demandemateriel_itemslist`
--

CREATE TABLE `demandemateriel_itemslist` (
  `item_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demandemateriel_itemslist`
--

INSERT INTO `demandemateriel_itemslist` (`item_id`, `name`) VALUES
(1, 'Souris'),
(2, 'Clavier'),
(3, 'Ecran'),
(4, 'Papier A4'),
(5, 'Stylo'),
(6, 'Aganda'),
(7, 'Carte Graphique');

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-08-17 14:32:04.362503', '1', '2023-08-17', 1, '[{\"added\": {}}]', 18, 1),
(2, '2023-08-17 15:04:53.749537', '5', 'chauffeur2@chaffeur.ma', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 13, 1),
(3, '2023-08-17 15:05:04.131937', '4', 'chauffeur1@chauffeur.ma', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 13, 1),
(4, '2023-08-17 15:05:51.643542', '1', '2023-08-17', 3, '', 18, 1),
(5, '2023-08-17 15:05:55.105387', '2', '2023-08-17', 1, '[{\"added\": {}}]', 18, 1),
(6, '2023-08-17 15:05:59.544673', '2', '2023-08-17', 3, '', 18, 1),
(7, '2023-08-17 15:11:55.750148', '3', '2023-08-18', 3, '', 18, 1),
(8, '2023-08-17 15:12:00.721029', '6', 'Demande n°6 : 2023-08-17', 3, '', 17, 1),
(9, '2023-08-17 15:12:00.721029', '3', 'Demande n°3 : 2023-08-17', 3, '', 17, 1),
(10, '2023-08-17 15:12:00.721029', '2', 'Demande n°2 : 2023-08-17', 3, '', 17, 1),
(11, '2023-08-17 15:12:00.728874', '1', 'Demande n°1 : 2023-08-17', 3, '', 17, 1),
(12, '2023-08-22 09:00:13.524955', '13', 'Demande n°13 : 2023-08-22', 3, '', 17, 1),
(13, '2023-08-22 09:00:13.540575', '11', 'Demande n°11 : 2023-08-17', 3, '', 17, 1),
(14, '2023-08-22 09:00:13.540575', '10', 'Demande n°10 : 2023-08-17', 3, '', 17, 1),
(15, '2023-08-22 09:00:13.540575', '9', 'Demande n°9 : 2023-08-17', 3, '', 17, 1),
(16, '2023-08-22 09:00:13.540575', '8', 'Demande n°8 : 2023-08-17', 3, '', 17, 1),
(17, '2023-08-22 09:00:13.540575', '7', 'Demande n°7 : 2023-08-17', 3, '', 17, 1),
(18, '2023-08-22 09:01:06.228459', '7', '2023-08-19', 3, '', 18, 1),
(19, '2023-08-22 09:01:06.228459', '6', '2023-08-17', 3, '', 18, 1),
(20, '2023-08-22 09:01:06.228459', '5', '2023-08-18', 3, '', 18, 1),
(21, '2023-08-22 09:01:06.228459', '4', '2023-08-17', 3, '', 18, 1),
(22, '2023-08-22 09:06:23.404785', '15', 'Demande n°15 : 2023-08-22', 3, '', 17, 1),
(23, '2023-08-22 14:23:13.162016', '20', 'Demande n°20 : 2023-08-22', 3, '', 17, 1),
(24, '2023-08-22 14:23:13.177853', '19', 'Demande n°19 : 2023-08-22', 3, '', 17, 1),
(25, '2023-08-22 14:23:13.177853', '18', 'Demande n°18 : 2023-08-22', 3, '', 17, 1),
(26, '2023-08-22 14:23:13.177853', '17', 'Demande n°17 : 2023-08-22', 3, '', 17, 1),
(27, '2023-08-22 14:23:13.177853', '16', 'Demande n°16 : 2023-08-22', 3, '', 17, 1),
(28, '2023-08-23 08:54:33.944513', '22', 'Demande n°22 : 2023-08-23', 3, '', 17, 1),
(29, '2023-08-23 08:54:33.944513', '21', 'Demande n°21 : 2023-08-22', 3, '', 17, 1),
(30, '2023-08-23 09:10:14.797040', '27', 'Demande n°27 : 2023-08-23', 3, '', 17, 1),
(31, '2023-08-23 09:10:14.805515', '26', 'Demande n°26 : 2023-08-23', 3, '', 17, 1),
(32, '2023-08-23 09:10:14.814263', '25', 'Demande n°25 : 2023-08-23', 3, '', 17, 1),
(33, '2023-08-23 09:10:14.814263', '23', 'Demande n°23 : 2023-08-23', 3, '', 17, 1),
(34, '2023-08-23 10:43:18.042235', '33', 'Demande n°33 : 2023-08-23', 3, '', 17, 1),
(35, '2023-08-23 10:56:34.402429', '15', '2023-08-25 10:54:00+00:00', 3, '', 18, 1),
(36, '2023-08-23 10:56:49.542475', '39', 'Demande n°39 : 2023-08-23', 2, '[{\"changed\": {\"fields\": [\"Admin approuver\", \"Mission\", \"Status\"]}}]', 17, 1),
(37, '2023-08-23 10:56:56.931664', '39', 'Demande n°39 : 2023-08-23', 2, '[]', 17, 1),
(38, '2023-08-23 10:57:05.934660', '40', 'Demande n°40 : 2023-08-23', 2, '[{\"changed\": {\"fields\": [\"Admin approuver\", \"Mission\", \"Status\"]}}]', 17, 1),
(39, '2023-08-23 14:48:48.450573', '3', 'yass.siy@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 13, 1),
(40, '2023-08-23 14:49:41.912262', '3', 'yass.siy@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 13, 1),
(41, '2023-08-23 14:55:57.692983', '42', 'Demande n°42 : 2023-08-23', 2, '[{\"changed\": {\"fields\": [\"Admin approuver\", \"Status\"]}}]', 17, 1),
(42, '2023-08-24 13:49:04.945095', '44', 'Demande n°44 : 2023-08-24', 3, '', 17, 1),
(43, '2023-08-24 13:49:04.948680', '42', 'Demande n°42 : 2023-08-23', 3, '', 17, 1),
(44, '2023-08-24 13:49:04.950912', '40', 'Demande n°40 : 2023-08-23', 3, '', 17, 1),
(45, '2023-08-24 13:49:04.952993', '39', 'Demande n°39 : 2023-08-23', 3, '', 17, 1),
(46, '2023-08-24 13:49:04.955233', '37', 'Demande n°37 : 2023-08-23', 3, '', 17, 1),
(47, '2023-08-24 13:49:04.957275', '36', 'Demande n°36 : 2023-08-23', 3, '', 17, 1),
(48, '2023-08-24 13:49:04.959273', '28', 'Demande n°28 : 2023-08-23', 3, '', 17, 1),
(49, '2023-08-24 13:55:05.080070', '45', 'Demande n°45 : 2023-08-24', 3, '', 17, 1),
(50, '2023-08-24 13:56:33.893635', '18', '2023-08-24 13:56:00+00:00', 3, '', 18, 1),
(51, '2023-08-24 13:56:48.201813', '46', 'Demande n°46 : 2023-08-24', 3, '', 17, 1),
(52, '2023-08-24 14:00:19.681388', '47', 'Demande n°47 : 2023-08-24', 3, '', 17, 1),
(53, '2023-08-24 14:02:21.736970', '48', 'Demande n°48 : 2023-08-24', 3, '', 17, 1),
(54, '2023-08-24 14:11:35.639045', '51', 'Demande n°51 : 2023-08-24', 1, '[{\"added\": {}}]', 17, 1),
(55, '2023-08-24 14:17:32.143050', '51', 'Demande n°51 : 2023-08-24', 3, '', 17, 1),
(56, '2023-08-24 14:17:32.143050', '50', 'Demande n°50 : 2023-08-24', 3, '', 17, 1),
(57, '2023-08-24 14:17:32.151029', '49', 'Demande n°49 : 2023-08-24', 3, '', 17, 1),
(58, '2023-08-24 14:23:40.824582', '53', 'Demande n°53 : 2023-08-24', 3, '', 17, 1),
(59, '2023-08-24 14:23:40.827836', '52', 'Demande n°52 : 2023-08-24', 3, '', 17, 1),
(60, '2023-08-24 14:43:27.127215', '59', 'Demande n°59 : 2023-08-24', 3, '', 17, 1),
(61, '2023-08-24 14:43:27.129221', '58', 'Demande n°58 : 2023-08-24', 3, '', 17, 1),
(62, '2023-08-24 14:43:27.131216', '57', 'Demande n°57 : 2023-08-24', 3, '', 17, 1),
(63, '2023-08-24 14:43:27.132227', '55', 'Demande n°55 : 2023-08-24', 3, '', 17, 1),
(64, '2023-08-24 14:43:27.135758', '54', 'Demande n°54 : 2023-08-24', 3, '', 17, 1),
(65, '2023-08-24 14:43:46.485086', '5', 'chauffeur chauffeur2', 2, '[{\"changed\": {\"fields\": [\"Indisponible\"]}}]', 14, 1),
(66, '2023-08-24 15:03:27.522623', '5', 'chauffeur2@chaffeur.ma', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 13, 1),
(67, '2023-08-28 13:10:02.700574', '73', 'Demande n°73 : 2023-08-28', 2, '[{\"changed\": {\"fields\": [\"Admin approuver\", \"Status\"]}}]', 17, 1),
(68, '2023-08-28 13:37:23.282857', '74', 'Demande n°74 : 2023-08-28', 2, '[{\"changed\": {\"fields\": [\"Admin approuver\", \"Status\"]}}]', 17, 1),
(69, '2023-08-28 13:37:49.916269', '75', 'Demande n°75 : 2023-08-28', 2, '[{\"changed\": {\"fields\": [\"Admin approuver\", \"Status\"]}}]', 17, 1),
(70, '2023-08-28 13:38:39.612506', '71', 'Demande n°71 : 2023-08-28', 2, '[{\"changed\": {\"fields\": [\"Admin approuver\", \"Status\"]}}]', 17, 1),
(71, '2023-08-29 15:22:22.556474', '86', 'Demande n°86 : 2023-08-28', 3, '', 17, 1),
(72, '2023-08-29 15:22:22.556474', '85', 'Demande n°85 : 2023-08-28', 3, '', 17, 1),
(73, '2023-08-29 15:22:22.556474', '84', 'Demande n°84 : 2023-08-28', 3, '', 17, 1),
(74, '2023-08-29 15:22:22.564029', '83', 'Demande n°83 : 2023-08-28', 3, '', 17, 1),
(75, '2023-08-29 15:22:22.564029', '82', 'Demande n°82 : 2023-08-28', 3, '', 17, 1),
(76, '2023-08-29 15:22:22.564029', '81', 'Demande n°81 : 2023-08-28', 3, '', 17, 1),
(77, '2023-08-29 15:22:22.564029', '80', 'Demande n°80 : 2023-08-28', 3, '', 17, 1),
(78, '2023-08-29 15:22:22.572059', '79', 'Demande n°79 : 2023-08-28', 3, '', 17, 1),
(79, '2023-08-29 15:22:22.572059', '78', 'Demande n°78 : 2023-08-28', 3, '', 17, 1),
(80, '2023-08-29 15:22:22.572059', '77', 'Demande n°77 : 2023-08-28', 3, '', 17, 1),
(81, '2023-08-29 15:22:22.572059', '76', 'Demande n°76 : 2023-08-28', 3, '', 17, 1),
(82, '2023-08-29 15:22:22.579580', '75', 'Demande n°75 : 2023-08-28', 3, '', 17, 1),
(83, '2023-08-29 15:22:22.579580', '74', 'Demande n°74 : 2023-08-28', 3, '', 17, 1),
(84, '2023-08-29 15:22:22.579580', '73', 'Demande n°73 : 2023-08-28', 3, '', 17, 1),
(85, '2023-08-29 15:22:22.579580', '72', 'Demande n°72 : 2023-08-28', 3, '', 17, 1),
(86, '2023-08-29 15:22:22.587612', '71', 'Demande n°71 : 2023-08-28', 3, '', 17, 1),
(87, '2023-08-29 15:22:22.587612', '70', 'Demande n°70 : 2023-08-28', 3, '', 17, 1),
(88, '2023-08-29 15:22:22.587612', '69', 'Demande n°69 : 2023-08-28', 3, '', 17, 1),
(89, '2023-08-29 15:22:22.587612', '68', 'Demande n°68 : 2023-08-28', 3, '', 17, 1),
(90, '2023-08-29 15:22:22.587612', '67', 'Demande n°67 : 2023-08-26', 3, '', 17, 1),
(91, '2023-08-29 15:22:22.595611', '66', 'Demande n°66 : 2023-08-26', 3, '', 17, 1),
(92, '2023-08-29 15:22:22.595611', '65', 'Demande n°65 : 2023-08-26', 3, '', 17, 1),
(93, '2023-08-29 15:22:22.595611', '63', 'Demande n°63 : 2023-08-24', 3, '', 17, 1),
(94, '2023-08-29 15:22:22.595611', '62', 'Demande n°62 : 2023-08-24', 3, '', 17, 1),
(95, '2023-08-29 15:22:22.603603', '60', 'Demande n°60 : 2023-08-24', 3, '', 17, 1),
(96, '2023-08-29 15:32:48.622018', '87', 'Demande n°87 : 2023-08-29', 2, '[{\"changed\": {\"fields\": [\"Manager valider\", \"Status\"]}}]', 17, 1),
(97, '2023-08-29 15:35:55.843560', '87', 'Demande n°87 : 2023-08-29', 3, '', 17, 1),
(98, '2023-08-29 18:20:43.240833', '93', 'Demande n°93 : 2023-08-29', 3, '', 17, 1),
(99, '2023-08-29 18:20:43.243598', '92', 'Demande n°92 : 2023-08-29', 3, '', 17, 1),
(100, '2023-08-29 18:20:43.244623', '91', 'Demande n°91 : 2023-08-29', 3, '', 17, 1),
(101, '2023-08-29 18:20:43.246640', '90', 'Demande n°90 : 2023-08-29', 3, '', 17, 1),
(102, '2023-08-29 18:20:43.248231', '89', 'Demande n°89 : 2023-08-29', 3, '', 17, 1),
(103, '2023-08-29 18:20:43.249811', '88', 'Demande n°88 : 2023-08-29', 3, '', 17, 1),
(104, '2023-08-30 09:06:45.362730', '97', 'Demande n°97 : 2023-08-30', 2, '[{\"changed\": {\"fields\": [\"Manager valider\"]}}]', 17, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(17, 'DemandeChauffeur', 'demandechauffeur'),
(18, 'DemandeChauffeur', 'reserver'),
(6, 'DemandeMateriel', 'bonlivraison'),
(7, 'DemandeMateriel', 'demandemodel'),
(8, 'DemandeMateriel', 'departement'),
(9, 'DemandeMateriel', 'filial'),
(12, 'DemandeMateriel', 'itemlivrai'),
(11, 'DemandeMateriel', 'items'),
(10, 'DemandeMateriel', 'itemslist'),
(5, 'sessions', 'session'),
(14, 'users', 'chauffeur'),
(16, 'users', 'employee'),
(15, 'users', 'manager'),
(13, 'users', 'user');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-08-17 14:25:20.934082'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-08-17 14:25:21.001123'),
(3, 'auth', '0001_initial', '2023-08-17 14:25:21.248470'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-08-17 14:25:21.299087'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-08-17 14:25:21.306346'),
(6, 'auth', '0004_alter_user_username_opts', '2023-08-17 14:25:21.339256'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-08-17 14:25:21.347524'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-08-17 14:25:21.347524'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-08-17 14:25:21.355777'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-08-17 14:25:21.364010'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-08-17 14:25:21.372225'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-08-17 14:25:21.388566'),
(13, 'auth', '0011_update_proxy_permissions', '2023-08-17 14:25:21.399387'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-08-17 14:25:21.405146'),
(15, 'DemandeMateriel', '0001_initial', '2023-08-17 14:25:21.706457'),
(16, 'users', '0001_initial', '2023-08-17 14:25:22.200794'),
(17, 'DemandeChauffeur', '0001_initial', '2023-08-17 14:25:22.225245'),
(18, 'DemandeChauffeur', '0002_initial', '2023-08-17 14:25:22.373662'),
(19, 'DemandeMateriel', '0002_initial', '2023-08-17 14:25:22.473159'),
(20, 'admin', '0001_initial', '2023-08-17 14:25:22.580927'),
(21, 'admin', '0002_logentry_remove_auto_add', '2023-08-17 14:25:22.597269'),
(22, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-17 14:25:22.605577'),
(23, 'sessions', '0001_initial', '2023-08-17 14:25:22.638581'),
(24, 'DemandeChauffeur', '0003_remove_reserver_chauffeur', '2023-08-17 15:02:06.772273'),
(25, 'users', '0002_chauffeur_reserver', '2023-08-17 15:02:06.913325'),
(26, 'DemandeChauffeur', '0004_reserver_chauffeur', '2023-08-17 15:10:45.837773'),
(27, 'users', '0003_alter_chauffeur_reserver', '2023-08-17 15:10:45.862620'),
(28, 'DemandeChauffeur', '0005_reserver_demande', '2023-08-22 09:04:37.302862'),
(29, 'DemandeChauffeur', '0006_demandechauffeur_duree_type_and_more', '2023-08-22 14:30:49.398067'),
(30, 'DemandeChauffeur', '0007_alter_demandechauffeur_date_deplacement', '2023-08-22 14:37:55.449057'),
(31, 'DemandeChauffeur', '0008_alter_reserver_date_reserver', '2023-08-23 08:54:11.721543'),
(32, 'DemandeChauffeur', '0009_demandechauffeur_date_retour_reserver_date_retour', '2023-08-23 09:21:10.494848'),
(33, 'DemandeChauffeur', '0010_alter_demandechauffeur_status', '2023-08-28 11:43:02.251554'),
(34, 'DemandeChauffeur', '0011_demandechauffeur_manager_valider_and_more', '2023-08-29 15:22:07.779604');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0c14y4pn4zdanf7dm5dd4xvmx4xzl89p', '.eJxVjj0OwjAMRu-SGVWNXDsJIxLniJzYUSpoB0KnirtDUAcY3_cjvd1E3p41bk0fcRZzNtacfrPE-aZrLzq24eA2XBee75ej_btUbvWzDxM6KULBjQ4hgQYQzaNahqkU8Tl7yolJkFwWC0hkxSOCJ5sUuofowqvoV4z86w3sZDew:1qaZiG:d68zv2fhyFP0UcLAec2PLCMpjIu6ye_vzUvX6knMXkQ', '2023-09-11 10:43:16.591069'),
('7epdn99idtu5kid8aroqaqt7uyt84noj', '.eJxVi0sOwjAMBe-SNapquXZSlkicI3JsR6n4LAhdIe4OlbqA5byZ9wpZ1mfLa_dHXiwcA4TD71ZEL37fxIZ92LkP55ss19Nu_y5Nevv280TRqvEcx0hY0Gc019FBcKrVkmpiLcJGHNUAiRksEWFiKI4Q3h-YojKe:1qb0N8:SCF1dgxLz9pVAqc_4LdrRHaqbY8tT4nJtmsL-dpY7Rw', '2023-09-12 15:11:14.870212'),
('84lmjeh8omekimaofde30qm56zuxx4gw', '.eJxVjk0OwiAQhe_C2jSltAy4NPEcZGAeodF2Ie3KeHfFdKHL7_3lPVXgfSthr3iEWdRZGXX61SKnG9ZmNKzdwbW7LjzfL4f7VylcyyfvPKwQkDwNiD1linEwlnsNbYn8BIiGiULi4PNoE7GzOY5CJk3URgULr4LvMe9fbwzgOIo:1qbHEB:vKHPPb3qbxVq89gK_c3Kkx8GUQb7z1SgN73B7QaxK-I', '2023-09-13 09:11:07.281537'),
('9w8oz7xwkgtc9rk1pwgm4cdjxs8gwz6j', '.eJxVi0sOgzAMBe_iNUIhIcHtslLPEdmxraB-Fk1ZVb17QWJRlvNm3gcyLe-al6avPAucIUH3vzGVmz43sWHrd2799UHz_bLbw6VSq2uvXETNZDALPgQ3MWOUqTgWThic-DWI46hpQBLy6lPkQOj1ZA4twfcH0ssz1Q:1qZtjc:QN0buinpdx-cZH9eES86CU1YYIpSnynXQR8Q3Soog7w', '2023-09-09 13:53:52.055225'),
('dz4tg59l7po6yrhb1bqfce25oxtdlgxo', '.eJxVjjkOwjAQRe_iGkWM1zElEuewxp6xHEFSYFIh7g5GKaB8f5HeUyXaHi1tXe5pZnVSWh1-s0zlKusoBvZp5z5dFppv5739uzTq7bMHn72xAjEYTeJYLNbAfDQVPMZYOEC1AcEZInRVMFf0OmqwznHJw4NloZXlK4b4egPPbzdZ:1qb0lM:kSitaWkhc08-u84JccpjFwWapIrAnb2jCxSjFZ5N5zs', '2023-09-12 15:36:16.285950'),
('elc8zy6hb8uak0qyvnf79xc8b0gb2jvr', '.eJxVizsKwzAQBe-iOhiv9U8ZyDmEdrWLTD5FZFfBd7cMLpJyZt77qpTXpaa18SfNRV2VUZdfh5ke_D7CgW04uQ33V56ft7P-XWpute-9lFFApggSHLKWMUxUuulCUIMhNGwtedSeLHQTjTXgACnEzE5tO6moMvA:1qWwj7:sC4ALW2oRfcYEeXDis2GiqnM-Yn6Y8_FGAkLhB6Zl_g', '2023-09-01 10:29:09.984008'),
('fg8hltfuge57vawde1zminy8tp2u94uz', '.eJxVjr0OwjAQg98lM1RJr_kpIxLPUV1yF7WCdiDJhHh3EuhQRtufLb_EhCXPU0n8nBYSF6HE6eh5DHfeWtBk6nadutuKy-O6p3-VGdNc-XHQliKZ0UqrwQOPQBwkK4QhRnIhOBM8GtLGBlKgjVHktAZnlGdoP4hX3Ii_x5SU1cDMxL7kut_LHs7SnWUjU8ZcUnXFD4rLdkDq2PsDKiFHpQ:1qbLfd:Zvxi3Ix3Y_miU0-U1JQ5khxc6MmGQql4fFee-CTc6cc', '2023-09-13 13:55:45.922541'),
('fxnq2je0rx684lkb4a6g8vw03vf4649q', '.eJxVjjkOwjAQRe_iGkWM1zElEuewxp6xHEFSYFIh7g5GKaB8f5HeUyXaHi1tXe5pZnVSWh1-s0zlKusoBvZp5z5dFppv5739uzTq7bMHn72xAjEYTeJYLNbAfDQVPMZYOEC1AcEZInRVMFf0OmqwznHJw4NloZXlK4b69QbPYzdT:1qacnQ:1n9Q9gubNXfxMWzMKFttlmuKXBfDjE4_fWXQADENwzY', '2023-09-11 14:00:48.258511'),
('hc3wj8x8fmcsb0gt0dd85tw76khqcvz4', '.eJxVjjkOwjAQRe_iGkWM1zElEuewxp6xHEFSYFIh7g5GKaB8f5HeUyXaHi1tXe5pZnVSWh1-s0zlKusoBvZp5z5dFppv5739uzTq7bMHn72xAjEYTeJYLNbAfDQVPMZYOEC1AcEZInRVMFf0OmqwznHJw4NloZXlKxbg9QbPXjdR:1qaZw3:oA1FkvMOxDrTnkI5vSrOQ6xSepN8hvEwN8BJpowCYgA', '2023-09-11 10:57:31.603955'),
('lc7fimt21n7cx9ynxy9m6cdxk2eyr5ty', '.eJxVjjkOwjAQRe_iGkWM1zElEuewxp6xHEFSYFIh7g5GKaB8f5HeUyXaHi1tXe5pZnVSWh1-s0zlKusoBvZp5z5dFppv5739uzTq7bMHn72xAjEYTeJYLNbAfDQVPMZYOEC1AcEZInRVMFf0OmqwznHJw4NloZXlKxb06w3PYDdS:1qaa3i:VXGjyTDlAnLQu8Df0SveEqd8HQMLMrsjEOiclCguRZM', '2023-09-11 11:05:26.940068'),
('ldkmdwcq8u40dtbm8yce7popwma3cul2', '.eJxVjjkOwjAQRe_iGkUZr2NKJM5hjTNjOYKkwEmFuDsYpYDy_UV6T5Vo32ramzzSzOqstDr9Zpmmm6y96NiGg9twXWi-X47271Kp1c8efPbGCsRgNIljsVgC82gKeIxx4gDFBgRniNAVwVzQ66jBOsdT7h4sC60sXzEYzesNBow3fQ:1qbLia:FDURXXP1z2o9QKtrySm2HdLLIxAmkLDCSCrgtgQev0U', '2023-09-13 13:58:48.113554'),
('mlahjtonvyqq1wqoipwpdw3hyw781f0j', '.eJxVjk0OwiAQhe_C2jQFWgZcmniOZmAeodF2Ie3KeHfFdKHL7_3lPdXE-1amveIxzaLOyqrTrxY53bA2o2HtDq7ddeH5fjncv0rhWj55H-CEgBTIIPaUKUZjHfca2hGFERANG4XEI-TBJWLvchyEbBqpjQoWXgXfY8G83gzSOIM:1qb3IZ:6GD_J2X_JOoYAvFiMPmgj3NdR1b9Lxecvu4Mkg39R2I', '2023-09-12 18:18:43.949723'),
('om2xijvznq975j4gzs7e539tjrahd927', '.eJxVjrsOwjAMRf8lM6os13mYEYnvqOw4VSpoB0InxL_Tog4wnvvSfblB1mcd1lYew2Tu7KI7_Woq-VaW3dixdQe37jrLdL8c7l-lSqtbPimUNDIKeeWMgQlG8BAgFsTeG2dNZuItQk-giZVRBYlIUIB4G7Uyy2LleyzE9wfHxTcF:1qZu0O:AU6o9FBFNFmL-XH5lUcARZfEol31vT6pVliterYq_KQ', '2023-09-09 14:11:12.904316'),
('qu8wtsuognfpic6z0sik78bryhb32bwt', '.eJxVizsOwjAQBe_iGkVxnHhtSiTOYe16n-WIT4FJhbg7REqRlPNm3sckXt41LQ2vNKs5G2dO-0043_BcxYqt27h11wfP98tmD5fKrf77EOGVgBxpgPRUSGRwnnsL64niBKiFEyUNiGX0mTj4IqOSyxOp-f4Aq6QzdA:1qb3Ox:y0Vt0pC9_UZHqzdXMcJtGJlQfxQHKn6hSp_dG5dul6M', '2023-09-12 18:25:19.225331'),
('s9et04covbvhaxbn9rah1s0rr2dlhdrq', '.eJxVjk0OwiAQhe_C2jSlFKa4NPEcZGAeodF2Ie3KeHfFdKHL7_3lPVXgfSthr3iEWdRZGXX61SKnG9ZmNKzdwbW7LjzfL4f7Vylcyyc_eTghIHkaEHvKFONgHPca2hF5C4iGiUIywefRJeLJ5TgKmWSpjQoWXgXfY3Z4vQEMxjh_:1qZBAG:UGYrlwPGtyI2-kiQ4nR9H8njk54h-vJGyJqNMDiKvcQ', '2023-09-07 14:18:24.798535'),
('vnm65ung5h39duj9jk205xck17eyba2v', '.eJxVi0sOwjAMRO_iNaoa17YISyTOEdlxqlR8FoSuEHcnlbqA1ejNm3lD0vVV09rKMy0OJ2A4_Ham-Voem9iwDTu34XLX5Xbe7d-laqt9L4qzY9Qc1VEFqTBbmEg85MJRGIlpGnseaTbKLiES4yi9M4sOny-EUzHF:1qZBuj:vOw3pszLwtynn3_TnH-OVPe4vCOz0Wk7T-ZQgM9FEaE', '2023-09-07 15:06:25.730504'),
('w0hnxt4pzwyl7uo46m7ybkvheemfu7rz', '.eJxVjjkOwjAQRe_iGkWM1zElEuewxp6xHEFSYFIh7g5GKaB8f5HeUyXaHi1tXe5pZnVSWh1-s0zlKusoBvZp5z5dFppv5739uzTq7bMHn72xAjEYTeJYLNbAfDQVPMZYOEC1AcEZInRVMFf0OmqwznHJw4NloZXlK-bj6w3PazdY:1qaZkx:CKWqPMqQLVhNE3n3A6CddvVfiQatsUDDHZdH02qfSWE', '2023-09-11 10:46:03.710317'),
('ys31j4cifeflztj39xvyl2mgh24xac4g', '.eJxVizsKwzAQBe-iOhiv9U8ZyDmEdrWLTD5FZFfBd7cMLpJyZt77qpTXpaa18SfNRV2VUZdfh5ke_D7CgW04uQ33V56ft7P-XWpute-9lFFApggSHLKWMUxUuulCUIMhNGwtedSeLHQTjTXgACnEzE5tO6moMvA:1qWe6O:YQ9MHncfN94TzknTfgBgSRjMs2S8RiALEBOQg1MnHp0', '2023-08-31 14:35:56.942040');

-- --------------------------------------------------------

--
-- Structure de la table `users_chauffeur`
--

CREATE TABLE `users_chauffeur` (
  `user_id` bigint(20) NOT NULL,
  `indisponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users_chauffeur`
--

INSERT INTO `users_chauffeur` (`user_id`, `indisponible`) VALUES
(4, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `users_chauffeur_reserver`
--

CREATE TABLE `users_chauffeur_reserver` (
  `id` bigint(20) NOT NULL,
  `chauffeur_id` bigint(20) NOT NULL,
  `reserver_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users_chauffeur_reserver`
--

INSERT INTO `users_chauffeur_reserver` (`id`, `chauffeur_id`, `reserver_id`) VALUES
(31, 4, 38),
(32, 4, 39),
(33, 4, 40),
(34, 4, 41),
(35, 4, 42),
(36, 4, 43),
(37, 4, 44);

-- --------------------------------------------------------

--
-- Structure de la table `users_employee`
--

CREATE TABLE `users_employee` (
  `user_id` bigint(20) NOT NULL,
  `manager_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users_employee`
--

INSERT INTO `users_employee` (`user_id`, `manager_id`) VALUES
(2, 3),
(6, 7),
(7, 7);

-- --------------------------------------------------------

--
-- Structure de la table `users_manager`
--

CREATE TABLE `users_manager` (
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users_manager`
--

INSERT INTO `users_manager` (`user_id`) VALUES
(3),
(7);

-- --------------------------------------------------------

--
-- Structure de la table `users_user`
--

CREATE TABLE `users_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_employee` tinyint(1) NOT NULL,
  `is_manager` tinyint(1) NOT NULL,
  `is_chauffeur` tinyint(1) NOT NULL,
  `departement_id` int(11) DEFAULT NULL,
  `filial_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users_user`
--

INSERT INTO `users_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `is_employee`, `is_manager`, `is_chauffeur`, `departement_id`, `filial_id`) VALUES
(1, 'pbkdf2_sha256$600000$fZA70wrfWUr8ydr2rDTtqF$eIOxlVboQ7VnXpQt6vHXtaqj9NM8cUDvUKtf/MY6IeQ=', '2023-08-30 09:08:01.284872', 1, 'admin@admin.ma', 'Admin', 'Admin', 'admin@admin.ma', 1, 1, '2023-08-17 14:26:30.277518', 0, 0, 0, 1, 1),
(2, 'pbkdf2_sha256$600000$xSQzzYsy036KSA2BpXKs2q$3J+OFQgnWQsqsxUcOptKwSRu/60aFy/IfrtU79GlwmQ=', '2023-08-30 09:14:17.231159', 0, 'siyyass678@gmail.com', 'test', 'test3', 'siyyass678@gmail.com', 0, 1, '2023-08-17 14:28:05.786857', 1, 0, 0, 1, 1),
(3, 'pbkdf2_sha256$600000$5d7PGa5H4pQWRceJDR2UDn$RmUhpeNRYlr4mvfdLpXLNlLakwqeENNSmqpkJOr4Whc=', '2023-08-30 09:08:26.094142', 0, 'yass.siy@gmail.com', 'test', 'test', 'yass.siy@gmail.com', 0, 1, '2023-08-17 14:28:26.000000', 0, 1, 0, 1, 1),
(4, 'pbkdf2_sha256$600000$MdftS5IR2pofKILCyAjMLV$R0U3s7FSmoDQuiElm9AT1pQlHdgoDuDUlJjQbm15HE0=', '2023-08-24 13:48:38.146610', 0, 'chauffeur1@chauffeur.ma', 'chauffeur1', 'chauffeur', 'chauffeur1@chauffeur.ma', 0, 1, '2023-08-17 14:29:03.000000', 0, 0, 1, 1, 1),
(5, 'pbkdf2_sha256$600000$lBjZI32w9LsCiDDeB4Dzlz$WAJVsyQyxno5VX5gEsMEOurvDQBgCHAFk4LAftOe2Cw=', '2023-08-24 15:06:25.726472', 0, 'chauffeur2@chaffeur.ma', 'chauffeur2', 'chauffeur', 'chauffeur2@chaffeur.ma', 0, 1, '2023-08-17 14:29:45.000000', 0, 0, 1, 1, 1),
(6, 'pbkdf2_sha256$600000$OMTLG5QKozmLyROPdjzyt8$I2+FkHMFmUaWa3Ix+U8fxdPEHEg7jVOIZGLgz6X1T+w=', '2023-08-26 13:53:52.055225', 0, 'najat@elmaamri.ma', 'Najat', 'EL maamri', 'najat@elmaamri.ma', 0, 1, '2023-08-26 13:49:02.707370', 1, 0, 0, 4, 7),
(7, 'pbkdf2_sha256$600000$3CYWU9MIAFKflFxYiJdhdo$DEPN+R4dUZl51KxkTI6BeyraU9MtBo6TkhnqD3kT56M=', '2023-08-26 13:53:10.389984', 0, 'idirissi@idriss.ma', 'Idirss', 'Idrissi', 'idirissi@idriss.ma', 0, 1, '2023-08-26 13:49:52.062562', 0, 1, 0, 4, 7);

-- --------------------------------------------------------

--
-- Structure de la table `users_user_groups`
--

CREATE TABLE `users_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users_user_user_permissions`
--

CREATE TABLE `users_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `demandechauffeur_demandechauffeur`
--
ALTER TABLE `demandechauffeur_demandechauffeur`
  ADD PRIMARY KEY (`demande_id`),
  ADD KEY `DemandeChauffeur_dem_chauffeur_id_5262aa8d_fk_users_cha` (`chauffeur_id`),
  ADD KEY `DemandeChauffeur_dem_demandeur_id_3e5c42dc_fk_users_use` (`demandeur_id`);

--
-- Index pour la table `demandechauffeur_reserver`
--
ALTER TABLE `demandechauffeur_reserver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DemandeChauffeur_res_chauffeur_id_1d202387_fk_users_cha` (`chauffeur_id`),
  ADD KEY `DemandeChauffeur_res_demande_id_d3acc810_fk_DemandeCh` (`demande_id`);

--
-- Index pour la table `demandemateriel_bonlivraison`
--
ALTER TABLE `demandemateriel_bonlivraison`
  ADD PRIMARY KEY (`bl_id`),
  ADD KEY `DemandeMateriel_bonl_demande_id_01a8efb5_fk_DemandeMa` (`demande_id`);

--
-- Index pour la table `demandemateriel_demandemodel`
--
ALTER TABLE `demandemateriel_demandemodel`
  ADD PRIMARY KEY (`demande_id`),
  ADD KEY `DemandeMateriel_dema_demandeur_id_04abbe20_fk_users_use` (`demandeur_id`);

--
-- Index pour la table `demandemateriel_departement`
--
ALTER TABLE `demandemateriel_departement`
  ADD PRIMARY KEY (`departement_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `demandemateriel_filial`
--
ALTER TABLE `demandemateriel_filial`
  ADD PRIMARY KEY (`filial_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `demandemateriel_itemlivrai`
--
ALTER TABLE `demandemateriel_itemlivrai`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `DemandeMateriel_item_bonlivraison_id_6250c59c_fk_DemandeMa` (`bonlivraison_id`),
  ADD KEY `DemandeMateriel_item_name_id_8e9bf012_fk_DemandeMa` (`name_id`);

--
-- Index pour la table `demandemateriel_items`
--
ALTER TABLE `demandemateriel_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `DemandeMateriel_item_demande_id_97c4b918_fk_DemandeMa` (`demande_id`),
  ADD KEY `DemandeMateriel_item_name_id_1583c6ca_fk_DemandeMa` (`name_id`);

--
-- Index pour la table `demandemateriel_itemslist`
--
ALTER TABLE `demandemateriel_itemslist`
  ADD PRIMARY KEY (`item_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `users_chauffeur`
--
ALTER TABLE `users_chauffeur`
  ADD PRIMARY KEY (`user_id`);

--
-- Index pour la table `users_chauffeur_reserver`
--
ALTER TABLE `users_chauffeur_reserver`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_chauffeur_reserver_chauffeur_id_reserver_id_b2c55cf5_uniq` (`chauffeur_id`,`reserver_id`),
  ADD KEY `users_chauffeur_rese_reserver_id_093ad02c_fk_DemandeCh` (`reserver_id`);

--
-- Index pour la table `users_employee`
--
ALTER TABLE `users_employee`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `users_employee_manager_id_e0ef082e_fk_users_manager_user_id` (`manager_id`);

--
-- Index pour la table `users_manager`
--
ALTER TABLE `users_manager`
  ADD PRIMARY KEY (`user_id`);

--
-- Index pour la table `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `users_user_departement_id_56543f78_fk_DemandeMa` (`departement_id`),
  ADD KEY `users_user_filial_id_8bc64524_fk_DemandeMa` (`filial_id`);

--
-- Index pour la table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  ADD KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  ADD KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pour la table `demandechauffeur_demandechauffeur`
--
ALTER TABLE `demandechauffeur_demandechauffeur`
  MODIFY `demande_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT pour la table `demandechauffeur_reserver`
--
ALTER TABLE `demandechauffeur_reserver`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `demandemateriel_bonlivraison`
--
ALTER TABLE `demandemateriel_bonlivraison`
  MODIFY `bl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `demandemateriel_demandemodel`
--
ALTER TABLE `demandemateriel_demandemodel`
  MODIFY `demande_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `demandemateriel_departement`
--
ALTER TABLE `demandemateriel_departement`
  MODIFY `departement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `demandemateriel_filial`
--
ALTER TABLE `demandemateriel_filial`
  MODIFY `filial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `demandemateriel_itemlivrai`
--
ALTER TABLE `demandemateriel_itemlivrai`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `demandemateriel_items`
--
ALTER TABLE `demandemateriel_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `demandemateriel_itemslist`
--
ALTER TABLE `demandemateriel_itemslist`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `users_chauffeur_reserver`
--
ALTER TABLE `users_chauffeur_reserver`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `users_user`
--
ALTER TABLE `users_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `demandechauffeur_demandechauffeur`
--
ALTER TABLE `demandechauffeur_demandechauffeur`
  ADD CONSTRAINT `DemandeChauffeur_dem_chauffeur_id_5262aa8d_fk_users_cha` FOREIGN KEY (`chauffeur_id`) REFERENCES `users_chauffeur` (`user_id`),
  ADD CONSTRAINT `DemandeChauffeur_dem_demandeur_id_3e5c42dc_fk_users_use` FOREIGN KEY (`demandeur_id`) REFERENCES `users_user` (`id`);

--
-- Contraintes pour la table `demandechauffeur_reserver`
--
ALTER TABLE `demandechauffeur_reserver`
  ADD CONSTRAINT `DemandeChauffeur_res_chauffeur_id_1d202387_fk_users_cha` FOREIGN KEY (`chauffeur_id`) REFERENCES `users_chauffeur` (`user_id`),
  ADD CONSTRAINT `DemandeChauffeur_res_demande_id_d3acc810_fk_DemandeCh` FOREIGN KEY (`demande_id`) REFERENCES `demandechauffeur_demandechauffeur` (`demande_id`);

--
-- Contraintes pour la table `demandemateriel_bonlivraison`
--
ALTER TABLE `demandemateriel_bonlivraison`
  ADD CONSTRAINT `DemandeMateriel_bonl_demande_id_01a8efb5_fk_DemandeMa` FOREIGN KEY (`demande_id`) REFERENCES `demandemateriel_demandemodel` (`demande_id`);

--
-- Contraintes pour la table `demandemateriel_demandemodel`
--
ALTER TABLE `demandemateriel_demandemodel`
  ADD CONSTRAINT `DemandeMateriel_dema_demandeur_id_04abbe20_fk_users_use` FOREIGN KEY (`demandeur_id`) REFERENCES `users_user` (`id`);

--
-- Contraintes pour la table `demandemateriel_itemlivrai`
--
ALTER TABLE `demandemateriel_itemlivrai`
  ADD CONSTRAINT `DemandeMateriel_item_bonlivraison_id_6250c59c_fk_DemandeMa` FOREIGN KEY (`bonlivraison_id`) REFERENCES `demandemateriel_bonlivraison` (`bl_id`),
  ADD CONSTRAINT `DemandeMateriel_item_name_id_8e9bf012_fk_DemandeMa` FOREIGN KEY (`name_id`) REFERENCES `demandemateriel_itemslist` (`item_id`);

--
-- Contraintes pour la table `demandemateriel_items`
--
ALTER TABLE `demandemateriel_items`
  ADD CONSTRAINT `DemandeMateriel_item_demande_id_97c4b918_fk_DemandeMa` FOREIGN KEY (`demande_id`) REFERENCES `demandemateriel_demandemodel` (`demande_id`),
  ADD CONSTRAINT `DemandeMateriel_item_name_id_1583c6ca_fk_DemandeMa` FOREIGN KEY (`name_id`) REFERENCES `demandemateriel_itemslist` (`item_id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Contraintes pour la table `users_chauffeur`
--
ALTER TABLE `users_chauffeur`
  ADD CONSTRAINT `users_chauffeur_user_id_4192c20a_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Contraintes pour la table `users_chauffeur_reserver`
--
ALTER TABLE `users_chauffeur_reserver`
  ADD CONSTRAINT `users_chauffeur_rese_chauffeur_id_39ba8e63_fk_users_cha` FOREIGN KEY (`chauffeur_id`) REFERENCES `users_chauffeur` (`user_id`),
  ADD CONSTRAINT `users_chauffeur_rese_reserver_id_093ad02c_fk_DemandeCh` FOREIGN KEY (`reserver_id`) REFERENCES `demandechauffeur_reserver` (`id`);

--
-- Contraintes pour la table `users_employee`
--
ALTER TABLE `users_employee`
  ADD CONSTRAINT `users_employee_manager_id_e0ef082e_fk_users_manager_user_id` FOREIGN KEY (`manager_id`) REFERENCES `users_manager` (`user_id`),
  ADD CONSTRAINT `users_employee_user_id_6131bb7a_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Contraintes pour la table `users_manager`
--
ALTER TABLE `users_manager`
  ADD CONSTRAINT `users_manager_user_id_f7714736_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Contraintes pour la table `users_user`
--
ALTER TABLE `users_user`
  ADD CONSTRAINT `users_user_departement_id_56543f78_fk_DemandeMa` FOREIGN KEY (`departement_id`) REFERENCES `demandemateriel_departement` (`departement_id`),
  ADD CONSTRAINT `users_user_filial_id_8bc64524_fk_DemandeMa` FOREIGN KEY (`filial_id`) REFERENCES `demandemateriel_filial` (`filial_id`);

--
-- Contraintes pour la table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Contraintes pour la table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
