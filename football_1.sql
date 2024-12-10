-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 10 2024 г., 13:07
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `football_1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `club`
--

CREATE TABLE `club` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `league_name` varchar(100) NOT NULL,
  `club_age` varchar(100) NOT NULL,
  `trainer_id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `rating` float NOT NULL,
  `capitan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `club`
--

INSERT INTO `club` (`id`, `name`, `league_name`, `club_age`, `trainer_id`, `owner_id`, `rating`, `capitan`) VALUES
(3, 'Everton', 'Premier League', '190', 3, 3, 3.89, 'Vitaliy Mykolenko'),
(4, 'Liverpool', 'Premier League', '189', 4, 4, 4.68, 'Virgil van Dijk'),
(5, 'Manchester City', 'Premier League', '130', 5, 5, 4.79, 'Rodrigo Hernández Cascante'),
(6, 'Real Madrid CF', 'La Liga', '147', 7, 6, 4.75, 'Nacho Fernández'),
(7, 'FC Barcelona', 'La Liga', '170', 6, 7, 4.53, 'Ronald Araújo');

-- --------------------------------------------------------

--
-- Структура таблицы `league`
--

CREATE TABLE `league` (
  `Quantity_of_teams` bigint(20) UNSIGNED NOT NULL,
  `League_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `league`
--

INSERT INTO `league` (`Quantity_of_teams`, `League_Name`) VALUES
(18, 'La Liga'),
(20, 'Premier League');

-- --------------------------------------------------------

--
-- Структура таблицы `owner`
--

CREATE TABLE `owner` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `fund` float NOT NULL,
  `club_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `owner`
--

INSERT INTO `owner` (`id`, `name`, `fund`, `club_id`) VALUES
(1, 'Avram Glazer/Joel Glazer', 4.2, 2),
(2, 'Todd Boehly', 6.1, 1),
(3, 'Bill Kenwright', 3.7, 3),
(4, 'Fenway Sports Group', 8.7, 4),
(5, 'Khaldoon Al Mubarak', 83, 5),
(6, 'Florentino Pérez', 2.7, 6),
(7, 'Joan Laporta', 1.7, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `player`
--

CREATE TABLE `player` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(2) NOT NULL,
  `price` float NOT NULL,
  `position` varchar(100) NOT NULL,
  `rating` float NOT NULL,
  `if_capitan` tinyint(1) NOT NULL,
  `club_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `player`
--

INSERT INTO `player` (`id`, `name`, `age`, `price`, `position`, `rating`, `if_capitan`, `club_id`) VALUES
(4, 'Vitaliy Mykolenko', 26, 25, 'LB', 4.33, 1, 3),
(5, 'Trent Aleksander-Arnold', 25, 65, 'RB/CDM', 4.55, 0, 4),
(6, 'Erling Haaland', 23, 180, 'ST', 4.8, 0, 5),
(7, 'Robert Lewandowski', 35, 30, 'ST', 4.6, 0, 7),
(8, 'Ronald Araújo', 24, 70, 'CB/RB', 4.38, 1, 7),
(9, 'Nacho Fernández', 33, 5, 'CB/LB/RB', 4.15, 1, 6),
(10, 'Vinícius Júnior', 23, 150, 'LW/ST', 4.59, 0, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `trainer`
--

CREATE TABLE `trainer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `rating` float NOT NULL,
  `club_id` int(20) UNSIGNED NOT NULL,
  `trainerType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `trainer`
--

INSERT INTO `trainer` (`id`, `name`, `rating`, `club_id`, `trainerType`) VALUES
(3, 'Sean Dyche', 4.18, 3, 'A'),
(4, 'Jurgen Klopp', 4.74, 4, 'A'),
(5, 'Pep Guardiola', 4.85, 5, 'A'),
(6, 'Xavi Hernandez', 4.15, 0, 'A'),
(7, 'Carlo Ancelotti', 4.57, 0, 'A'),
(8, 'Mitchell van der Gaag', 3.67, 2, 'B'),
(9, 'Carlos Vicens', 3.88, 0, 'B'),
(10, 'Davide Ancelotti', 3.51, 0, 'B'),
(13, 'Eric Ten Hag', 4, 2, 'A');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`id`),
  ADD KEY `league_name` (`league_name`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `trainer_id` (`trainer_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Индексы таблицы `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`League_Name`),
  ADD UNIQUE KEY `League_Name` (`League_Name`),
  ADD KEY `Quantity_of_teams` (`Quantity_of_teams`);

--
-- Индексы таблицы `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `club_id` (`club_id`);

--
-- Индексы таблицы `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_id` (`club_id`),
  ADD KEY `id` (`id`),
  ADD KEY `club_id_2` (`club_id`);

--
-- Индексы таблицы `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `club_id` (`club_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `club`
--
ALTER TABLE `club`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `owner`
--
ALTER TABLE `owner`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `player`
--
ALTER TABLE `player`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `trainer`
--
ALTER TABLE `trainer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `club_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `club_ibfk_11` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `club_ibfk_13` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `club_ibfk_14` FOREIGN KEY (`league_name`) REFERENCES `league` (`League_Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
