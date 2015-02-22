-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 22, 2015 at 06:50 AM
-- Server version: 5.5.41
-- PHP Version: 5.3.10-1ubuntu3.16

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `DailyReport`
--

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `is_active`) VALUES
(1, 'Offshore Manager', 1),
(2, 'Offshore QA Test Engineer', 1),
(3, 'Offshore Sr. Developer', 1),
(4, 'Offshore Developer', 1),
(5, 'Offshore CQ Developer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `task_details`
--

CREATE TABLE IF NOT EXISTS `task_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `users_id` int(10) NOT NULL,
  `ATtask_id` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_spent` int(10) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `project_status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=294 ;

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
(116, 4, '123123', '2015-02-12 15:38:53', 3, 'Bill Gates', 'Education is important but playing is more important', 'In Dev'),
(118, 1, '456985', '2015-02-06 00:00:00', 4, 'Some information about the project', 'Lorem ipsum doler set emit, this information is posted via the form in the website.', 'In Dev'),
(119, 2, '789456', '2015-02-06 00:00:00', 8, 'Lorem ipsum doler set emait', 'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. Travelling inquietude she increasing off impossible the. Cottage be noisier looking to we promise on. Disposal to kindness appe', 'Complete'),
(120, 2, '951753', '2015-02-05 00:00:00', 8, 'Lorem ipsum doler set email', 'Her companions instrument set estimating sex remarkably solicitude motionless. Property men the why smallest graceful day insisted required. Inquiry justice country old placing sitting any ten age. Looking venture justice in evident in totally he do abili', 'In Dev'),
(121, 3, '951753', '2015-02-05 00:00:00', 4, 'Audrey Hepburn', 'The most important thing is to enjoy your life - to be happy - it''s all that matters.', 'In Dev'),
(122, 3, '784512', '2015-02-05 00:00:00', 4, 'Will Smith', 'Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.', 'In Dev'),
(123, 3, '784512', '2015-02-05 00:00:00', 4, 'Will Smith', 'Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.', 'In Dev'),
(124, 2, '963258', '2015-02-04 00:00:00', 4, 'William J. Clinton', 'If you live long enough, you''ll make mistakes. But if you learn from them, you''ll be a better person. It''s how you handle adversity, not how it affects you. The main thing is never quit, never quit, never quit.', 'In Dev'),
(125, 1, '456985', '2015-02-10 00:00:00', 4, 'Some information about the project', 'Lorem ipsum doler set emit, this information is posted via the form in the website.', 'In Dev'),
(126, 1, '758469', '2015-02-10 15:37:46', 8, 'Bill Clinton''s website', 'Some more information about Bill Clinton''s website', 'In QA'),
(127, 1, '985687', '2015-02-10 17:18:42', 4, 'John Doe''s project to update something', 'Lorem ipsum doler set emit, this is a test to check if the information is being added correctly or not.', 'In Dev'),
(128, 1, '985687', '2015-02-10 17:18:45', 4, 'John Doe''s project to update something', 'Lorem ipsum doler set emit, this is a test to check if the information is being added correctly or not.', 'In Dev'),
(129, 1, '789456', '2015-02-10 17:35:54', 2, 'Some information about project', 'some more information', 'In QA'),
(130, 1, 'undefined', '2015-02-10 17:39:45', 0, 'undefined', 'undefined', 'undefined'),
(131, 1, 'undefined', '2015-02-10 17:40:32', 0, 'undefined', 'undefined', 'undefined'),
(132, 1, '124578', '2015-02-11 09:13:02', 4, 'Some project name', 'Description', 'In Dev'),
(133, 1, '985632', '2015-02-11 09:32:54', 2, 'Lorem', 'Lorem', 'In Dev'),
(134, 1, '985632', '2015-02-11 09:33:52', 2, 'Lorem', 'Lorem', 'In Dev'),
(135, 1, '985687', '2015-02-11 09:34:56', 4, 'Text', 'Text', 'In Dev'),
(136, 1, '123123', '2015-02-11 09:53:47', 2, 'Test', 'test', 'test'),
(137, 1, '123123', '2015-02-11 09:54:23', 2, 'Test', 'test', 'test'),
(138, 1, '123123', '2015-02-11 09:54:25', 2, 'Test', 'test', 'test'),
(139, 1, '123123', '2015-02-11 09:54:27', 2, 'Test', 'test', 'test'),
(140, 1, '123123', '2015-02-11 09:54:30', 2, 'Test', 'test', 'test'),
(141, 1, '123123', '2015-02-11 09:54:32', 2, 'Test', 'test', 'test'),
(142, 1, '123123', '2015-02-11 09:54:35', 2, 'Test', 'test', 'test'),
(143, 1, '123123', '2015-02-11 09:54:37', 2, 'Test', 'test', 'test'),
(144, 1, '123123', '2015-02-11 09:54:39', 2, 'Test', 'test', 'test'),
(145, 3, '789456', '2015-02-11 10:22:41', 3, 'Sharefile Adobe Content Authoring', 'Content authoring for sharefile. Completed with lot of pages', 'In Dev'),
(146, 3, '968574', '2015-02-11 10:23:49', 3, 'Some more information', 'Some more information', 'In Dev'),
(147, 3, 'undefined', '2015-02-11 10:58:53', 0, 'undefined', 'undefined', 'undefined'),
(148, 3, 'undefined', '2015-02-11 10:58:57', 0, 'undefined', 'undefined', 'undefined'),
(149, 3, 'undefined', '2015-02-11 10:59:00', 0, 'undefined', 'undefined', 'undefined'),
(150, 4, 'sdf', '2015-02-11 14:07:35', 0, 'sdf', 'sdf', 'sadf'),
(151, 4, 'sdf', '2015-02-11 14:07:37', 0, 'sdf', 'sdf', 'sadf'),
(152, 4, 'sdf', '2015-02-11 14:35:17', 0, 'sdf', 'sdf', 'sdf'),
(153, 4, 'sdf', '2015-02-11 14:36:52', 0, 'sd', 'fsd', 'sdf'),
(154, 4, 'asd', '2015-02-11 14:41:18', 0, 'sdf', 'sdfs', 'sadf'),
(155, 4, '985676', '2015-02-11 16:47:31', 5, 'Some information about the project', 'Some more information about the project', 'In QA'),
(156, 4, '785478', '2015-02-11 16:47:57', 8, 'More information here', 'More information here', 'In Dev'),
(157, 4, '123123', '2015-02-12 15:30:41', 2, 'Some information', 'Some information comes here and here', 'In Dev'),
(158, 4, '987456', '2015-02-12 15:32:44', 4, 'Some more project information', 'Somo more project information', 'In Dev'),
(159, 4, '963258', '2015-02-12 15:33:07', 4, 'Project Name', 'Project Description', 'In Dev'),
(160, 4, '123123', '2015-02-12 15:38:53', 3, 'Bill Gates', 'Education is important but playing is more important', 'In Dev'),
(161, 1, '456985', '2015-02-06 00:00:00', 4, 'Some information about the project', 'Lorem ipsum doler set emit, this information is posted via the form in the website.', 'In Dev'),
(162, 2, '789456', '2015-02-06 00:00:00', 8, 'Lorem ipsum doler set emait', 'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. Travelling inquietude she increasing off impossible the. Cottage be noisier looking to we promise on. Disposal to kindness appe', 'Complete'),
(163, 2, '951753', '2015-02-05 00:00:00', 8, 'Lorem ipsum doler set email', 'Her companions instrument set estimating sex remarkably solicitude motionless. Property men the why smallest graceful day insisted required. Inquiry justice country old placing sitting any ten age. Looking venture justice in evident in totally he do abili', 'In Dev'),
(164, 3, '951753', '2015-02-05 00:00:00', 4, 'Audrey Hepburn', 'The most important thing is to enjoy your life - to be happy - it''s all that matters.', 'In Dev'),
(165, 3, '784512', '2015-02-05 00:00:00', 4, 'Will Smith', 'Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.', 'In Dev'),
(166, 3, '784512', '2015-02-05 00:00:00', 4, 'Will Smith', 'Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.', 'In Dev'),
(167, 2, '963258', '2015-02-04 00:00:00', 4, 'William J. Clinton', 'If you live long enough, you''ll make mistakes. But if you learn from them, you''ll be a better person. It''s how you handle adversity, not how it affects you. The main thing is never quit, never quit, never quit.', 'In Dev'),
(168, 1, '456985', '2015-02-10 00:00:00', 4, 'Some information about the project', 'Lorem ipsum doler set emit, this information is posted via the form in the website.', 'In Dev'),
(169, 1, '758469', '2015-02-10 15:37:46', 8, 'Bill Clinton''s website', 'Some more information about Bill Clinton''s website', 'In QA'),
(170, 1, '985687', '2015-02-10 17:18:42', 4, 'John Doe''s project to update something', 'Lorem ipsum doler set emit, this is a test to check if the information is being added correctly or not.', 'In Dev'),
(171, 1, '985687', '2015-02-10 17:18:45', 4, 'John Doe''s project to update something', 'Lorem ipsum doler set emit, this is a test to check if the information is being added correctly or not.', 'In Dev'),
(172, 1, '789456', '2015-02-10 17:35:54', 2, 'Some information about project', 'some more information', 'In QA'),
(173, 1, 'undefined', '2015-02-10 17:39:45', 0, 'undefined', 'undefined', 'undefined'),
(174, 1, 'undefined', '2015-02-10 17:40:32', 0, 'undefined', 'undefined', 'undefined'),
(175, 1, '124578', '2015-02-11 09:13:02', 4, 'Some project name', 'Description', 'In Dev'),
(176, 1, '985632', '2015-02-11 09:32:54', 2, 'Lorem', 'Lorem', 'In Dev'),
(177, 1, '985632', '2015-02-11 09:33:52', 2, 'Lorem', 'Lorem', 'In Dev'),
(178, 1, '985687', '2015-02-11 09:34:56', 4, 'Text', 'Text', 'In Dev'),
(179, 1, '123123', '2015-02-11 09:53:47', 2, 'Test', 'test', 'test'),
(180, 1, '123123', '2015-02-11 09:54:23', 2, 'Test', 'test', 'test'),
(181, 1, '123123', '2015-02-11 09:54:25', 2, 'Test', 'test', 'test'),
(182, 1, '123123', '2015-02-11 09:54:27', 2, 'Test', 'test', 'test'),
(183, 1, '123123', '2015-02-11 09:54:30', 2, 'Test', 'test', 'test'),
(184, 1, '123123', '2015-02-11 09:54:32', 2, 'Test', 'test', 'test'),
(185, 1, '123123', '2015-02-11 09:54:35', 2, 'Test', 'test', 'test'),
(186, 1, '123123', '2015-02-11 09:54:37', 2, 'Test', 'test', 'test'),
(187, 1, '123123', '2015-02-11 09:54:39', 2, 'Test', 'test', 'test'),
(188, 3, '789456', '2015-02-11 10:22:41', 3, 'Sharefile Adobe Content Authoring', 'Content authoring for sharefile. Completed with lot of pages', 'In Dev'),
(189, 3, '968574', '2015-02-11 10:23:49', 3, 'Some more information', 'Some more information', 'In Dev'),
(190, 3, 'undefined', '2015-02-11 10:58:53', 0, 'undefined', 'undefined', 'undefined'),
(191, 3, 'undefined', '2015-02-11 10:58:57', 0, 'undefined', 'undefined', 'undefined'),
(192, 3, 'undefined', '2015-02-11 10:59:00', 0, 'undefined', 'undefined', 'undefined'),
(193, 4, 'sdf', '2015-02-11 14:07:35', 0, 'sdf', 'sdf', 'sadf'),
(194, 4, 'sdf', '2015-02-11 14:07:37', 0, 'sdf', 'sdf', 'sadf'),
(195, 4, 'sdf', '2015-02-11 14:35:17', 0, 'sdf', 'sdf', 'sdf'),
(196, 4, 'sdf', '2015-02-11 14:36:52', 0, 'sd', 'fsd', 'sdf'),
(197, 4, 'asd', '2015-02-11 14:41:18', 0, 'sdf', 'sdfs', 'sadf'),
(198, 4, '985676', '2015-02-11 16:47:31', 5, 'Some information about the project', 'Some more information about the project', 'In QA'),
(199, 4, '785478', '2015-02-11 16:47:57', 8, 'More information here', 'More information here', 'In Dev'),
(200, 4, '123123', '2015-02-12 15:30:41', 2, 'Some information', 'Some information comes here and here', 'In Dev'),
(201, 4, '987456', '2015-02-12 15:32:44', 4, 'Some more project information', 'Somo more project information', 'In Dev'),
(202, 4, '963258', '2015-02-12 15:33:07', 4, 'Project Name', 'Project Description', 'In Dev'),
(203, 4, '123123', '2015-02-12 15:38:53', 3, 'Bill Gates', 'Education is important but playing is more important', 'In Dev'),
(204, 1, '456985', '2015-02-06 00:00:00', 4, 'Some information about the project', 'Lorem ipsum doler set emit, this information is posted via the form in the website.', 'In Dev'),
(205, 2, '789456', '2015-02-06 00:00:00', 8, 'Lorem ipsum doler set emait', 'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. Travelling inquietude she increasing off impossible the. Cottage be noisier looking to we promise on. Disposal to kindness appe', 'Complete'),
(206, 2, '951753', '2015-02-05 00:00:00', 8, 'Lorem ipsum doler set email', 'Her companions instrument set estimating sex remarkably solicitude motionless. Property men the why smallest graceful day insisted required. Inquiry justice country old placing sitting any ten age. Looking venture justice in evident in totally he do abili', 'In Dev'),
(207, 3, '951753', '2015-02-05 00:00:00', 4, 'Audrey Hepburn', 'The most important thing is to enjoy your life - to be happy - it''s all that matters.', 'In Dev'),
(208, 3, '784512', '2015-02-05 00:00:00', 4, 'Will Smith', 'Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.', 'In Dev'),
(209, 3, '784512', '2015-02-05 00:00:00', 4, 'Will Smith', 'Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.', 'In Dev'),
(210, 2, '963258', '2015-02-04 00:00:00', 4, 'William J. Clinton', 'If you live long enough, you''ll make mistakes. But if you learn from them, you''ll be a better person. It''s how you handle adversity, not how it affects you. The main thing is never quit, never quit, never quit.', 'In Dev'),
(211, 1, '456985', '2015-02-10 00:00:00', 4, 'Some information about the project', 'Lorem ipsum doler set emit, this information is posted via the form in the website.', 'In Dev'),
(212, 1, '758469', '2015-02-10 15:37:46', 8, 'Bill Clinton''s website', 'Some more information about Bill Clinton''s website', 'In QA'),
(213, 1, '985687', '2015-02-10 17:18:42', 4, 'John Doe''s project to update something', 'Lorem ipsum doler set emit, this is a test to check if the information is being added correctly or not.', 'In Dev'),
(214, 1, '985687', '2015-02-10 17:18:45', 4, 'John Doe''s project to update something', 'Lorem ipsum doler set emit, this is a test to check if the information is being added correctly or not.', 'In Dev'),
(215, 1, '789456', '2015-02-10 17:35:54', 2, 'Some information about project', 'some more information', 'In QA'),
(216, 1, 'undefined', '2015-02-10 17:39:45', 0, 'undefined', 'undefined', 'undefined'),
(217, 1, 'undefined', '2015-02-10 17:40:32', 0, 'undefined', 'undefined', 'undefined'),
(218, 1, '124578', '2015-02-11 09:13:02', 4, 'Some project name', 'Description', 'In Dev'),
(219, 1, '985632', '2015-02-11 09:32:54', 2, 'Lorem', 'Lorem', 'In Dev'),
(220, 1, '985632', '2015-02-11 09:33:52', 2, 'Lorem', 'Lorem', 'In Dev'),
(221, 1, '985687', '2015-02-11 09:34:56', 4, 'Text', 'Text', 'In Dev'),
(222, 1, '123123', '2015-02-11 09:53:47', 2, 'Test', 'test', 'test'),
(223, 1, '123123', '2015-02-11 09:54:23', 2, 'Test', 'test', 'test'),
(224, 1, '123123', '2015-02-11 09:54:25', 2, 'Test', 'test', 'test'),
(225, 1, '123123', '2015-02-11 09:54:27', 2, 'Test', 'test', 'test'),
(226, 1, '123123', '2015-02-11 09:54:30', 2, 'Test', 'test', 'test'),
(227, 1, '123123', '2015-02-11 09:54:32', 2, 'Test', 'test', 'test'),
(228, 1, '123123', '2015-02-11 09:54:35', 2, 'Test', 'test', 'test'),
(229, 1, '123123', '2015-02-11 09:54:37', 2, 'Test', 'test', 'test'),
(230, 1, '123123', '2015-02-11 09:54:39', 2, 'Test', 'test', 'test'),
(231, 3, '789456', '2015-02-11 10:22:41', 3, 'Sharefile Adobe Content Authoring', 'Content authoring for sharefile. Completed with lot of pages', 'In Dev'),
(232, 3, '968574', '2015-02-11 10:23:49', 3, 'Some more information', 'Some more information', 'In Dev'),
(233, 3, 'undefined', '2015-02-11 10:58:53', 0, 'undefined', 'undefined', 'undefined'),
(234, 3, 'undefined', '2015-02-11 10:58:57', 0, 'undefined', 'undefined', 'undefined'),
(235, 3, 'undefined', '2015-02-11 10:59:00', 0, 'undefined', 'undefined', 'undefined'),
(236, 4, 'sdf', '2015-02-11 14:07:35', 0, 'sdf', 'sdf', 'sadf'),
(237, 4, 'sdf', '2015-02-11 14:07:37', 0, 'sdf', 'sdf', 'sadf'),
(238, 4, 'sdf', '2015-02-11 14:35:17', 0, 'sdf', 'sdf', 'sdf'),
(239, 4, 'sdf', '2015-02-11 14:36:52', 0, 'sd', 'fsd', 'sdf'),
(240, 4, 'asd', '2015-02-11 14:41:18', 0, 'sdf', 'sdfs', 'sadf'),
(241, 4, '985676', '2015-02-11 16:47:31', 5, 'Some information about the project', 'Some more information about the project', 'In QA'),
(242, 4, '785478', '2015-02-11 16:47:57', 8, 'More information here', 'More information here', 'In Dev'),
(243, 4, '123123', '2015-02-12 15:30:41', 2, 'Some information', 'Some information comes here and here', 'In Dev'),
(244, 4, '987456', '2015-02-12 15:32:44', 4, 'Some more project information', 'Somo more project information', 'In Dev'),
(245, 4, '963258', '2015-02-12 15:33:07', 4, 'Project Name', 'Project Description', 'In Dev'),
(246, 4, '123123', '2015-02-12 15:38:53', 3, 'Bill Gates', 'Education is important but playing is more important', 'In Dev'),
(247, 1, '456985', '2015-02-06 00:00:00', 4, 'Some information about the project', 'Lorem ipsum doler set emit, this information is posted via the form in the website.', 'In Dev'),
(248, 2, '789456', '2015-02-06 00:00:00', 8, 'Lorem ipsum doler set emait', 'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. Travelling inquietude she increasing off impossible the. Cottage be noisier looking to we promise on. Disposal to kindness appe', 'Complete'),
(249, 2, '951753', '2015-02-05 00:00:00', 8, 'Lorem ipsum doler set email', 'Her companions instrument set estimating sex remarkably solicitude motionless. Property men the why smallest graceful day insisted required. Inquiry justice country old placing sitting any ten age. Looking venture justice in evident in totally he do abili', 'In Dev'),
(250, 3, '951753', '2015-02-05 00:00:00', 4, 'Audrey Hepburn', 'The most important thing is to enjoy your life - to be happy - it''s all that matters.', 'In Dev'),
(251, 3, '784512', '2015-02-05 00:00:00', 4, 'Will Smith', 'Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.', 'In Dev'),
(252, 3, '784512', '2015-02-05 00:00:00', 4, 'Will Smith', 'Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.', 'In Dev'),
(253, 2, '963258', '2015-02-04 00:00:00', 4, 'William J. Clinton', 'If you live long enough, you''ll make mistakes. But if you learn from them, you''ll be a better person. It''s how you handle adversity, not how it affects you. The main thing is never quit, never quit, never quit.', 'In Dev'),
(254, 1, '456985', '2015-02-10 00:00:00', 4, 'Some information about the project', 'Lorem ipsum doler set emit, this information is posted via the form in the website.', 'In Dev'),
(255, 1, '758469', '2015-02-10 15:37:46', 8, 'Bill Clinton''s website', 'Some more information about Bill Clinton''s website', 'In QA'),
(256, 1, '985687', '2015-02-10 17:18:42', 4, 'John Doe''s project to update something', 'Lorem ipsum doler set emit, this is a test to check if the information is being added correctly or not.', 'In Dev'),
(257, 1, '985687', '2015-02-10 17:18:45', 4, 'John Doe''s project to update something', 'Lorem ipsum doler set emit, this is a test to check if the information is being added correctly or not.', 'In Dev'),
(258, 1, '789456', '2015-02-10 17:35:54', 2, 'Some information about project', 'some more information', 'In QA'),
(259, 1, 'undefined', '2015-02-10 17:39:45', 0, 'undefined', 'undefined', 'undefined'),
(260, 1, 'undefined', '2015-02-10 17:40:32', 0, 'undefined', 'undefined', 'undefined'),
(261, 1, '124578', '2015-02-11 09:13:02', 4, 'Some project name', 'Description', 'In Dev'),
(262, 1, '985632', '2015-02-11 09:32:54', 2, 'Lorem', 'Lorem', 'In Dev'),
(263, 1, '985632', '2015-02-11 09:33:52', 2, 'Lorem', 'Lorem', 'In Dev'),
(264, 1, '985687', '2015-02-11 09:34:56', 4, 'Text', 'Text', 'In Dev'),
(265, 1, '123123', '2015-02-11 09:53:47', 2, 'Test', 'test', 'test'),
(266, 1, '123123', '2015-02-11 09:54:23', 2, 'Test', 'test', 'test'),
(267, 1, '123123', '2015-02-11 09:54:25', 2, 'Test', 'test', 'test'),
(268, 1, '123123', '2015-02-11 09:54:27', 2, 'Test', 'test', 'test'),
(269, 1, '123123', '2015-02-11 09:54:30', 2, 'Test', 'test', 'test'),
(270, 1, '123123', '2015-02-11 09:54:32', 2, 'Test', 'test', 'test'),
(271, 1, '123123', '2015-02-11 09:54:35', 2, 'Test', 'test', 'test'),
(272, 1, '123123', '2015-02-11 09:54:37', 2, 'Test', 'test', 'test'),
(273, 1, '123123', '2015-02-11 09:54:39', 2, 'Test', 'test', 'test'),
(274, 3, '789456', '2015-02-11 10:22:41', 3, 'Sharefile Adobe Content Authoring', 'Content authoring for sharefile. Completed with lot of pages', 'In Dev'),
(275, 3, '968574', '2015-02-11 10:23:49', 3, 'Some more information', 'Some more information', 'In Dev'),
(276, 3, 'undefined', '2015-02-11 10:58:53', 0, 'undefined', 'undefined', 'undefined'),
(277, 3, 'undefined', '2015-02-11 10:58:57', 0, 'undefined', 'undefined', 'undefined'),
(278, 3, 'undefined', '2015-02-11 10:59:00', 0, 'undefined', 'undefined', 'undefined'),
(279, 4, 'sdf', '2015-02-11 14:07:35', 0, 'sdf', 'sdf', 'sadf'),
(280, 4, 'sdf', '2015-02-11 14:07:37', 0, 'sdf', 'sdf', 'sadf'),
(281, 4, 'sdf', '2015-02-11 14:35:17', 0, 'sdf', 'sdf', 'sdf'),
(282, 4, 'sdf', '2015-02-11 14:36:52', 0, 'sd', 'fsd', 'sdf'),
(283, 4, 'asd', '2015-02-11 14:41:18', 0, 'sdf', 'sdfs', 'sadf'),
(284, 4, '985676', '2015-02-11 16:47:31', 5, 'Some information about the project', 'Some more information about the project', 'In QA'),
(285, 4, '785478', '2015-02-11 16:47:57', 8, 'More information here', 'More information here', 'In Dev'),
(286, 4, '123123', '2015-02-12 15:30:41', 2, 'Some information', 'Some information comes here and here', 'In Dev'),
(287, 4, '987456', '2015-02-12 15:32:44', 4, 'Some more project information', 'Somo more project information', 'In Dev'),
(288, 4, '963258', '2015-02-12 15:33:07', 4, 'Project Name', 'Project Description', 'In Dev'),
(289, 4, '123123', '2015-02-12 15:38:53', 3, 'Bill Gates', 'Education is important but playing is more important', 'In Dev'),
(290, 7, '123456', '2015-02-22 06:05:43', 3, 'Introduction to php', 'php is server side langulage', 'In Dev'),
(291, 6, '985625', '2015-02-22 11:34:33', 8, 'Bill Gates international', 'India v/s South Africa', 'In Dev'),
(292, 2, '963258', '2015-02-22 11:35:35', 5, 'Some QA testing project', 'Some Email Testing in progress', 'In Dev'),
(293, 5, '963258', '2015-02-22 11:37:19', 8, 'CQ Component Development Activity', 'Component development for CQ Sharefile project', 'In QA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Id for user',
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL COMMENT 'User Email Address',
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role_id`) VALUES
(1, 'shantanu joshi', 'shantanu.joshi@cognizant.com', 'password', 1),
(2, 'amol barve', 'amol.barve@cognizant.com', 'password', 2),
(3, 'rajani dhokte', 'rajani.dhokte@cognizant.com', 'password', 2),
(4, 'mayur dawda', 'mayur.dawda@cognizant.com', 'password', 3),
(5, 'suresh gupta', 'suresh.gupta@cognizant.com', 'password', 5),
(6, 'pranav shah', 'pranav.shah@cognizant.com', 'password', 4),
(7, 'idrish laxmidhar', 'idrish.laxmidhar@cognizant.com', 'password', 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
