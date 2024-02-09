-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2024 at 08:35 AM
-- Server version: 5.7.15
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `бюро по трудоустройству1`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE `applicants` (
  `ApplicantID` int(11) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `Qualification` varchar(255) NOT NULL,
  `Profession` varchar(255) NOT NULL,
  `AdditionalInfo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`ApplicantID`, `LastName`, `FirstName`, `MiddleName`, `Qualification`, `Profession`, `AdditionalInfo`) VALUES
(1, 'Иванов', 'Иван', 'Иванович', 'Высшее', 'Инженер-программист', 'Опыт работы 5 лет'),
(2, 'Петрова', 'Мария', 'Алексеевна', 'Среднее специальное', 'Бухгалтер', 'Владение 1С: Бухгалтерия'),
(3, 'Сидоров', 'Николай', 'Петрович', 'Высшее', 'Менеджер по продажам', 'Опыт работы в продажах более 3 лет');

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `DealID` int(11) NOT NULL,
  `ApplicantID` int(11) DEFAULT NULL,
  `VacancyID` int(11) DEFAULT NULL,
  `Commission` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`DealID`, `ApplicantID`, `VacancyID`, `Commission`) VALUES
(1, 1, 3, '2000.00'),
(2, 2, 2, '1005.00'),
(3, 3, 1, '3000.00');

-- --------------------------------------------------------

--
-- Table structure for table `employers`
--

CREATE TABLE `employers` (
  `EmployerID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Industry` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `ActivityType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employers`
--

INSERT INTO `employers` (`EmployerID`, `Name`, `Industry`, `Address`, `Phone`, `ActivityType`) VALUES
(1, 'Завтра лучше чем вчера', 'Розничная торговля', 'Улица Пушкина, дом Колотушкина', '+71234567890', 'Продажи'),
(2, 'Консалтинг Плюс', 'Консультационные услуги', 'Бульвар Мира, 21', '+70987654321', 'Консалтинг'),
(3, 'IT Солюшнс', 'Информационные технологии', 'Проспект Науки, 3', '+70223344556', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `vacancies`
--

CREATE TABLE `vacancies` (
  `VacancyID` int(11) NOT NULL,
  `EmployerID` int(11) DEFAULT NULL,
  `Profession` varchar(255) NOT NULL,
  `Description` text,
  `Salary` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vacancies`
--

INSERT INTO `vacancies` (`VacancyID`, `EmployerID`, `Profession`, `Description`, `Salary`) VALUES
(1, 1, 'Менеджер по продажам', 'Требуется менеджер с опытом работы от 1 года', '60000.00'),
(2, 2, 'Консультант', 'Требуется консультант в области финансовых услуг', '50000.00'),
(3, 3, 'Разработчик ПО', 'Требуется разработчик на языке Java с опытом работы от 3 лет', '70000.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`ApplicantID`),
  ADD UNIQUE KEY `LastName` (`LastName`,`FirstName`,`MiddleName`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`DealID`),
  ADD KEY `ApplicantID` (`ApplicantID`),
  ADD KEY `VacancyID` (`VacancyID`);

--
-- Indexes for table `employers`
--
ALTER TABLE `employers`
  ADD PRIMARY KEY (`EmployerID`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- Indexes for table `vacancies`
--
ALTER TABLE `vacancies`
  ADD PRIMARY KEY (`VacancyID`),
  ADD KEY `EmployerID` (`EmployerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `ApplicantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `DealID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `employers`
--
ALTER TABLE `employers`
  MODIFY `EmployerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vacancies`
--
ALTER TABLE `vacancies`
  MODIFY `VacancyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `applicants`
--
ALTER TABLE `applicants`
  ADD CONSTRAINT `applicants_ibfk_1` FOREIGN KEY (`ApplicantID`) REFERENCES `employers` (`EmployerID`);

--
-- Constraints for table `deals`
--
ALTER TABLE `deals`
  ADD CONSTRAINT `deals_ibfk_1` FOREIGN KEY (`ApplicantID`) REFERENCES `applicants` (`ApplicantID`),
  ADD CONSTRAINT `deals_ibfk_2` FOREIGN KEY (`VacancyID`) REFERENCES `vacancies` (`VacancyID`);

--
-- Constraints for table `vacancies`
--
ALTER TABLE `vacancies`
  ADD CONSTRAINT `vacancies_ibfk_1` FOREIGN KEY (`EmployerID`) REFERENCES `employers` (`EmployerID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
