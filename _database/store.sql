-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creation time: October 25 year 2023, 11:31
-- Server version: 8.0.30
-- PHP version: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
--  `categories` table structure
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pic` varchar(111) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `details` varchar(333) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- `categories` table data dump
--

INSERT INTO `categories` (`id`, `name`, `pic`, `details`, `date`) VALUES
(1, 'Capsules', 'cap.png', 'Hospital capsules are located here', '2017-11-03 04:58:57'),
(2, 'Tablets', 'tablet.png', 'Hospital tablets are located here', '2017-11-03 04:58:57'),
(3, 'Syrups', 'syrup.png', 'Hospital syrups are located here', '2017-11-03 04:59:24'),
(4, 'Ointment', 'cream.png', 'Hospital ointment are located here', '2017-11-03 04:59:24'),
(5, 'Lotions', 'lotion.png', 'Hospital lotions are located here', '2017-11-03 04:59:59'),
(6, 'Vaccines', 'syrunj.png', 'Hospital vaccines are located here', '2017-11-03 04:59:59'),
(7, 'Injections', 'injection.jpg', 'Hospital injections are located here', '2017-11-03 05:00:19'),
(8, 'Others', 'fk.jpg', 'Other hospital medicine are located here', '2017-11-03 05:00:19');

-- --------------------------------------------------------

--
-- `inventeries` table structure
--

CREATE TABLE `inventeries` (
  `id` int NOT NULL,
  `catId` int NOT NULL,
  `supplier` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `pic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company` varchar(111) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- `inventeries` table data dump
--

INSERT INTO `inventeries` (`id`, `catId`, `supplier`, `name`, `unit`, `price`, `quantity`, `pic`, `description`, `company`, `date`) VALUES
(26, 2, 'QUINOIN PRIVATE CO. LTD', 'No-shpa', '80', '80', 997, '', 'Drotaverin, which is the active substance of the drug, relieves spasm of the smooth muscles of the gastrointestinal, biliary, genitourinary, and vascular systems. Increases blood circulation in tissues due to its ability to expand blood vessels. Effectively acts on smooth muscles of both nervous and muscular origin.', 'hospital number 8', '2021-03-09 05:06:25'),
(27, 4, 'PRAT FARMATS. VIOLA FACTORY', '\nLevomekol', '60', '60', 226, '', 'Levomekol is a drug that promotes healing (scarring) of wounds. It is used for the treatment of purulent wounds (infected with mixed microbial flora) in the first phase of the wound process, trophic ulcers, bedsores, infected burns, boils, carbuncles.', 'hospital number 2', '2021-03-09 05:07:01'),
(28, 5, 'EMAMI LIMITED', 'Boro-Plus', '25', '25', 124123, NULL, 'This herbal body wash was developed by experts from Australia and India. It is known to help address and prevent dry skin issues such as flaking and loss of elasticity. The formula behind the gel combines the proven properties of aloe vera, coconut extract and Boroplus, which is famous for its moisturizing and soothing properties.', 'hospital number 15', '2023-05-11 22:47:52'),
(29, 4, 'PRAT FARMATS. VIOLA FACTORY', 'Fastum gel', '40 ', '40', 14524, NULL, '\nKetoprofen, contained in the appropriate filler, reaches the inflammation zone through the skin and thus provides the possibility of local treatment of joint, tendon, ligament and muscle lesions accompanied by pain syndrome.', 'hospital number 3', '2023-05-11 23:14:47');

-- --------------------------------------------------------

--
-- `site` table structure
--

CREATE TABLE `site` (
  `id` int NOT NULL,
  `title` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- `site` table data dump
--

INSERT INTO `site` (`id`, `title`, `name`) VALUES
(1, 'Diploma Pharmacy', 'Diploma Pharmacy');

-- --------------------------------------------------------

--
-- `sold` table structure
--

CREATE TABLE `sold` (
  `id` int NOT NULL,
  `name` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discount` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userId` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- `sold` table data dump
--

INSERT INTO `sold` (`id`, `name`, `contact`, `discount`, `item`, `amount`, `userId`, `date`) VALUES
(2, 'Doctor 1', '03445584686', '10', '2', '3', 1, '2017-11-17 15:44:15'),
(3, 'Doctor 2', 'dsfgsdf', '10', '3', '25', 1, '2017-11-17 16:47:22'),
(4, 'Doctor 3', '03451212345', '21', '4', '35', 1, '2017-11-19 08:22:46'),
(5, 'Doctor 1', '0320602712', '0', '2', '13', 1, '2021-01-21 14:49:42'),
(6, 'Doctor 4', '0320602712', '0', '1', '12', 1, '2021-01-21 14:58:41'),
(7, 'Doctor 3', '79809', '0', '2', '28', 1, '2021-03-09 04:27:22'),
(8, 'Doctor 1', '0320602712', '0', '1', '7', 1, '2021-03-09 04:36:25'),
(9, 'Doctor 8', 'yh', '0', '1', '21', 1, '2021-03-09 04:44:02'),
(10, 'Doctor 7', '9', '078899', '1', '-78878', 1, '2021-03-09 04:45:53'),
(11, 'Doctor 5', 'b7688', '0', '1', '21', 1, '2021-03-09 04:47:21'),
(12, 'Doctor 3', 'bb', '0', '1', '21', 1, '2021-03-09 04:49:11'),
(13, 'Doctor 18', '0320602712', '0', '1', '216', 1, '2021-03-09 04:51:00'),
(14, 'Doctor 6', '0320602712', '0', '1', '715', 1, '2021-03-09 04:52:26'),
(15, 'Doctor 17', '0320602712', '0', '1', '11000', 1, '2021-03-09 04:52:55'),
(16, 'Doctor 6', '412414', '12', '2', '128', 1, '2023-05-12 02:07:55'),
(17, 'Doctor 3', '1241', '12', '1', '68', 1, '2023-10-25 07:22:01'),
(18, 'Doctor 3', '152515', '12', '3', '188', 1, '2023-10-25 08:17:13'),
(19, 'Doctor 3', '152515', '12', '0', '-12', 1, '2023-10-25 08:18:44');

-- --------------------------------------------------------

--
-- `users` table structure
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pic` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `number` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- `users` table data dump
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `pic`, `number`, `date`) VALUES
(1, 'admin@gmail.com', 'admin', 'Diploma User', 'fk.jpg', '+380999999', '2017-11-02 12:34:53');

--
-- Indexes of saved tables
--

--
-- Indexes of the `categories` table
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes of the `inventeries` table
--
ALTER TABLE `inventeries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes of the `site` table
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`);

--
-- Indexes of the `sold` table
--
ALTER TABLE `sold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes of the `users` table
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for the saved tables.
--

--
-- AUTO_INCREMENT for the table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for the table `inventeries`
--
ALTER TABLE `inventeries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for the table `site`
--
ALTER TABLE `site`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for the table `sold'
--
ALTER TABLE `sold`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for the table `users'
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
