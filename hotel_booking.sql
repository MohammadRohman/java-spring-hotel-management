-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2024 at 09:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` bigint(20) NOT NULL,
  `address_line` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `address_line`, `city`, `country`) VALUES
(1, 'Acısu Sokağı No:19, 34357', 'Istanbul', 'Turkey'),
(2, 'Çırağan Cd. No:28, 34349 Beşiktaş', 'Istanbul', 'Turkey'),
(3, 'Çırağan Cd. No:32, 34349 Beşiktaş', 'Istanbul', 'Turkey'),
(4, 'Unter den Linden 77', 'Berlin', 'Germany'),
(5, 'Potsdamer Platz 3, Mitte, 10785', 'Berlin', 'Germany'),
(6, 'Budapester Str. 2, Mitte, 10787', 'Berlin', 'Germany');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `availability`
--

CREATE TABLE `availability` (
  `id` bigint(20) NOT NULL,
  `available_rooms` int(11) NOT NULL,
  `date` date NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `availability`
--

INSERT INTO `availability` (`id`, `available_rooms`, `date`, `hotel_id`, `room_id`) VALUES
(1, 5, '2023-09-01', 4, 7),
(2, 7, '2023-09-02', 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `booked_room`
--

CREATE TABLE `booked_room` (
  `id` bigint(20) NOT NULL,
  `count` int(11) NOT NULL,
  `room_type` enum('DOUBLE','SINGLE') NOT NULL,
  `booking_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` bigint(20) NOT NULL,
  `booking_date` datetime(6) DEFAULT NULL,
  `checkin_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  `confirmation_number` varchar(255) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `user_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `hotel_manager_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`id`, `name`, `address_id`, `hotel_manager_id`) VALUES
(1, 'Swissotel The Bosphorus Istanbul', 1, 1),
(2, 'Four Seasons Hotel Istanbul', 2, 1),
(3, 'Ciragan Palace Kempinski Istanbul', 3, 1),
(4, 'Hotel Adlon Kempinski Berlin', 4, 2),
(5, 'The Ritz-Carlton Berlin', 5, 2),
(6, 'InterContinental Berlin', 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_manager`
--

CREATE TABLE `hotel_manager` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_manager`
--

INSERT INTO `hotel_manager` (`id`, `user_id`) VALUES
(1, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` bigint(20) NOT NULL,
  `currency` enum('EUR','TRY','USD') NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_method` enum('CREDIT_CARD','DEBIT_CARD','PAYPAL') NOT NULL,
  `payment_status` enum('COMPLETED','FAILED','PENDING','REFUNDED') NOT NULL,
  `total_price` decimal(38,2) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `booking_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `role_type` enum('ADMIN','CUSTOMER','HOTEL_MANAGER') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role_type`) VALUES
(1, 'ADMIN'),
(2, 'CUSTOMER'),
(3, 'HOTEL_MANAGER');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` bigint(20) NOT NULL,
  `price_per_night` double NOT NULL,
  `room_count` int(11) NOT NULL,
  `room_type` enum('DOUBLE','SINGLE') DEFAULT NULL,
  `hotel_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `price_per_night`, `room_count`, `room_type`, `hotel_id`) VALUES
