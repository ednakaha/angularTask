-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: אפריל 30, 2019 בזמן 01:57 AM
-- גרסת שרת: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todolist`
--

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `persons`
--

CREATE TABLE `persons` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `nickName` varchar(50) COLLATE utf8_bin NOT NULL,
  `desc` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- הוצאת מידע עבור טבלה `persons`
--

INSERT INTO `persons` (`id`, `name`, `nickName`, `desc`) VALUES
(1, 'Person1', 'p1', 'test');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `todo`
--

CREATE TABLE `todo` (
  `id` int(11) NOT NULL,
  `desc` varchar(50) COLLATE utf8_bin NOT NULL,
  `startDate` date NOT NULL,
  `idPerson` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- הוצאת מידע עבור טבלה `todo`
--

INSERT INTO `todo` (`id`, `desc`, `startDate`, `idPerson`) VALUES
(1, 'Todo1', '2019-04-23', 1);

--
-- Indexes for dumped tables
--

--
-- אינדקסים לטבלה `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- אינדקסים לטבלה `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_person` (`idPerson`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- הגבלות לטבלאות שהוצאו
--

--
-- הגבלות לטבלה `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `id_person` FOREIGN KEY (`idPerson`) REFERENCES `persons` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
