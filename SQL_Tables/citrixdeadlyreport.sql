-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 12, 2015 at 11:56 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `citrixdeadlyreport`
--
CREATE DATABASE IF NOT EXISTS `citrixdeadlyreport` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `citrixdeadlyreport`;

-- --------------------------------------------------------

--
-- Table structure for table `task_details`
--

CREATE TABLE IF NOT EXISTS `task_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `users_id` int(10) NOT NULL,
  `ATtask_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_spent` int(10) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `project_status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=118 ;

--
-- Dumping data for table `task_details`
--

INSERT INTO `task_details` (`id`, `users_id`, `ATtask_id`, `date`, `time_spent`, `project_name`, `description`, `project_status`) VALUES
(2, 1, '456985', '2015-02-06 00:00:00', 4, 'Some information about the project', 'Lorem ipsum doler set emit, this information is posted via the form in the website.', 'In Dev'),
(3, 2, '789456', '2015-02-06 00:00:00', 8, 'Lorem ipsum doler set emait', 'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. Travelling inquietude she increasing off impossible the. Cottage be noisier looking to we promise on. Disposal to kindness appe', 'Complete'),
(4, 2, '951753', '2015-02-05 00:00:00', 8, 'Lorem ipsum doler set email', 'Her companions instrument set estimating sex remarkably solicitude motionless. Property men the why smallest graceful day insisted required. Inquiry justice country old placing sitting any ten age. Looking venture justice in evident in totally he do abili', 'In Dev'),
(5, 3, '951753', '2015-02-05 00:00:00', 4, 'Audrey Hepburn', 'The most important thing is to enjoy your life - to be happy - it''s all that matters.', 'In Dev'),
(6, 3, '784512', '2015-02-05 00:00:00', 4, 'Will Smith', 'Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.', 'In Dev'),
(7, 3, '784512', '2015-02-05 00:00:00', 4, 'Will Smith', 'Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.', 'In Dev'),
(9, 2, '963258', '2015-02-04 00:00:00', 4, 'William J. Clinton', 'If you live long enough, you''ll make mistakes. But if you learn from them, you''ll be a better person. It''s how you handle adversity, not how it affects you. The main thing is never quit, never quit, never quit.', 'In Dev'),
(11, 1, '456985', '2015-02-10 00:00:00', 4, 'Some information about the project', 'Lorem ipsum doler set emit, this information is posted via the form in the website.', 'In Dev'),
(13, 1, '758469', '2015-02-10 15:37:46', 8, 'Bill Clinton''s website', 'Some more information about Bill Clinton''s website', 'In QA'),
(14, 1, '985687', '2015-02-10 17:18:42', 4, 'John Doe''s project to update something', 'Lorem ipsum doler set emit, this is a test to check if the information is being added correctly or not.', 'In Dev'),
(15, 1, '985687', '2015-02-10 17:18:45', 4, 'John Doe''s project to update something', 'Lorem ipsum doler set emit, this is a test to check if the information is being added correctly or not.', 'In Dev'),
(16, 1, '789456', '2015-02-10 17:35:54', 2, 'Some information about project', 'some more information', 'In QA'),
(17, 1, 'undefined', '2015-02-10 17:39:45', 0, 'undefined', 'undefined', 'undefined'),
(18, 1, 'undefined', '2015-02-10 17:40:32', 0, 'undefined', 'undefined', 'undefined'),
(19, 1, '124578', '2015-02-11 09:13:02', 4, 'Some project name', 'Description', 'In Dev'),
(20, 1, '985632', '2015-02-11 09:32:54', 2, 'Lorem', 'Lorem', 'In Dev'),
(21, 1, '985632', '2015-02-11 09:33:52', 2, 'Lorem', 'Lorem', 'In Dev'),
(22, 1, '985687', '2015-02-11 09:34:56', 4, 'Text', 'Text', 'In Dev'),
(23, 1, '123123', '2015-02-11 09:53:47', 2, 'Test', 'test', 'test'),
(24, 1, '123123', '2015-02-11 09:54:23', 2, 'Test', 'test', 'test'),
(25, 1, '123123', '2015-02-11 09:54:25', 2, 'Test', 'test', 'test'),
(26, 1, '123123', '2015-02-11 09:54:27', 2, 'Test', 'test', 'test'),
(27, 1, '123123', '2015-02-11 09:54:30', 2, 'Test', 'test', 'test'),
(28, 1, '123123', '2015-02-11 09:54:32', 2, 'Test', 'test', 'test'),
(29, 1, '123123', '2015-02-11 09:54:35', 2, 'Test', 'test', 'test'),
(30, 1, '123123', '2015-02-11 09:54:37', 2, 'Test', 'test', 'test'),
(31, 1, '123123', '2015-02-11 09:54:39', 2, 'Test', 'test', 'test'),
(32, 3, '789456', '2015-02-11 10:22:41', 3, 'Sharefile Adobe Content Authoring', 'Content authoring for sharefile. Completed with lot of pages', 'In Dev'),
(33, 3, '968574', '2015-02-11 10:23:49', 3, 'Some more information', 'Some more information', 'In Dev'),
(34, 3, 'undefined', '2015-02-11 10:58:53', 0, 'undefined', 'undefined', 'undefined'),
(35, 3, 'undefined', '2015-02-11 10:58:57', 0, 'undefined', 'undefined', 'undefined'),
(36, 3, 'undefined', '2015-02-11 10:59:00', 0, 'undefined', 'undefined', 'undefined'),
(63, 4, 'sdf', '2015-02-11 14:07:35', 0, 'sdf', 'sdf', 'sadf'),
(66, 4, 'sdf', '2015-02-11 14:07:37', 0, 'sdf', 'sdf', 'sadf'),
(86, 4, 'sdf', '2015-02-11 14:35:17', 0, 'sdf', 'sdf', 'sdf'),
(88, 4, 'sdf', '2015-02-11 14:36:52', 0, 'sd', 'fsd', 'sdf'),
(91, 4, 'asd', '2015-02-11 14:41:18', 0, 'sdf', 'sdfs', 'sadf'),
(98, 4, '985676', '2015-02-11 16:47:31', 5, 'Some information about the project', 'Some more information about the project', 'In QA'),
(99, 4, '785478', '2015-02-11 16:47:57', 8, 'More information here', 'More information here', 'In Dev'),
(112, 4, '123123', '2015-02-12 15:30:41', 2, 'Some information', 'Some information comes here and here', 'In Dev'),
(114, 4, '987456', '2015-02-12 15:32:44', 4, 'Some more project information', 'Somo more project information', 'In Dev'),
(115, 4, '963258', '2015-02-12 15:33:07', 4, 'Project Name', 'Project Description', 'In Dev'),
(116, 4, '123123', '2015-02-12 15:38:53', 3, 'Bill Gates', 'Education is important but playing is more important', 'In Dev');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Id for user',
  `username` varchar(255) NOT NULL COMMENT 'User Email Address',
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'idrishlaxmidhar@gmail.com', 'password'),
(2, 'idrish.laxmidhar@cognizan.com', 'password'),
(3, 'idrish.laxmidhar@yahoo.com', 'password'),
(4, 'idrish.laxmidhar@aol.com', 'password');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
