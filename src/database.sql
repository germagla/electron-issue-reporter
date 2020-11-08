-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2020 at 01:13 PM
-- Server version: 5.7.30
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `form_prototype`
--

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `employee_id` bigint(20) NOT NULL,
  `employee_name` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`employee_id`, `employee_name`) VALUES
(1, 'Bruce Wayne'),
(3, 'Alfred Pennyworth'),
(4, 'Master Yi'),
(5, 'Miss Fortune'),
(6, 'John Doe'),
(12, 'Bruce Banner'),
(14, 'John Cena');

-- --------------------------------------------------------

--
-- Table structure for table `Issues`
--

CREATE TABLE `Issues` (
  `issue_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `issue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Issues`
--

INSERT INTO `Issues` (`issue_id`, `employee_id`, `date`, `issue`) VALUES
(11, 0, '2020-11-06', 'Wuju Style');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `Issues`
--
ALTER TABLE `Issues`
  ADD PRIMARY KEY (`issue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `employee_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `Issues`
--
ALTER TABLE `Issues`
  MODIFY `issue_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