(1, 370, 35, 'SINGLE', 1),
(2, 459, 45, 'DOUBLE', 1),
(3, 700, 25, 'SINGLE', 2),
(4, 890, 30, 'DOUBLE', 2),
(5, 691, 30, 'SINGLE', 3),
(6, 800, 75, 'DOUBLE', 3),
(7, 120, 25, 'SINGLE', 4),
(8, 250, 15, 'DOUBLE', 4),
(9, 300, 50, 'SINGLE', 5),
(10, 400, 50, 'DOUBLE', 5),
(11, 179, 45, 'SINGLE', 6),
(12, 256, 25, 'DOUBLE', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `created_date`, `last_name`, `name`, `password`, `username`, `role_id`) VALUES
(1, '2024-06-02 20:03:28.000000', 'Admin', 'Admin', '$2a$10$0wiLcgdR28MiVFXJOtORSe4.I5KC1orJHRfgCukJKeuhfupSd9D3q', 'admin@hotel.com', 1),
(2, '2024-06-02 20:03:28.000000', 'Koker', 'Kaya Alp', '$2a$10$eCwK40GzyJHOPdOOTrL1K.HrcjRYIi.u/.Q4HrvYRPpmjpTt1gD5O', 'customer1@hotel.com', 2),
(3, '2024-06-02 20:03:28.000000', 'Doe', 'John', '$2a$10$qzTjGFp8RyFgt0UXLpovC.nJ8mWI.1A8qaJXn3zVFKA1RemG66XG6', 'manager1@hotel.com', 3),
(4, '2024-06-02 20:03:28.000000', 'Mustermann', 'Max', '$2a$10$li.vg73ZdWMG/wHyjK8YweE.x4zk/JHWjccN.rneib3.vR0o1sqM.', 'manager2@hotel.com', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_hawikyhwwfvbnog5byokutpff` (`user_id`);

--
-- Indexes for table `availability`
--
ALTER TABLE `availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9wrk0t8eqhhaci64arkcllk8c` (`hotel_id`),
  ADD KEY `FKp6w1yyf6rerg3ihlnpdsgidrg` (`room_id`);

--
-- Indexes for table `booked_room`
--
ALTER TABLE `booked_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbpl3is8trxr5ghidw8sik4ix1` (`booking_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_nxoscxy53bg6iswii0ku8ng5j` (`confirmation_number`),
  ADD KEY `FKlnnelfsha11xmo2ndjq66fvro` (`customer_id`),
  ADD KEY `FKhacdq9bfa3r9xdimovsnonbyi` (`hotel_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_j7ja2xvrxudhvssosd4nu1o92` (`user_id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_dcpycvarhghd0g3l6reewmsak` (`name`),
  ADD UNIQUE KEY `UK_owt8iiq4d3dff6uvmdyjbmmar` (`address_id`),
  ADD KEY `FKkcfgroubk0buae4mmn359qv87` (`hotel_manager_id`);

--
-- Indexes for table `hotel_manager`
--
ALTER TABLE `hotel_manager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_82ejf160xpaxvgstsl5t6xyay` (`user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_tacis04bqalsngo46yvxlo7yb` (`transaction_id`),
  ADD UNIQUE KEY `UK_ku02qy6369hn9uhy3n7jk9v6e` (`booking_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_8nhufvk7ufr23s4xoqglqtbdx` (`role_type`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdosq3ww4h9m2osim6o0lugng8` (`hotel_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  ADD KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `availability`
--
ALTER TABLE `availability`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booked_room`
--
ALTER TABLE `booked_room`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hotel_manager`
--
ALTER TABLE `hotel_manager`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FK8ahhk8vqegfrt6pd1p9i03aej` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `availability`
--
ALTER TABLE `availability`
  ADD CONSTRAINT `FK9wrk0t8eqhhaci64arkcllk8c` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  ADD CONSTRAINT `FKp6w1yyf6rerg3ihlnpdsgidrg` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Constraints for table `booked_room`
--
ALTER TABLE `booked_room`
  ADD CONSTRAINT `FKbpl3is8trxr5ghidw8sik4ix1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FKhacdq9bfa3r9xdimovsnonbyi` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  ADD CONSTRAINT `FKlnnelfsha11xmo2ndjq66fvro` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FKj8dlm21j202cadsbfkoem0s58` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `FK48m0ei7s6biikxbrku04slp0s` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FKkcfgroubk0buae4mmn359qv87` FOREIGN KEY (`hotel_manager_id`) REFERENCES `hotel_manager` (`id`);

--
-- Constraints for table `hotel_manager`
--
ALTER TABLE `hotel_manager`
  ADD CONSTRAINT `FK1v3ld762qbgs2y7nf1lf28eqb` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FKqewrl4xrv9eiad6eab3aoja65` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `FKdosq3ww4h9m2osim6o0lugng8` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
