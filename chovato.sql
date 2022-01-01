-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:3306
-- Létrehozás ideje: 2021. Jan 03. 12:27
-- Kiszolgáló verziója: 5.7.32-0ubuntu0.18.04.1
-- PHP verzió: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `binjomin`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `chovato_comments`
--

CREATE TABLE `chovato_comments` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `ticket` bigint(11) UNSIGNED NOT NULL,
  `user` bigint(11) UNSIGNED NOT NULL,
  `datetime` datetime NOT NULL,
  `text` text NOT NULL,
  `closing` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `chovato_comments`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `chovato_projects`
--

CREATE TABLE `chovato_projects` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(63) NOT NULL,
  `description` text NOT NULL,
  `created` datetime NOT NULL,
  `color` varchar(11) NOT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `chovato_projects`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `chovato_tags`
--

CREATE TABLE `chovato_tags` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `project` bigint(11) UNSIGNED NOT NULL,
  `tag` varchar(63) NOT NULL,
  `color` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `chovato_tags`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `chovato_tickets`
--

CREATE TABLE `chovato_tickets` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `project` bigint(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `owner` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(127) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text NOT NULL,
  `open` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `chovato_tickets`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `chovato_ticket_tags`
--

CREATE TABLE `chovato_ticket_tags` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `ticket` bigint(11) UNSIGNED NOT NULL,
  `tag` bigint(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `chovato_ticket_tags`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `chovato_users`
--

CREATE TABLE `chovato_users` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(63) NOT NULL,
  `description` text NOT NULL,
  `password` varchar(127) NOT NULL,
  `email` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `chovato_users`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `chovato_user_rights`
--

CREATE TABLE `chovato_user_rights` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `user` bigint(11) UNSIGNED NOT NULL,
  `project_ticket` bigint(11) UNSIGNED NOT NULL,
  `type` enum('project','ticket') NOT NULL DEFAULT 'project'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `chovato_user_rights`
--

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `chovato_comments`
--
ALTER TABLE `chovato_comments`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `chovato_projects`
--
ALTER TABLE `chovato_projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `name_2` (`name`);

--
-- A tábla indexei `chovato_tags`
--
ALTER TABLE `chovato_tags`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `chovato_tickets`
--
ALTER TABLE `chovato_tickets`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `chovato_ticket_tags`
--
ALTER TABLE `chovato_ticket_tags`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `chovato_users`
--
ALTER TABLE `chovato_users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `chovato_user_rights`
--
ALTER TABLE `chovato_user_rights`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `chovato_comments`
--
ALTER TABLE `chovato_comments`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=522;
--
-- AUTO_INCREMENT a táblához `chovato_projects`
--
ALTER TABLE `chovato_projects`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT a táblához `chovato_tags`
--
ALTER TABLE `chovato_tags`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT a táblához `chovato_tickets`
--
ALTER TABLE `chovato_tickets`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT a táblához `chovato_ticket_tags`
--
ALTER TABLE `chovato_ticket_tags`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT a táblához `chovato_users`
--
ALTER TABLE `chovato_users`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT a táblához `chovato_user_rights`
--
ALTER TABLE `chovato_user_rights`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
