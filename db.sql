-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  ven. 28 déc. 2018 à 09:59
-- Version du serveur :  5.6.38
-- Version de PHP :  7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `angular_clicker`
--

-- --------------------------------------------------------

--
-- Structure de la table `monsters`
--

CREATE TABLE `monsters` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `hpMax` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `src` text NOT NULL,
  `id_zone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `monsters`
--

INSERT INTO `monsters` (`id`, `name`, `hpMax`, `gold`, `src`, `id_zone`) VALUES
(1, 'Billy the Bat', 10, 2, 'assets/img/monster/bat.svg', 1),
(2, 'Haunted Tree', 20, 5, 'assets/img/monster/tree.svg', 1),
(3, 'Horse Ghost', 40, 12, 'assets/img/monster/horse.svg', 1),
(4, 'Mimic', 80, 50, 'assets/img/monster/mimic.svg', 1),
(5, 'Wild Turbofish', 160, 24, 'assets/img/monster/fish.svg', 2),
(6, 'Sharky Shark', 240, 36, 'assets/img/monster/shark.svg', 2),
(7, 'Mighty Poulpy', 320, 48, 'assets/img/monster/octopus.svg', 2),
(8, 'Whale', 400, 60, 'assets/img/monster/whale.svg', 2);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `weapons`
--

CREATE TABLE `weapons` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` int(11) NOT NULL,
  `dmg` int(11) NOT NULL,
  `auto` int(11) NOT NULL,
  `src` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `weapons`
--

INSERT INTO `weapons` (`id`, `name`, `price`, `dmg`, `auto`, `src`) VALUES
(1, 'Wooden Sword', 10, 4, 0, 'assets/img/weapon/wooden_sword.svg'),
(2, 'Iron Sword', 50, 7, 0, 'assets/img/weapon/iron_sword.svg'),
(3, 'Golden Sword', 100, 10, 0, 'assets/img/weapon/golden_sword.svg'),
(4, 'Enchanted Sword', 150, 13, 5, 'assets/img/weapon/magic_sword.svg'),
(5, 'Fire Spell', 200, 0, 10, 'assets/img/weapon/fire.svg'),
(6, 'Light Spell', 300, 0, 15, 'assets/img/weapon/light.svg'),
(7, 'Water Spell', 200, 0, 10, 'assets/img/weapon/water.svg');

-- --------------------------------------------------------

--
-- Structure de la table `zones`
--

CREATE TABLE `zones` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `bg` text NOT NULL,
  `limiter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `zones`
--

INSERT INTO `zones` (`id`, `name`, `bg`, `limiter`) VALUES
(1, 'dark', 'assets/img/bg/black.svg', 76),
(2, 'water', 'assets/img/bg/water.svg', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `monsters`
--
ALTER TABLE `monsters`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `monsters`
--
ALTER TABLE `monsters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `weapons`
--
ALTER TABLE `weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
