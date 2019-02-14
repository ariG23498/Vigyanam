-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2019 at 07:11 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asset_cdn`
--
CREATE DATABASE IF NOT EXISTS `asset_cdn` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `asset_cdn`;

-- --------------------------------------------------------

--
-- Table structure for table `acdn_beautiful`
--

CREATE TABLE `acdn_beautiful` (
  `qid` varchar(10) NOT NULL,
  `qas` text NOT NULL,
  `a1as` text NOT NULL,
  `a2as` text NOT NULL,
  `a3as` text NOT NULL,
  `a4as` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acdn_bubble`
--

CREATE TABLE `acdn_bubble` (
  `qid` varchar(10) NOT NULL,
  `ev1as` text NOT NULL,
  `ev2as` text NOT NULL,
  `ev3as` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acdn_claus`
--

CREATE TABLE `acdn_claus` (
  `qid` varchar(10) NOT NULL,
  `qas` text NOT NULL,
  `a1as` text NOT NULL,
  `a2as` text NOT NULL,
  `a3as` text NOT NULL,
  `a4as` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acdn_tinder`
--

CREATE TABLE `acdn_tinder` (
  `qid` varchar(10) NOT NULL,
  `qas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acdn_beautiful`
--
ALTER TABLE `acdn_beautiful`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `acdn_bubble`
--
ALTER TABLE `acdn_bubble`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `acdn_claus`
--
ALTER TABLE `acdn_claus`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `acdn_tinder`
--
ALTER TABLE `acdn_tinder`
  ADD KEY `qid` (`qid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acdn_beautiful`
--
ALTER TABLE `acdn_beautiful`
  ADD CONSTRAINT `acdn_beautiful_ibfk_2` FOREIGN KEY (`qid`) REFERENCES `rational_thinking`.`rt_tab_uilink` (`qid`),
  ADD CONSTRAINT `acdn_beautiful_ibfk_3` FOREIGN KEY (`qid`) REFERENCES `scientific_info`.`si_tab_uilink` (`qid`),
  ADD CONSTRAINT `acdn_beautiful_ibfk_4` FOREIGN KEY (`qid`) REFERENCES `spirit_of_enquiry`.`se_tab_uilink` (`qid`);

--
-- Constraints for table `acdn_bubble`
--
ALTER TABLE `acdn_bubble`
  ADD CONSTRAINT `acdn_bubble_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `cause_effect`.`ce_tab_uilink` (`qid`);

--
-- Constraints for table `acdn_claus`
--
ALTER TABLE `acdn_claus`
  ADD CONSTRAINT `acdn_claus_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `rational_thinking`.`rt_tab_uilink` (`qid`),
  ADD CONSTRAINT `acdn_claus_ibfk_2` FOREIGN KEY (`qid`) REFERENCES `scientific_info`.`si_tab_uilink` (`qid`),
  ADD CONSTRAINT `acdn_claus_ibfk_3` FOREIGN KEY (`qid`) REFERENCES `spirit_of_enquiry`.`se_tab_uilink` (`qid`);

--
-- Constraints for table `acdn_tinder`
--
ALTER TABLE `acdn_tinder`
  ADD CONSTRAINT `acdn_tinder_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `rational_thinking`.`rt_tab_uilink` (`qid`),
  ADD CONSTRAINT `acdn_tinder_ibfk_2` FOREIGN KEY (`qid`) REFERENCES `scientific_info`.`si_tab_uilink` (`qid`),
  ADD CONSTRAINT `acdn_tinder_ibfk_3` FOREIGN KEY (`qid`) REFERENCES `spirit_of_enquiry`.`se_tab_uilink` (`qid`);
--
-- Database: `cause_effect`
--
CREATE DATABASE IF NOT EXISTS `cause_effect` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cause_effect`;

-- --------------------------------------------------------

--
-- Table structure for table `ce_tab_uilink`
--

CREATE TABLE `ce_tab_uilink` (
  `qid` varchar(10) NOT NULL,
  `ui_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ce_tab_uiscore_beautiful`
--

CREATE TABLE `ce_tab_uiscore_beautiful` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` float NOT NULL,
  `a2w` float NOT NULL,
  `a3w` float NOT NULL,
  `a4w` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ce_tab_uiscore_bubble`
--

CREATE TABLE `ce_tab_uiscore_bubble` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `ord1w` int(11) NOT NULL,
  `ord2w` int(11) NOT NULL,
  `ord3w` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ce_tab_uiscore_claus`
--

CREATE TABLE `ce_tab_uiscore_claus` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` float NOT NULL,
  `a2w` float NOT NULL,
  `a3w` float NOT NULL,
  `a4w` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ce_tab_uiscore_tinder`
--

CREATE TABLE `ce_tab_uiscore_tinder` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` tinyint(1) NOT NULL,
  `a2w` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ce_tab_uilink`
--
ALTER TABLE `ce_tab_uilink`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `ce_tab_uiscore_beautiful`
--
ALTER TABLE `ce_tab_uiscore_beautiful`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `ce_tab_uiscore_bubble`
--
ALTER TABLE `ce_tab_uiscore_bubble`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `ce_tab_uiscore_claus`
--
ALTER TABLE `ce_tab_uiscore_claus`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `ce_tab_uiscore_tinder`
--
ALTER TABLE `ce_tab_uiscore_tinder`
  ADD KEY `qid` (`qid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ce_tab_uiscore_beautiful`
--
ALTER TABLE `ce_tab_uiscore_beautiful`
  ADD CONSTRAINT `ce_tab_uiscore_beautiful_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `ce_tab_uilink` (`qid`);

--
-- Constraints for table `ce_tab_uiscore_bubble`
--
ALTER TABLE `ce_tab_uiscore_bubble`
  ADD CONSTRAINT `ce_tab_uiscore_bubble_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `ce_tab_uilink` (`qid`);

--
-- Constraints for table `ce_tab_uiscore_claus`
--
ALTER TABLE `ce_tab_uiscore_claus`
  ADD CONSTRAINT `ce_tab_uiscore_claus_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `ce_tab_uilink` (`qid`);

--
-- Constraints for table `ce_tab_uiscore_tinder`
--
ALTER TABLE `ce_tab_uiscore_tinder`
  ADD CONSTRAINT `ce_tab_uiscore_tinder_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `ce_tab_uilink` (`qid`);
--
-- Database: `rational_thinking`
--
CREATE DATABASE IF NOT EXISTS `rational_thinking` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `rational_thinking`;

-- --------------------------------------------------------

--
-- Table structure for table `rt_tab_uilink`
--

CREATE TABLE `rt_tab_uilink` (
  `qid` varchar(10) NOT NULL,
  `ui_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_tab_uiscore_beautiful`
--

CREATE TABLE `rt_tab_uiscore_beautiful` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` float NOT NULL,
  `a2w` float NOT NULL,
  `a3w` float NOT NULL,
  `a4w` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_tab_uiscore_bubble`
--

CREATE TABLE `rt_tab_uiscore_bubble` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `ord1w` int(11) NOT NULL,
  `ord2w` int(11) NOT NULL,
  `ord3w` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_tab_uiscore_claus`
--

CREATE TABLE `rt_tab_uiscore_claus` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` float NOT NULL,
  `a2w` float NOT NULL,
  `a3w` float NOT NULL,
  `a4w` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_tab_uiscore_tinder`
--

CREATE TABLE `rt_tab_uiscore_tinder` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` tinyint(1) NOT NULL,
  `a2w` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rt_tab_uilink`
--
ALTER TABLE `rt_tab_uilink`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `rt_tab_uiscore_beautiful`
--
ALTER TABLE `rt_tab_uiscore_beautiful`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `rt_tab_uiscore_bubble`
--
ALTER TABLE `rt_tab_uiscore_bubble`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `rt_tab_uiscore_claus`
--
ALTER TABLE `rt_tab_uiscore_claus`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `rt_tab_uiscore_tinder`
--
ALTER TABLE `rt_tab_uiscore_tinder`
  ADD KEY `qid` (`qid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rt_tab_uiscore_beautiful`
--
ALTER TABLE `rt_tab_uiscore_beautiful`
  ADD CONSTRAINT `rt_tab_uiscore_beautiful_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `rt_tab_uilink` (`qid`);

--
-- Constraints for table `rt_tab_uiscore_bubble`
--
ALTER TABLE `rt_tab_uiscore_bubble`
  ADD CONSTRAINT `rt_tab_uiscore_bubble_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `rt_tab_uilink` (`qid`);

--
-- Constraints for table `rt_tab_uiscore_claus`
--
ALTER TABLE `rt_tab_uiscore_claus`
  ADD CONSTRAINT `rt_tab_uiscore_claus_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `rt_tab_uilink` (`qid`);

--
-- Constraints for table `rt_tab_uiscore_tinder`
--
ALTER TABLE `rt_tab_uiscore_tinder`
  ADD CONSTRAINT `rt_tab_uiscore_tinder_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `rt_tab_uilink` (`qid`);
--
-- Database: `scientific_info`
--
CREATE DATABASE IF NOT EXISTS `scientific_info` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `scientific_info`;

-- --------------------------------------------------------

--
-- Table structure for table `si_tab_uilink`
--

CREATE TABLE `si_tab_uilink` (
  `qid` varchar(10) NOT NULL,
  `ui_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `si_tab_uiscore_beautiful`
--

CREATE TABLE `si_tab_uiscore_beautiful` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` float NOT NULL,
  `a2w` float NOT NULL,
  `a3w` float NOT NULL,
  `a4w` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `si_tab_uiscore_bubble`
--

CREATE TABLE `si_tab_uiscore_bubble` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `ord1w` int(11) NOT NULL,
  `ord2w` int(11) NOT NULL,
  `ord3w` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `si_tab_uiscore_claus`
--

CREATE TABLE `si_tab_uiscore_claus` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` float NOT NULL,
  `a2w` float NOT NULL,
  `a3w` float NOT NULL,
  `a4w` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `si_tab_uiscore_tinder`
--

CREATE TABLE `si_tab_uiscore_tinder` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` tinyint(1) NOT NULL,
  `a2w` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `si_tab_uilink`
--
ALTER TABLE `si_tab_uilink`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `si_tab_uiscore_beautiful`
--
ALTER TABLE `si_tab_uiscore_beautiful`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `si_tab_uiscore_bubble`
--
ALTER TABLE `si_tab_uiscore_bubble`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `si_tab_uiscore_claus`
--
ALTER TABLE `si_tab_uiscore_claus`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `si_tab_uiscore_tinder`
--
ALTER TABLE `si_tab_uiscore_tinder`
  ADD KEY `qid` (`qid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `si_tab_uiscore_beautiful`
--
ALTER TABLE `si_tab_uiscore_beautiful`
  ADD CONSTRAINT `si_tab_uiscore_beautiful_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `si_tab_uilink` (`qid`);

--
-- Constraints for table `si_tab_uiscore_bubble`
--
ALTER TABLE `si_tab_uiscore_bubble`
  ADD CONSTRAINT `si_tab_uiscore_bubble_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `si_tab_uilink` (`qid`);

--
-- Constraints for table `si_tab_uiscore_claus`
--
ALTER TABLE `si_tab_uiscore_claus`
  ADD CONSTRAINT `si_tab_uiscore_claus_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `si_tab_uilink` (`qid`);

--
-- Constraints for table `si_tab_uiscore_tinder`
--
ALTER TABLE `si_tab_uiscore_tinder`
  ADD CONSTRAINT `si_tab_uiscore_tinder_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `si_tab_uilink` (`qid`);
--
-- Database: `spirit_of_enquiry`
--
CREATE DATABASE IF NOT EXISTS `spirit_of_enquiry` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `spirit_of_enquiry`;

-- --------------------------------------------------------

--
-- Table structure for table `se_tab_uilink`
--

CREATE TABLE `se_tab_uilink` (
  `qid` varchar(10) NOT NULL,
  `ui_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `se_tab_uiscore_beautiful`
--

CREATE TABLE `se_tab_uiscore_beautiful` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` float NOT NULL,
  `a2w` float NOT NULL,
  `a3w` float NOT NULL,
  `a4w` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `se_tab_uiscore_bubble`
--

CREATE TABLE `se_tab_uiscore_bubble` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `ord1w` int(11) NOT NULL,
  `ord2w` int(11) NOT NULL,
  `ord3w` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `se_tab_uiscore_claus`
--

CREATE TABLE `se_tab_uiscore_claus` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` float NOT NULL,
  `a2w` float NOT NULL,
  `a3w` float NOT NULL,
  `a4w` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `se_tab_uiscore_tinder`
--

CREATE TABLE `se_tab_uiscore_tinder` (
  `qid` varchar(10) NOT NULL,
  `qaid` text NOT NULL,
  `qw` float NOT NULL,
  `a1w` tinyint(1) NOT NULL,
  `a2w` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `se_tab_uilink`
--
ALTER TABLE `se_tab_uilink`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `se_tab_uiscore_beautiful`
--
ALTER TABLE `se_tab_uiscore_beautiful`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `se_tab_uiscore_bubble`
--
ALTER TABLE `se_tab_uiscore_bubble`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `se_tab_uiscore_claus`
--
ALTER TABLE `se_tab_uiscore_claus`
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `se_tab_uiscore_tinder`
--
ALTER TABLE `se_tab_uiscore_tinder`
  ADD KEY `qid` (`qid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `se_tab_uiscore_beautiful`
--
ALTER TABLE `se_tab_uiscore_beautiful`
  ADD CONSTRAINT `se_tab_uiscore_beautiful_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `se_tab_uilink` (`qid`);

--
-- Constraints for table `se_tab_uiscore_bubble`
--
ALTER TABLE `se_tab_uiscore_bubble`
  ADD CONSTRAINT `se_tab_uiscore_bubble_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `se_tab_uilink` (`qid`);

--
-- Constraints for table `se_tab_uiscore_claus`
--
ALTER TABLE `se_tab_uiscore_claus`
  ADD CONSTRAINT `se_tab_uiscore_claus_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `se_tab_uilink` (`qid`);

--
-- Constraints for table `se_tab_uiscore_tinder`
--
ALTER TABLE `se_tab_uiscore_tinder`
  ADD CONSTRAINT `se_tab_uiscore_tinder_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `se_tab_uilink` (`qid`);
--
-- Database: `userdb`
--
CREATE DATABASE IF NOT EXISTS `userdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `userdb`;

-- --------------------------------------------------------

--
-- Table structure for table `usr_rank`
--

CREATE TABLE `usr_rank` (
  `uid` varchar(10) NOT NULL,
  `age_range_id` tinyint(11) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `si_rank` int(11) NOT NULL,
  `se_rank` int(11) NOT NULL,
  `cs_rank` int(11) NOT NULL,
  `rt_rank` int(11) NOT NULL,
  `overall_rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usr_rank`
--
ALTER TABLE `usr_rank`
  ADD PRIMARY KEY (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
