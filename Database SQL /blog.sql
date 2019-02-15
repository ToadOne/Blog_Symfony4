-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 15 Février 2019 à 16:33
-- Version du serveur :  5.7.22
-- Version de PHP :  7.0.27-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `image`, `created_at`, `category_id`) VALUES
(43, 'Les chutes de Niagara ( Niagara Falls )', 'Les chutes du Niagara ou chutes Niagara (en anglais : Niagara Falls) sont un ensemble de trois chutes d’eau situées sur la rivière Niagara qui relie le lac Érié au lac Ontario, dans l’est de l’Amérique du Nord, à la frontière entre le Canada et les États-Unis \r\n\r\nBien qu’elles ne soient pas particulièrement hautes, les chutes du Niagara sont très larges. Avec un débit1 de plus de 2 800 m3/s, elles sont les chutes les plus puissantes d’Amérique du NordN 1 et parmi les plus connues2 à travers le monde.\r\n\r\nRenommées pour leur beauté, les chutes du Niagara sont aussi une source immense d’énergie hydroélectrique et leur préservation est un défi écologique. Cette merveille naturelle, haut-lieu du tourisme depuis plus d’un siècle, est partagée par les villes jumelles de Niagara Falls (New York) aux États-Unis et Niagara Falls (Ontario) au Canada.', 'https://images.salaun-holidays.com/(Image)-image-Etats-Unis-Chutes-Niagara-134-fo_73183714-09032017.jpg', '2018-10-28 01:41:30', 1),
(45, 'Le Parc Omega (Montebello)', 'Le Parc Oméga, une expérience familiale unique en plein coeur de la nature, de la culture et de l’histoire du Québec\r\n\r\nÀ environ 1h30 de Montréal et 45 minutes d’Ottawa, découvrez les animaux sauvages du Canada, orignaux, wapitis, bisons, loups, ours… dans leur milieu naturel. Ouvert toute l’année, le Parc vous propose de nombreuses activités. Animation, pique-nique, sentiers pédestres… pour une journée en famille inoubliable. Découvrez également l’histoire de notre peuple à travers les sentiers des 1res nations et de la colonisation.', 'http://canada.maumautte.com/wp-content/uploads/2011/05/DSC_4402.jpg', '2018-10-28 01:50:04', 2),
(46, 'Parc de Forillon (Péninsule Gaspésiènne)', 'Le parc national Forillon propose une foule d’expériences entre mer, falaises et forêt. Marchez tranquillement sur une plage de galets. Pénétrez dans l’histoire en poussant la porte de la jolie maison jaune qui surplombe la mer. Plongez en apnée pour découvrir une faune et une flore colorées. Tendez l’oreille, vous entendrez le chant des oiseaux marins et peut-être même le souffle des baleines.', 'https://res.cloudinary.com/serdy-m-dia-inc/image/upload/w_900,h_506/legacy_espaces//var/data/gallery/photo/87/97/14/55/14/34323.jpg', '2018-10-31 01:28:46', 2),
(47, 'Parc National du Mont-Tremblant', 'Mont-Tremblant est une ville de la province canadienne de Québec, située au sein des Laurentides, une chaîne montagneuse au nord-ouest de Montréal. La station de ski de Mont-Tremblant, ouverte toute l\'année, se trouve sur les berges du lac Tremblant. Elle permet la pratique de sports d\'hiver, accueille un parcours de golf et possède un village commerçant piéton. Au nord de la ville, le vaste parc national de Mont-Tremblant est doté de chemins de randonnée forestiers et de lacs pour le canoë. Il est possible d\'y pratiquer des activités l\'hiver.', 'https://www.laurentides.com/sites/default/files/styles/tl_prestataire_slideshow/public/parc_national_du_mont_tremblant_randonnee_pedestre_2_0.jpg?itok=Fap5f-5x', '2018-10-31 01:33:28', 2),
(48, 'Parc Marin du Saguenay', 'Le parc marin du Saguenay–Saint-Laurent est une aire marine protégée située à l\'embouchure du fjord de la rivière Saguenay, au Québec. Il est géré conjointement par la Société des établissements de plein air du Québec et par Parcs Canada.\r\nLe parc marin est contigu par sa portion terrestre au parc national du Fjord-du-Saguenay. Le parc marin est reconnu internationalement pour la qualité des observations de mammifères marins que l\'on peut y faire, en mer, mais également à partir de la rive.', 'https://www.sepaq.com/resources/images/pq/ssl/caroussel/ssl_cap_eternite.jpg', '2018-10-31 01:41:33', 2);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(1, 'Ontario', 'Découvrez l\'Ontario'),
(2, 'Québec', 'Découvrez le Québèc'),
(3, 'Saskatchewan', 'Découvrez le Saskatchewan'),
(4, 'Manitoba', 'Découvrez le Manitoba'),
(5, 'Alberta', 'Découvrez l\'Alberta'),
(6, 'British-Columbia', 'Découvrez le British-Columbia');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `comment`
--

INSERT INTO `comment` (`id`, `article_id`, `author`, `content`, `created_at`) VALUES
(131, 49, 'stevy', 'wahouuuuu trop bo', '2018-11-05 20:42:32'),
(138, 48, 'Alice', 'Oh Mon dieu que c\'est beau <3', '2019-01-28 04:12:13');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20180907094217'),
('20181025093303'),
('20181025094106'),
('20181026083944'),
('20181029131618'),
('20181029135047'),
('20181029150410'),
('20181029161656'),
('20181030123446');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `roles`, `created_at`) VALUES
(25, 'admin@gmail.com', 'administrateur', '$2y$13$.Iw6w8oAKl93jEtMcHfsR.ktZKedzEoKHYXBl9efqHkmFX0kyrJna', '[\"ROLE_ADMIN\"]', '2018-10-30 14:12:56'),
(43, 'justin@gmail.com', 'justin', '$2y$13$kEPj7xp.16Q.nwRaEU2kIuZNMkNHTYYY8OOVglNa28LQ7HXVAq7vW', '[\"ROLE_USER\"]', '2018-11-01 01:11:42'),
(45, 'gcorin65@gmail.com', 'Gregcrn', '$2y$13$bckIiR1Ni95P/.K0K0YG..c.5g72xj.YJz1k/wK66DFh6RhJ78.K6', '[\"ROLE_USER\"]', '2018-11-06 11:37:07'),
(46, 'punkadelistic@gmail.com', 'benoist', '$2y$13$jMzZUESJOjhy21MhkRE2cOyulPkM5RdbJXo4jepuV2aHw8k7vASlW', '[\"ROLE_USER\"]', '2018-11-15 12:10:44'),
(47, 'kevinpemonon@gmail.com', 'Kevin', '$2y$13$T8QNJ/L1GaY27uaDh3/5selLqkloiIEq9dCXUEecLh0cEiZ5iZWrm', '[\"ROLE_USER\"]', '2019-01-24 16:45:40'),
(52, 'vastel.steven@gmail.com', 'steven', '$2y$13$j/BsfQzGFzEy3Cxi7YtDseIIcSeBZ8uDAxIFzbkWx9URdWwnYVTp6', '[\"ROLE_USER\"]', '2019-01-26 15:58:54'),
(53, 'mediasic@gmail.com', 'soso', '$2y$13$ykSvMuax9R8gE3/Do06a2e8PKVcH7XV136PC3JT7oXk8EOyTKB4Jm', '[\"ROLE_USER\"]', '2019-01-29 15:46:09');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E6612469DE2` (`category_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C7294869C` (`article_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E6612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
