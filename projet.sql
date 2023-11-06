-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 06 nov. 2023 à 20:32
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `acroom`
--

CREATE TABLE `acroom` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `acroom`
--

INSERT INTO `acroom` (`id`, `roomno`, `roomtype`, `price`, `status`) VALUES
(6, 522, 'AC', 900, 'un book');

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(2, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `admin_edit`
--

CREATE TABLE `admin_edit` (
  `admin_id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin_edit`
--

INSERT INTO `admin_edit` (`admin_id`, `roomno`, `roomtype`) VALUES
(1, 121, 'deluxAC'),
(3, 523, 'nonAC'),
(4, 122, 'deluxAC'),
(5, 524, 'nonAC');

--
-- Déclencheurs `admin_edit`
--
DELIMITER $$
CREATE TRIGGER `Audit_ac` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
        
IF (NEW.roomtype = 'AC') THEN
            INSERT INTO acroom

    SET  
	roomno = NEW.roomno,

    	roomtype =  NEW.roomtype,
	
	price = 900,

	status = 'un book';

     
      END IF;
   

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Audit_delux` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
     IF ( NEW.roomtype = 'deluxAC') THEN
        INSERT INTO deluxacroom
           SET
    
            roomno = NEW.roomno,

            roomtype =  NEW.roomtype,

           price = 1100,

           status = 'un book';
      
            
      END IF;
   
    

    

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Audit_nonac` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
        
IF (NEW.roomtype = 'nonAC') THEN
            INSERT INTO nonac

    SET  
	    roomno = NEW.roomno,

    	roomtype =  NEW.roomtype,
	
	   price = 700,

	   status = 'un book';

     
      END IF;
   

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `card details`
--

CREATE TABLE `card details` (
  `id` int(11) NOT NULL,
  `cardno` bigint(16) NOT NULL,
  `cvv` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `card details`
--

INSERT INTO `card details` (`id`, `cardno`, `cvv`) VALUES
(1, 1111111111111111, 111),
(2, 2222222222222222, 222),
(3, 3333333333333333, 333),
(4, 4444444444444444, 444);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `mobile`, `address`, `message`) VALUES
(3, 'iheb', 'iheb@gmail.com', 1223344558, 'kebili', 'food is not good'),
(4, 'mounir', 'mounir@gmail.com', 9889988998, 'tunis\r\n', 'what is the price of AC room?');

-- --------------------------------------------------------

--
-- Structure de la table `deluxacroom`
--

CREATE TABLE `deluxacroom` (
  `id` int(11) NOT NULL,
  `roomno` int(20) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `deluxacroom`
--

INSERT INTO `deluxacroom` (`id`, `roomno`, `roomtype`, `price`, `status`) VALUES
(1, 101, 'deluxAC', 1100, 'un book'),
(18, 111, 'deluxAC', 1100, 'unbook');

-- --------------------------------------------------------

--
-- Structure de la table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `feedback` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `feedback`) VALUES
(1, 'iheb', 'good'),
(2, 'mounir', 'excellent');

-- --------------------------------------------------------

--
-- Structure de la table `food`
--

CREATE TABLE `food` (
  `id` int(255) NOT NULL,
  `full_name` text NOT NULL,
  `phone` bigint(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `food`
--

INSERT INTO `food` (`id`, `full_name`, `phone`, `address`) VALUES
(5, 'khaled', 336366363, 'sousse'),
(6, 'iheb', 5555666677, 'sfax'),
(19, 'ahlem', 102030405, 'gabes');

-- --------------------------------------------------------

--
-- Structure de la table `hall`
--

CREATE TABLE `hall` (
  `id` int(11) NOT NULL,
  `hallyype` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `hall`
--

INSERT INTO `hall` (`id`, `hallyype`, `price`, `status`) VALUES
(1, 'marriage', 10000, 'un book');

-- --------------------------------------------------------

--
-- Structure de la table `hall_details`
--

CREATE TABLE `hall_details` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `members` int(11) NOT NULL,
  `function` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nonac`
--

CREATE TABLE `nonac` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `nonac`
--

INSERT INTO `nonac` (`id`, `roomno`, `roomtype`, `price`, `status`) VALUES
(9, 523, 'nonAC', 700, 'un book');

-- --------------------------------------------------------

--
-- Structure de la table `registered_users`
--

CREATE TABLE `registered_users` (
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `resettoken` varchar(255) DEFAULT NULL,
  `resettokenexpire` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `registered_users`
--

INSERT INTO `registered_users` (`name`, `username`, `email`, `password`, `resettoken`, `resettokenexpire`) VALUES
('iheb', 'nguili', 'iheb@gmail.com', '$2y$10$.Nl1KJZP0Af.r.KZKx/BL..C4SdfOVSrqAUZ/MuGnOb2SiPU4xjxq', NULL, NULL),
('mounir', 'frij', 'mounir.frij@gmail.com', '$2y$10$vqyBMPXDJ./fhWbf.60bN.FEVfCBiEw4T9VX3GoFvXnjbVJccfddi', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `room booking`
--

CREATE TABLE `room booking` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `cin` varchar(20) NOT NULL,
  `cout` varchar(20) NOT NULL,
  `members` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `no of rooms` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `room booking`
--

INSERT INTO `room booking` (`id`, `name`, `address`, `state`, `city`, `email`, `cin`, `cout`, `members`, `roomtype`, `no of rooms`) VALUES
(7, 'iheb', 'kebili', 'clb', 'kebili', 'iheb@gmail.com', '22/11/2021', '23/11/2021', 2, 'deluxAC', 2),
(80, 'mounir', 'sfax', 'marie', 'tunis', 'mounir.frij@gmail.co', '2021-12-03', '2021-12-04', 2, 'Delux-AC', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acroom`
--
ALTER TABLE `acroom`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Index pour la table `admin_edit`
--
ALTER TABLE `admin_edit`
  ADD PRIMARY KEY (`admin_id`);

--
-- Index pour la table `card details`
--
ALTER TABLE `card details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `deluxacroom`
--
ALTER TABLE `deluxacroom`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hall_details`
--
ALTER TABLE `hall_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `nonac`
--
ALTER TABLE `nonac`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `registered_users`
--
ALTER TABLE `registered_users`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `room booking`
--
ALTER TABLE `room booking`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acroom`
--
ALTER TABLE `acroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `admin_edit`
--
ALTER TABLE `admin_edit`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `card details`
--
ALTER TABLE `card details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `deluxacroom`
--
ALTER TABLE `deluxacroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `hall`
--
ALTER TABLE `hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `hall_details`
--
ALTER TABLE `hall_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `nonac`
--
ALTER TABLE `nonac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `room booking`
--
ALTER TABLE `room booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
