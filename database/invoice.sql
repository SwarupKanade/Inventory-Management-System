-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2021 at 03:26 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(11) NOT NULL,
  `parent_cat` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `parent_cat`, `category_name`, `status`) VALUES
(1, 0, 'BABY SPA', '1'),
(2, 0, 'FRESH MOMENTS', '1'),
(3, 0, 'SOFWASH', '1'),
(4, 0, 'ESSENSUAL', '1'),
(5, 0, 'FRUIT OF THE EARTH', '1'),
(6, 0, 'SALON', '1'),
(7, 0, 'VELOCITY MEN’S RANGE', '1'),
(8, 0, 'FREEDOM EXTREME COMFORT SANITARY NAPKIN', '1'),
(9, 0, 'FOOD & BEVERAGE', '1'),
(10, 0, 'NUTRITION, HEALTH AND WELLNESS', '1'),
(11, 0, 'MODICARE PREMIUM PROTECTION MASK', '1'),
(12, 0, 'MODICARE ENVIROCHIP', '1'),
(13, 0, 'MODICARE PREMIUM AGARBATTI', '1'),
(14, 0, 'HOME CARE', '1'),
(15, 0, 'LAUNDRY CARE', '1'),
(16, 0, 'AUTO CARE', '1'),
(17, 0, 'SKIN CARE', '1'),
(18, 0, 'URBAN COLOR LONDON TOO GOOD TO BE MATTE LIPSTICK', '1'),
(19, 0, 'URBAN COLOR LONDON TOO GOOD TO BE CRÈME LIPSTICK - NEW', '1'),
(20, 0, 'URBAN COLOR INTENSE IMPACT LIPSTICK (TILL STOCKS LAST)', '1'),
(21, 0, 'URBAN COLOR LOVE ME MATTE LIP COLOR', '1'),
(22, 0, 'URBAN COLOR LONDON TINTED LIP BALM', '1'),
(23, 0, 'URBAN COLOR LONDON NAIL LACQUER', '1'),
(24, 0, 'URBAN COLOR LONDON GEL NAIL LACQUER', '1'),
(25, 0, 'URBAN COLOR LONDON PRO QUICK DRY NAIL LACQUER', '1'),
(26, 0, 'URBAN COLOR LONDON METAL BLAST NAIL LACQUER', '1'),
(27, 0, 'URBAN COLOR NAIL ENAMEL REMOVER', '1'),
(28, 0, 'URBAN COLOR ULTIMATE RADIANCE PRIMER', '1'),
(29, 0, 'URBAN COLOR ULTIMATE RADIANCE 3 IN 1 MAKEUP (TILL STOCKS LAST)', '1'),
(30, 0, 'URBAN COLOR ULTIMATE RADIANCE FOUNDATION', '1'),
(31, 0, 'URBAN COLOR ULTIMATE RADIANCE COMPACT', '1'),
(32, 0, 'URBAN COLOR ULTIMATE RADIANCE BLUSH', '1'),
(33, 0, 'URBAN COLOR COVER ALL MULTI-ACTION BB CREAM', '1'),
(34, 0, 'URBAN COLOR INFINITE WHITE UV FAIRNESS PRESSED POWDER WITH SPF-18', '1'),
(35, 0, 'URBAN COLOR EXPERT FIRM AND LIFT FOUNDATION', '1'),
(36, 0, 'URBAN COLOR', '1'),
(37, 0, 'URBAN COLOR EXPERT FIRM AND LIFT COMPACT', '1'),
(38, 0, 'URBAN COLOR MAKEUP MELTING WIPES', '1'),
(39, 0, 'URBAN COLOR PRO WEAR BROW PENCIL', '1'),
(40, 0, 'URBAN COLOR INTENSE STAY 10HRS KAJAL', '1'),
(41, 0, 'URBAN COLOR ULTIMATE LASH MASCARA', '1'),
(42, 0, 'URBAN COLOR HYPNOTEYES EYESHADOW QUAD', '1'),
(43, 0, 'URBAN COLOR SUPER MATTE 16HRS STAY EYE LINER', '1'),
(44, 0, 'URBAN COLOR HIGH DEFINITION EYELINER', '1'),
(45, 0, 'URBAN COLOR INTENSE COLOR EYEPENCIL', '1'),
(46, 0, 'URBAN COLOR LIPSTICK SAMPLER', '1'),
(47, 0, 'URBAN COLOR BEAUTY TOOLS', '1'),
(48, 0, 'URBAN COLOR PRO WHITE SKIN CARE', '1'),
(49, 0, 'URBAN COLOR LONDON AGE REDEFINING SKIN CARE', '1'),
(50, 0, 'URBAN COLOR LONDON GO GLOW', '1'),
(51, 0, 'URBAN COLOR LONDON SINDOOR', '1'),
(52, 0, 'AGRICULTURE', '1'),
(53, 0, '3 ALLURING COLLECTIONS', '1'),
(54, 0, 'THE MAHARANI COLLECTION', '1'),
(55, 0, 'THE DIVA COLLECTION', '1'),
(56, 0, 'THE TURKISH COLLECTION', '1'),
(57, 0, 'SM WATCHES', '1'),
(58, 0, 'TECH', '1'),
(59, 0, 'MERCHANDISE', '1'),
(60, 0, 'MODICARE DEMO KIT', '1'),
(61, 0, 'LITERATURE & SALES AIDS', '1');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_no` int(11) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_mobno` varchar(10) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_addr` varchar(80) NOT NULL,
  `order_date` date NOT NULL,
  `net_total` double NOT NULL,
  `paid` double NOT NULL,
  `due` double NOT NULL,
  `payment_type` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_no`, `customer_id`, `customer_name`, `customer_mobno`, `customer_email`, `customer_addr`, `order_date`, `net_total`, `paid`, `due`, `payment_type`) VALUES
(1, '1234', 'Sainath Deshmukh', '9325314743', 'sai@gmail.com', '123, Yerwada, Pune, Maharashtra', '2021-11-07', 14918, 14918, 0, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `product_id` varchar(6) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `dp` double NOT NULL,
  `price` double NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `invoice_no`, `product_id`, `product_name`, `dp`, `price`, `qty`) VALUES
(1, 1, 'PC2000', 'Fresh Moments Toothpaste (100g)', 62, 75, 2),
(2, 1, 'BC0002', 'Baby Spa Nourishing Soap (75g)', 59, 65, 17),
(3, 1, 'BC0003', 'Baby Spa Milk Cream (50g)', 82, 90, 16),
(4, 1, 'PC5001', 'Velocity Men After Shave Splash (100ml)', 187, 215, 10),
(5, 1, 'MJ0001', 'Hansani (Pendent 1N + Earring 2N)', 1545, 1699, 4),
(6, 1, 'UCL912', 'Red Hot Rio (6 ml)', 130, 155, 7),
(7, 1, 'UC2219', 'Olives (6 ml)', 130, 155, 4),
(8, 1, 'WAT001', 'SM Men\'s (Day & Date) Two Tone Rose Gold Watch (1 N)', 2999, 3449, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` double NOT NULL,
  `product_dp` double NOT NULL,
  `added_date` date NOT NULL,
  `p_status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `cid`, `product_id`, `product_name`, `product_price`, `product_dp`, `added_date`, `p_status`) VALUES
(1, 1, 'BC0002', 'Baby Spa Nourishing Soap (75g)', 65, 59, '2021-07-11', '1'),
(2, 1, 'BC0003', 'Baby Spa Milk Cream (50g)', 90, 82, '2021-07-11', '1'),
(3, 1, 'BC0004', 'Baby Spa Moisturising Lotion (200ml)', 161, 147, '2021-07-11', '1'),
(4, 1, 'BC0005', 'Baby Spa No-Tears Shampoo (200ml)', 175, 159, '2021-07-11', '1'),
(5, 1, 'BC0007', 'Baby Spa Diaper Rash Cream (50g)', 140, 127, '2021-07-11', '1'),
(6, 1, 'BC0008', 'Baby Spa Massage Oil (200ml)', 195, 177, '2021-07-11', '1'),
(7, 1, 'BC0009', 'Baby Spa Talc Powder (100g)', 75, 68, '2021-07-11', '1'),
(8, 1, 'BC0010', 'Baby Spa 2 in 1 Bubble Bath & Wash (200ml)', 221, 201, '2021-07-11', '1'),
(9, 1, 'BC0012', 'Baby Spa Soft Cleansing Wipes (80 N)', 225, 205, '2021-07-11', '1'),
(10, 2, 'PC2000', 'Fresh Moments Toothpaste (100g)', 75, 62, '2021-07-11', '1'),
(11, 2, 'PC2001', 'Fresh Moments Toothbrush (3 N)', 214, 184, '2021-07-11', '1'),
(12, 2, 'PC2002', 'Fresh Moments Toothbrush (4 N)', 176, 150, '2021-07-11', '1'),
(13, 2, 'PC2004', 'Fresh Moments Gel Toothpaste (100g)', 90, 75, '2021-07-11', '1'),
(14, 2, 'PC0035', 'Fresh Moments Anti-Cavity Toothpaste (100g)', 48, 40, '2021-07-11', '1'),
(15, 2, 'PC0036', 'Fresh Moments Herbal Toothpaste (100g)', 58, 48, '2021-07-11', '1'),
(16, 3, 'PC5229', 'Sofwash White Pearl Soap (4 N x 75g)', 190, 160, '2021-07-11', '1'),
(17, 3, 'PC4003', 'Sofwash Glycerin & Honey Bar (2 N x 100g)', 170, 150, '2021-07-11', '1'),
(18, 3, 'PC4011', 'Sofwash Sandal Soap (100g)', 33, 29, '2021-07-11', '1'),
(19, 3, 'PC4013', 'Sofwash Lime Soap (100g)', 33, 29, '2021-07-11', '1'),
(20, 3, 'PC4014', 'Sofwash Anti-bacterial Soap (75g)', 48, 40, '2021-07-11', '1'),
(21, 3, 'PC4010', 'Sofwash Aloe Vera, Neem, Tulsi Soap (100g)', 33, 29, '2021-07-11', '1'),
(22, 3, 'PC4012', 'Sofwash Orange Soap (100g)', 33, 29, '2021-07-11', '1'),
(23, 3, 'PC4005', 'Sofwash 3 IN 1 Hand Wash, Shower Gel & Bubble Bath - Green Apple (250ml)', 162, 142, '2021-07-11', '1'),
(24, 3, 'PC4001', 'Sofwash 3 IN 1 Hand Wash, Shower Gel & Bubble Bath - Berry Strawberry (250ml)', 162, 142, '2021-07-11', '1'),
(25, 3, 'PC4002', 'Sofwash 3 IN 1 Hand Wash, Shower Gel & Bubble Bath - Citrusy Lime (250ml)', 162, 142, '2021-07-11', '1'),
(26, 3, 'BC0011', 'Sofwash Kids 3 IN 1 Hand Wash, Shower Gel & Bubble Bath - Bubble Gum (250ml)', 275, 239, '2021-07-11', '1'),
(27, 3, 'PC4007', 'Sofwash 3 IN 1 Hand Wash, Shower Gel & Bubble Bath - Berry Strawberry Refill Pouch (500ml)', 260, 225, '2021-07-11', '1'),
(28, 3, 'PC4008', 'Sofwash 3 IN 1 Hand Wash, Shower Gel & Bubble Bath - Green Apple Refill Pouch (500ml)', 260, 225, '2021-07-11', '1'),
(29, 3, 'PC4009', 'Sofwash 3 IN 1 Hand Wash, Shower Gel & Bubble Bath - Citrusy Lime Refill Pouch (500ml)', 260, 225, '2021-07-11', '1'),
(30, 4, 'PC0001', 'Essensual Hand & Body Lotion (Allantoin & Vitamin E) (200ml)', 264, 219, '2021-07-11', '1'),
(31, 4, 'PC5243', 'Essensual Hand & Body Lotion (Allantoin & Vitamin E) (100ml)', 165, 140, '2021-07-11', '1'),
(32, 4, 'PC0002', 'Essensual Hand & Body Lotion (Glycerine & Honey) (200ml)', 264, 219, '2021-07-11', '1'),
(33, 4, 'PC5242', 'Essensual Hand & Body Lotion (Glycerine & Honey) (100ml)', 165, 140, '2021-07-11', '1'),
(34, 4, 'PC5244', 'Essensual Soft & Smooth Intensive Foot Care Cream (100ml)', 225, 190, '2021-07-11', '1'),
(35, 4, 'PC0004', 'Essensual Perfumed Deo Spray-Momentum (150ml)', 190, 163, '2021-07-11', '1'),
(36, 4, 'PC0006', 'Essensual Perfumed Deo Spray-Ocean Blue (150ml)', 190, 163, '2021-07-11', '1'),
(37, 4, 'PC0005', 'Essensual Perfumed Deo Spray-Indulge (150ml)', 190, 163, '2021-07-11', '1'),
(38, 4, 'PC0007', 'Essensual Perfumed Deo Spray-Oriental Spice (150ml)', 190, 163, '2021-07-11', '1'),
(39, 4, 'PC0003', 'Essensual Instante Tea Tree Oil with Vitamin E (15ml)', 330, 275, '2021-07-11', '1'),
(40, 4, 'PC0012', 'Essensual Perfumed Body Talc-Dreams (400g)', 193, 161, '2021-07-11', '1'),
(41, 4, 'PC0010', 'Essensual Perfumed Body Talc-Dreams (100g)', 72, 60, '2021-07-11', '1'),
(42, 4, 'PC0013', 'Essensual Perfumed Body Talc-Wild Flower (400g)', 193, 161, '2021-07-11', '1'),
(43, 4, 'PC0011', 'Essensual Perfumed Body Talc-Wild Flower (100g)', 72, 60, '2021-07-11', '1'),
(44, 4, 'PC9000', 'Essensual Body Puff - Ultra Soft & Gentle (1 N)', 88, 74, '2021-07-11', '1'),
(45, 4, 'PC0030', 'Essensual Pocket Perfume Spice Woods (18ml)', 80, 68, '2021-07-11', '1'),
(46, 4, 'PC0031', 'Essensual Pocket Perfume Wild Girl (18ml)', 80, 68, '2021-07-11', '1'),
(47, 4, 'PC0032', 'Essensual Pocket Perfume Dusky Desire (18ml)', 80, 68, '2021-07-11', '1'),
(48, 4, 'PC0029', 'Essensual Pocket Perfume Romantic Orchid (18ml)', 80, 68, '2021-07-11', '1'),
(49, 4, 'PC0039', 'All Pure Hand Sanitizer Gel (60ml)', 27, 25, '2021-07-11', '1'),
(50, 4, 'PC0041', 'All Pure Hand Sanitizer Gel (250ml)', 111, 102, '2021-07-11', '1'),
(51, 4, 'PC0042', 'All Pure Hand Sanitizer Gel (500ml)', 222, 200, '2021-07-11', '1'),
(52, 4, 'PC0044', 'All Pure Moringa Hand Sanitizer Gel (250ml)', 111, 102, '2021-07-11', '1'),
(53, 4, 'PC0045', 'All Pure Moringa Hand Sanitizer Gel (500ml)', 222, 200, '2021-07-11', '1'),
(54, 4, 'PC0054', 'All Pure Aloe Vera Hand Sanitizer Gel (250ml)', 111, 102, '2021-07-11', '1'),
(55, 4, 'PC0056', 'All Pure Aloe Vera Hand Sanitizer Gel (500ml)', 222, 200, '2021-07-11', '1'),
(56, 4, 'PC0043', 'All Pure Moringa Hand Sanitizer Spray (100ml)', 67, 61, '2021-07-11', '1'),
(57, 4, 'PC0069', 'All Pure 2 in 1 Hand & Body Lotion (100ml)', 199, 175, '2021-07-11', '1'),
(58, 4, 'PC0070', 'All Pure Germ Protection Wipes (30 N)', 125, 99, '2021-07-11', '1'),
(59, 5, 'PC1006', 'FOTE Shampoo with Henna & Jojoba Oil (Hair Fall Control) (200ml)', 195, 163, '2021-07-11', '1'),
(60, 5, 'PC1005', 'FOTE Shampoo with Arnica & Tea Tree Oil (Dandruff Control) (200ml)', 195, 163, '2021-07-11', '1'),
(61, 5, 'PC1002', 'FOTE Conditioner with Aloe vera & Almond Oil (Smooth & Shine) (150ml)', 198, 170, '2021-07-11', '1'),
(62, 5, 'PC5258', 'FOTE Shampoo with Henna & Jojoba Oil (Hair Fall Control) (100ml)', 120, 100, '2021-07-11', '1'),
(63, 5, 'PC5257', 'FOTE Shampoo with Arnica & Tea Tree Oil (Dandruff Control) (100ml)', 120, 100, '2021-07-11', '1'),
(64, 5, 'PC5259', 'FOTE Conditioner with Aloe vera & Almond Oil (Smooth & Shine) (100ml)', 140, 120, '2021-07-11', '1'),
(65, 5, 'PC0050', 'FOTE Shampoo with Henna & Jojoba Oil (Hair Fall Control) - Sachet (6 ml x 48 N)', 192, 168, '2021-07-11', '1'),
(66, 5, 'PC0051', 'FOTE Shampoo with Arnica & Tea Tree Oil (Dandruff Control) - Sachet (6 ml x 48 N)', 192, 168, '2021-07-11', '1'),
(67, 5, 'PC1014', 'FOTE Red Obsession Hydrating Mist (100ml)', 599, 520, '2021-07-11', '1'),
(68, 5, 'PC1015', 'FOTE Calming White Hydrating Mist (100ml)', 599, 520, '2021-07-11', '1'),
(69, 5, 'PC1016', 'FOTE Blooms of Eden Hydrating Mist (100ml)', 599, 520, '2021-07-11', '1'),
(70, 6, 'PC3002', 'Salon Hair Oil with Conditioner (100ml)', 115, 98, '2021-07-11', '1'),
(71, 6, 'PC3001', 'Salon Daily Shine-Nourishing Shampoo (200ml)', 219, 183, '2021-07-11', '1'),
(72, 6, 'PC3000', 'Salon Clean & Protect-Dandruff Control Shampoo (200ml)', 240, 200, '2021-07-11', '1'),
(73, 6, 'PC5247', 'Salon Professional Advanced Formula Hair Fall Defense Shampoo (200ml)', 280, 233, '2021-07-11', '1'),
(74, 6, 'PC5245', 'Salon Professional Advanced Formula Dandruff Care Shampoo (200ml)', 280, 233, '2021-07-11', '1'),
(75, 6, 'PC5246', 'Salon Professional Advanced Formula Smooth & Shine Shampoo (200ml)', 280, 233, '2021-07-11', '1'),
(76, 6, 'PC5248', 'Salon Professional Advanced Formula Radiant Shine Conditioner (200ml)', 295, 246, '2021-07-11', '1'),
(77, 6, 'PC0048', 'Salon Professional Advanced Formula Hair Fall Defense Shampoo - Sachet (6 ml x 48 N)', 192, 168, '2021-07-11', '1'),
(78, 6, 'PC0047', 'Salon Professional Advanced Formula Dandruff CareShampoo - Sachet (6 ml x 48 N)', 192, 168, '2021-07-11', '1'),
(79, 6, 'PC0049', 'Salon Professional Advanced Formula Smooth &Shine Shampoo - Sachet (6 ml x 48 N)', 192, 168, '2021-07-11', '1'),
(80, 6, 'PC0034', 'Salon Professional Amla Non-sticky Hair Oil (100ml)', 65, 55, '2021-07-11', '1'),
(81, 6, 'PC0033', 'Salon Professional Ayurvedic Cool Herbal Oil (100ml)', 90, 75, '2021-07-11', '1'),
(82, 6, 'PC5285', 'Salon Professional Argan Oil of MoroccoHair Treatment Oil (100ml)', 725, 604, '2021-07-11', '1'),
(83, 6, 'PC5284', 'Salon Professional Argan Oil of MoroccoMoisture Repair Shampoo (200ml)', 475, 396, '2021-07-11', '1'),
(84, 6, 'PC5283', 'Salon Professional Argan Oil of Morocco Moisture Repair Conditioner (200ml)', 475, 396, '2021-07-11', '1'),
(85, 6, 'PC5232', 'Salon Professional Hair Color-Natural Black (1)', 450, 415, '2021-07-11', '1'),
(86, 6, 'PC5233', 'Salon Professional Hair Color-Dark Brown (2)', 450, 415, '2021-07-11', '1'),
(87, 6, 'PC5234', 'Salon Professional Hair Color-Brown (3)', 450, 415, '2021-07-11', '1'),
(88, 6, 'PC5235', 'Salon Professional Hair Color-Chocolate (4)', 450, 415, '2021-07-11', '1'),
(89, 6, 'PC5236', 'Salon Professional Hair Color-Light Brown (5)', 450, 415, '2021-07-11', '1'),
(90, 6, 'PC5237', 'Salon Professional Hair Color-Dark Blond (6)', 450, 415, '2021-07-11', '1'),
(91, 6, 'PC5280', 'Salon Professional Advanced Formula Nourish & Shine Hair Oil (100ml)', 115, 98, '2021-07-11', '1'),
(92, 7, 'PC5011', 'Velocity Men Smooth Shave Gel (50g)', 125, 105, '2021-07-11', '1'),
(93, 7, 'PC5008', 'Velocity Men Hair Styling Gel (50g)', 90, 78, '2021-07-11', '1'),
(94, 7, 'PC5004', 'Velocity Men Energising Shower Gel (150ml)', 240, 209, '2021-07-11', '1'),
(95, 7, 'PC5007', 'Velocity Men Fortifying Shampoo (150ml)', 193, 165, '2021-07-11', '1'),
(96, 7, 'PC5001', 'Velocity Men After Shave Splash (100ml)', 215, 187, '2021-07-11', '1'),
(97, 7, 'PC5003', 'Velocity Men Deodorising Body Talc (100g)', 72, 60, '2021-07-11', '1'),
(98, 7, 'PC5010', 'Velocity Men Premium Shaving Cream (70g)', 115, 100, '2021-07-11', '1'),
(99, 7, 'PC5002', 'Velocity Men Body Spray (125ml / 88g)', 199, 170, '2021-07-11', '1'),
(100, 7, 'PC6032', 'Velocity Men Fortifying Hair Conditioner (100ml)', 176, 153, '2021-07-11', '1'),
(101, 7, 'PC5009', 'Velocity Men Oil Clear Face Wash (50g)', 129, 110, '2021-07-11', '1'),
(102, 7, 'PC5005', 'Velocity Men Fairness Cream (50g)', 140, 121, '2021-07-11', '1'),
(103, 7, 'PC6035', 'Velocity Men Cool Menthol Shampoo (150ml)', 193, 165, '2021-07-11', '1'),
(104, 7, 'PC5012', 'Velocity Men Twin Blade Plus Readyshaver (5 N)', 130, 120, '2021-07-11', '1'),
(105, 7, 'PC5014', 'Velocity Men 7 in 1 Beard Growth Oil (30ml)', 340, 296, '2021-07-11', '1'),
(106, 8, 'PC6049', 'Sanitary Napkin - Regular 245 mm (15 N)', 225, 205, '2021-07-11', '1'),
(107, 8, 'PC6050', 'Sanitary Napkin - Large 290 mm (15 N)', 245, 225, '2021-07-11', '1'),
(108, 8, 'PC6051', 'Sanitary Napkin - X-Large 320 mm (15 N)', 265, 240, '2021-07-11', '1'),
(109, 9, 'FP0003', 'Fruit of the Earth C.T.C & Long Leaf Tea (250g)', 199, 155, '2021-07-11', '1'),
(110, 9, 'FP0002', 'Fruit of the Earth Power Green Tea (2g x 25 N)', 205, 178, '2021-07-11', '1'),
(111, 9, 'FP0006', 'Fruit of the Earth Coconut Oil (500ml)', 250, 215, '2021-07-11', '1'),
(112, 9, 'FP3008', 'Fruit of the Earth 100? Pure Instant Coffee (50g)', 155, 135, '2021-07-11', '1'),
(113, 9, 'FP3009', 'Fruit of the Earth Instant Blended Coffee (50g)', 155, 135, '2021-07-11', '1'),
(114, 9, 'FP0005', 'Soul Flavours Cardamom Seeds (5g)', 55, 50, '2021-07-11', '1'),
(115, 9, 'FP3050', 'Soul Flavours Active Rice Bran Oil Pouch (1L)', 240, 220, '2021-07-11', '1'),
(116, 9, 'FP3072', 'Soul Flavours Active Rice Bran Oil (5L)', 999, 899, '2021-07-11', '1'),
(117, 9, '606000', 'Soul Flavours Active Rice Bran Oil Dispenser (1 N)', 150, 125, '2021-07-11', '1'),
(118, 9, 'FP3056', 'Soul Flavours Kachi Ghani Cold Pressed Mustard Oil (1L)', 240, 220, '2021-07-11', '1'),
(119, 9, 'FP3071', 'Soul Flavours Kachi Ghani Cold Pressed Mustard Oil (5L)', 1010, 910, '2021-07-11', '1'),
(120, 9, 'FP3007', 'Soul Flavours Penne Rigate (Pasta) (500g)', 185, 161, '2021-07-11', '1'),
(121, 9, 'FP0016', 'Soul Flavours Cow Ghee (1L)', 670, 615, '2021-07-11', '1'),
(122, 9, 'FP0010', 'Soul Flavours Pure Honey (500g)', 330, 300, '2021-07-11', '1'),
(123, 9, 'FP0011', 'Soul Flavours Pure Honey with Tulsi (500g)', 395, 359, '2021-07-11', '1'),
(124, 9, 'FP0012', 'Soul Flavours Pure Honey with Ginger (500g)', 395, 359, '2021-07-11', '1'),
(125, 9, 'FP0013', 'Soul Flavours All Natural Stevia Powder (200g)', 465, 423, '2021-07-11', '1'),
(126, 9, 'FP0026', 'Soul Flavours Shahi Mukhwas (75g)', 175, 160, '2021-07-11', '1'),
(127, 9, 'FP0008', 'Soul Flavours Amla Candy Sweet (500g)', 265, 250, '2021-07-11', '1'),
(128, 9, 'FP0009', 'Soul Flavours Chatpata Amla Candy (500g)', 265, 250, '2021-07-11', '1'),
(129, 9, 'FP0027', 'Soul Flavours Shahi Pan (75g)', 220, 200, '2021-07-11', '1'),
(130, 9, 'FP3030', 'Soul Flavours Haldi Powder (100g)', 33, 30.5, '2021-07-11', '1'),
(131, 9, 'FP3053', 'Soul Flavours Haldi Powder (200g)', 62, 57, '2021-07-11', '1'),
(132, 9, 'FP3023', 'Soul Flavours Lal Mirch Powder (100g)', 49, 47, '2021-07-11', '1'),
(133, 9, 'FP3054', 'Soul Flavours Lal Mirch Powder (200g)', 96, 92, '2021-07-11', '1'),
(134, 9, 'FP3025', 'Soul Flavours Jeera Powder (100g)', 67, 63.5, '2021-07-11', '1'),
(135, 9, 'FP3027', 'Soul Flavours Dhania Powder (100g)', 33, 30.5, '2021-07-11', '1'),
(136, 9, 'FP3055', 'Soul Flavours Dhania Powder (200g)', 62, 57, '2021-07-11', '1'),
(137, 9, 'FP3034', 'Soul Flavours Garam Masala (100g)', 72, 68.5, '2021-07-11', '1'),
(138, 9, 'FP3029', 'Soul Flavours Kali Mirch Powder (100g)', 160, 152, '2021-07-11', '1'),
(139, 9, 'FP0032', 'Soul Flavours Quinoa (500g)', 225, 200, '2021-07-11', '1'),
(140, 9, 'FP3044', 'Soul Pops Kaccha Aam (50 N)', 50, 47, '2021-07-11', '1'),
(141, 9, 'FP3051', 'Soul Pops Chatpata Orange Candy (50 N)', 50, 47, '2021-07-11', '1'),
(142, 9, 'FP3052', 'Soul Pops Gazab Guava Candy (50 N)', 50, 47, '2021-07-11', '1'),
(143, 9, 'FP3057', 'Soul Pops Masala Soda Candy (50 N)', 50, 47, '2021-07-11', '1'),
(144, 9, 'FP3058', 'Soul Pops Fruit Chaat Candy (50 N)', 50, 47, '2021-07-11', '1'),
(145, 9, 'FP0028', 'Soul Pops Strawberry & Mango Assorted Lollipops (12 N)', 108, 98, '2021-07-11', '1'),
(146, 9, 'FP0033', 'Soul Flavours Strong CTC Tea (250g)', 125, 99, '2021-07-11', '1'),
(147, 9, 'FP3064', 'Soul Flavours Sambhar Masala (100g) NEW', 68, 65, '2021-07-11', '1'),
(148, 9, 'FP3065', 'Soul Flavours Chaat Masala (100g) NEW', 68, 65, '2021-07-11', '1'),
(149, 9, 'FP3066', 'Soul Flavours Pav Bhaji Masala (100g) NEW', 70, 67, '2021-07-11', '1'),
(150, 9, 'FP3067', 'Soul Flavours Chhole Masala (100g) NEW', 80, 76, '2021-07-11', '1'),
(151, 10, 'FS5051', 'Well All Plant Protein Powder (200g)', 986, 822, '2021-07-11', '1'),
(152, 10, 'FS5052', 'Well All Plant Protein Powder (500g)', 2199, 1833, '2021-07-11', '1'),
(153, 10, 'HL2007', 'Well Pudina with Tulsi (100 N)', 375, 315, '2021-07-11', '1'),
(154, 10, 'HL2004', 'Well Flax Oil (90 N)', 630, 540, '2021-07-11', '1'),
(155, 10, 'HL2005', 'Well Garlic Pearls (100 N)', 375, 315, '2021-07-11', '1'),
(156, 10, 'HL2003', 'Well Amrit Shakti (100 N)', 410, 345, '2021-07-11', '1'),
(157, 10, 'HL2008', 'Well Spirulina (100 N)', 440, 375, '2021-07-11', '1'),
(158, 10, 'HL2006', 'Well Noni Juice Concentrate (1L)', 500, 465, '2021-07-11', '1'),
(159, 10, 'HL2009', 'Well Multivitamin Multimineral (30 N)', 410, 350, '2021-07-11', '1'),
(160, 10, 'HL2014', 'Well Calcium Complex (60 N)', 466, 395, '2021-07-11', '1'),
(161, 10, 'HL2002', 'Well D Tox (60 N)', 535, 457, '2021-07-11', '1'),
(162, 10, 'HL1001', 'Well Strong & Smart (Chocolate Flavour) (200g)', 635, 543, '2021-07-11', '1'),
(163, 10, 'HL1003', 'Well Protein Crest (Velvet Chocolate) (500g)', 1337, 1114, '2021-07-11', '1'),
(164, 10, 'HL1005', 'Well Glucosamine with Boswellia & Curcumin (120 N)', 1470, 1225, '2021-07-11', '1'),
(165, 10, 'HL1008', 'Well Korean Red Ginseng-6 Yrs. Old (60 N)', 2200, 1850, '2021-07-11', '1'),
(166, 10, 'HL2001', 'Well Cardio Activ (60 N)', 521, 435, '2021-07-11', '1'),
(167, 10, 'HL2012', 'Well Amla Juice (1L)', 320, 299, '2021-07-11', '1'),
(168, 10, 'HL2011', 'Well Aloe Vera (1L)', 300, 280, '2021-07-11', '1'),
(169, 10, 'HL2015', 'Well Shilajit Ojas Gold with Kesar & Safed Musli (30 N)', 599, 499, '2021-07-11', '1'),
(170, 10, 'HL2024', 'Well Omega 3 Antarctic Krill Oil (30 N)', 1435, 1250, '2021-07-11', '1'),
(171, 10, 'HL2027', 'Well Aloe Vera (60 N)', 320, 275, '2021-07-11', '1'),
(172, 10, 'HL2053', 'Well Turmeric (60 N)', 1050, 900, '2021-07-11', '1'),
(173, 10, 'HL2026', 'Well Ashwagandha (60 N)', 450, 385, '2021-07-11', '1'),
(174, 10, 'HL2028', 'Well Tulsi (60 N)', 450, 385, '2021-07-11', '1'),
(175, 10, 'HL2025', 'Well Amla (60 N)', 220, 185, '2021-07-11', '1'),
(176, 10, 'HL2029', 'Well Brahmi (60 N)', 450, 385, '2021-07-11', '1'),
(177, 10, 'HL2054', 'Well BrainActiv (30 N)', 1199, 999, '2021-07-11', '1'),
(178, 10, 'HL1006', 'Well Intellecte (30 N)', 1080, 899, '2021-07-11', '1'),
(179, 10, 'HL2030', 'Well Noni (90 N)', 585, 500, '2021-07-11', '1'),
(180, 10, 'HL2058', 'Well Chyawanprash (500g)', 215, 187, '2021-07-11', '1'),
(181, 10, 'HL2065', 'Well Giloy (60 N)', 230, 199, '2021-07-11', '1'),
(182, 11, 'HL2031', 'Large (1Navy Blue Mask+1 Black Mask) 2 N', 230, 199, '2021-07-11', '1'),
(183, 11, 'HL2032', 'Medium (1Navy Blue Mask+1 Black Mask) 2 N', 230, 199, '2021-07-11', '1'),
(184, 11, 'HL2036', 'Extra Comfort (Black Mask) 1 N', 190, 165, '2021-07-11', '1'),
(185, 11, 'HL2037', 'Pack of 2 with 1 Lanyard (2 N) NEW', 250, 225, '2021-07-11', '1'),
(186, 12, 'HL0001', 'Black (1 N)', 699, 583, '2021-07-11', '1'),
(187, 12, 'HL0002', 'Blue (1 N)', 699, 583, '2021-07-11', '1'),
(188, 12, 'HL0003', 'Magenta (1 N)', 699, 583, '2021-07-11', '1'),
(189, 12, 'HL0004', 'Silver (1 N)', 699, 583, '2021-07-11', '1'),
(190, 12, 'HL2059', 'Soch Badlo (1 N)', 699, 583, '2021-07-11', '1'),
(191, 12, 'HL2023', 'Family Pack (4 N)', 2299, 1916, '2021-07-11', '1'),
(192, 12, 'HL2069', 'For Tablet, PC Monitor & Wi-Fi Router (1 N)', 999, 833, '2021-07-11', '1'),
(193, 12, 'HL2070', 'For Laptop (3 N)', 1440, 1200, '2021-07-11', '1'),
(194, 12, 'HL2021', 'Modicare Enviroglobe Silver (1 N)', 4500, 3750, '2021-07-11', '1'),
(195, 12, 'HL2022', 'Modicare Enviroglobe Rose Gold (1 N)', 4500, 3750, '2021-07-11', '1'),
(196, 13, 'AB0007', 'Rose (84 N)', 65, 50, '2021-07-11', '1'),
(197, 13, 'AB0008', 'Lavender (84 N)', 65, 50, '2021-07-11', '1'),
(198, 13, 'AB0009', 'Sandal (84 N)', 65, 50, '2021-07-11', '1'),
(199, 13, 'AB0010', 'Champa (84 N)', 65, 50, '2021-07-11', '1'),
(200, 13, 'AB0011', 'Jasmine (84 N)', 65, 50, '2021-07-11', '1'),
(201, 13, 'AB0012', 'Kewda (84 N)', 65, 50, '2021-07-11', '1'),
(202, 14, 'HC3030', 'Mighty In-One Multipurpose Cleaner (250ml)', 130, 113, '2021-07-11', '1'),
(203, 14, 'HC3031', 'Mighty In-One Shine & Protect (250ml)', 350, 304, '2021-07-11', '1'),
(204, 14, 'HC0010', 'SteriClean - Disinfectant Cleaner (1000ml)', 350, 304, '2021-07-11', '1'),
(205, 14, 'HC0002', 'Duz All Advanced Concentrated Multi Purpose Cleaner (250ml)', 125, 109, '2021-07-11', '1'),
(206, 14, 'HC2025', 'Duz All Advanced Concentrated Multi Purpose Cleaner (Biosafe Formula) (500ml)', 260, 226, '2021-07-11', '1'),
(207, 14, 'HC2021', 'HD Heavy Duty Floor Cleaner (500ml)', 160, 139, '2021-07-11', '1'),
(208, 14, 'HC0026', 'Silver Dip Instant Silver Cleaner (300ml)', 225, 196, '2021-07-11', '1'),
(209, 14, 'HC3028', 'Spic ‘N’ Span Scale & Bathroom Cleaner 250ml', 135, 117, '2021-07-11', '1'),
(210, 14, 'HC0027', 'Beyond Blue (750ml)', 162, 141, '2021-07-11', '1'),
(211, 14, 'HC5005', 'One Der Scrub (4 N)', 135, 117, '2021-07-11', '1'),
(212, 14, 'HC2024', 'Sparkle Advanced Concentrated Glass Cleaner with antifog effect (Biosafe Formula) (500ml)', 175, 152, '2021-07-11', '1'),
(213, 14, 'HC2018', 'One Der Drop Advanced Concentrated Dish Washing Liquid (Biosafe Formula) (500ml)', 202, 176, '2021-07-11', '1'),
(214, 14, 'HC0006', 'One Der Drop Advanced Concentrated Dish WashingLiquid (Original Formula) (500ml)', 202, 176, '2021-07-11', '1'),
(215, 14, 'HC3027', 'SteriClean Powerful Disinfectant Cleaner Original (250ml)', 110, 96, '2021-07-11', '1'),
(216, 14, 'HC2019', 'SteriClean Powerful Disinfectant Cleaner Original (500ml)', 213, 185, '2021-07-11', '1'),
(217, 14, 'HC2027', 'SteriClean Powerful Disinfectant Cleaner Lime (500ml)', 213, 185, '2021-07-11', '1'),
(218, 14, 'HC2028', 'SteriClean Powerful Disinfectant Cleaner Khus (500ml)', 213, 185, '2021-07-11', '1'),
(219, 14, 'HC2026', 'SteriClean Powerful Disinfectant Cleaner Advanced (500ml)', 220, 191, '2021-07-11', '1'),
(220, 14, 'HC0020', 'Germi Bust Multi-surface Disinfectant Spray (170g)', 175, 159, '2021-07-11', '1'),
(221, 14, 'HC0021', 'Fruveg Fruit And Vegetable Wash (500ml)', 288, 250, '2021-07-11', '1'),
(222, 15, 'LC1018', 'Washmate Popular Detergent Powder (1Kg)', 157, 143, '2021-07-11', '1'),
(223, 15, 'LC2015', 'Washmate Matic Concentrated Detergent Powder (500g)', 150, 130, '2021-07-11', '1'),
(224, 15, 'LC4004', 'Washmate PowerClean Detergent Bar (3 N x 200g)', 108, 95, '2021-07-11', '1'),
(225, 15, 'LC2017', 'Washmate Delicate Liquid Detergent for Woolen & Delicate Fabrics (Biosafe Formula) (500ml)', 350, 304, '2021-07-11', '1'),
(226, 15, 'LC3021', 'Washmate Pre Wash Dirt & Stain Remover (250ml)', 175, 152, '2021-07-11', '1'),
(227, 15, 'LC2018', 'Washmate 5 in 1 Liquid Detergent with Powerzyme & Natural Softener (Biosafe Formula) (500ml)', 375, 326, '2021-07-11', '1'),
(228, 16, 'AC3005', 'Auto Wash Advanced - Auto Shampoo with Colour Protectants (250ml)', 125, 109, '2021-07-11', '1'),
(229, 16, 'AC3008', 'Auto Glow Auto Polish (500ml)', 450, 390, '2021-07-11', '1'),
(230, 17, 'SC0002', 'Schloka Moroccan Argan Oil Cleanser (200ml)', 445, 371, '2021-07-11', '1'),
(231, 17, 'SC0019', 'Schloka Purifying Neem & Gotukola Face Wash (60ml)', 198, 165, '2021-07-11', '1'),
(232, 17, 'SC0022', 'Schloka D Tan Face Pack with Tulsi & Clove (60ml)', 195, 162, '2021-07-11', '1'),
(233, 17, 'SC0024', 'Schloka Moroccan Argan Oil Scrub (60ml)', 219, 183, '2021-07-11', '1'),
(234, 17, 'SC0028', 'Schloka Avocado Face Scrub with Oatmeal & Neroli (60ml)', 280, 239, '2021-07-11', '1'),
(235, 17, 'SC0026', 'Schloka Glow Face Pack with Orange Peel & White Clay (60ml)', 224, 187, '2021-07-11', '1'),
(236, 17, 'SC0003', 'Schloka 3 in 1 Cleanser, Toner and Make Up Remover with Green Tea & Chamomile Extract (200ml)', 315, 270, '2021-07-11', '1'),
(237, 17, 'SC0025', 'Schloka Hydrating Papaya & Hibiscus Moisturizer (100ml)', 263, 225, '2021-07-11', '1'),
(238, 17, 'SC0009', 'Schloka Hydra - Nourish Facial Cream With Shea Butter, Almond & Olive Oil (100ml)', 317, 264, '2021-07-11', '1'),
(239, 17, 'SC0013', 'Schloka Rejuvenating Day Cream with Almond & Lavender (50ml)', 265, 221, '2021-07-11', '1'),
(240, 17, 'SC0020', 'Schloka Sun Screen Cream SPF 30 PA+++ with Gotukola & Cucumber (60ml)', 265, 225, '2021-07-11', '1'),
(241, 17, 'SC0021', 'Schloka Sun Screen Cream SPF 50 PA+++ with Vitamin E & Comfrey (60ml)', 325, 271, '2021-07-11', '1'),
(242, 17, 'SC0004', 'Schloka Anti Ageing Night Cream with Collagen and Vitamin E (50ml)', 255, 219, '2021-07-11', '1'),
(243, 17, 'SC0017', 'Schloka Whitening Cream with Lemon and Turmeric (50ml)', 270, 225, '2021-07-11', '1'),
(244, 17, 'SC0027', 'Schloka Under Eye Cream with Ashwagandha & Gotukola (20ml)', 164, 136, '2021-07-11', '1'),
(245, 17, 'SC0008', 'Schloka Fairness Cream with Rose & Honey (50ml)', 260, 217, '2021-07-11', '1'),
(246, 17, 'SC0006', 'Schloka Body Butter with Shea Butter and Almond Oil (100ml)', 320, 267, '2021-07-11', '1'),
(247, 17, 'SC3021', 'Schloka Purifying Lime Peel & Neem Face Wash (Men) 60ml', 198, 165, '2021-07-11', '1'),
(248, 17, 'PC1001', 'FOTE Cleansing Gel with Apricot & Tea Tree Oil (Ph Balanced) 150ml', 347, 289, '2021-07-11', '1'),
(249, 17, 'PC1003', 'FOTE Fairness Gel with Liquorice & Aloe Vera (SPF14) 150ml', 316, 264, '2021-07-11', '1'),
(250, 17, 'PC1004', 'FOTE Face Pack with Neem & Rosemary (Sensitive & Acne Prone Skin) 150ml', 365, 304, '2021-07-11', '1'),
(251, 17, 'PC5262', 'FOTE Cleansing Gel with Apricot & Tea Tree Oil (Ph Balanced) 100ml', 275, 230, '2021-07-11', '1'),
(252, 17, 'PC5260', 'FOTE Fairness Gel with Liquorice & Aloe Vera (SPF14) 100ml', 250, 210, '2021-07-11', '1'),
(253, 17, 'PC5261', 'FOTE Face Pack with Neem & Rosemary (Sensitive & Acne Prone Skin) 100ml', 270, 225, '2021-07-11', '1'),
(254, 17, 'PC5224', 'Fruit of the Earth Moor Mud Facial Bar (4 N x 25g)', 325, 271, '2021-07-11', '1'),
(255, 17, 'PC5271', 'Fruit of the Earth Moor Mud Mask (100g)', 500, 417, '2021-07-11', '1'),
(256, 17, 'PC1017', 'FOTE Red Obsession - Hydra Nourish Cream (50g)', 399, 347, '2021-07-11', '1'),
(257, 17, 'PC1018', 'FOTE Red Obsession - Hydra Nourish Scrub (50g)', 399, 347, '2021-07-11', '1'),
(258, 17, 'PC1019', 'FOTE Red Obsession - Hydra Nourish Mask (50g)', 399, 347, '2021-07-11', '1'),
(259, 18, 'UCL101', 'Rosewood (4.2 g)', 359, 299, '2021-07-11', '1'),
(260, 18, 'UCL102', 'Punch (4.2 g)', 359, 299, '2021-07-11', '1'),
(261, 18, 'UCL103', 'French Rose (4.2 g)', 359, 299, '2021-07-11', '1'),
(262, 18, 'UCL104', 'Bubblegum (4.2 g)', 359, 299, '2021-07-11', '1'),
(263, 18, 'UCL105', 'Salmon (4.2 g)', 359, 299, '2021-07-11', '1'),
(264, 18, 'UCL106', 'Cerise (4.2 g)', 359, 299, '2021-07-11', '1'),
(265, 18, 'UCL107', 'Hibiscus (4.2 g)', 359, 299, '2021-07-11', '1'),
(266, 18, 'UCL108', 'Amber (4.2 g)', 359, 299, '2021-07-11', '1'),
(267, 18, 'UCL109', 'Raspberry (4.2 g)', 359, 299, '2021-07-11', '1'),
(268, 18, 'UCL110', 'Imperial (4.2 g)', 359, 299, '2021-07-11', '1'),
(269, 18, 'UCL111', 'Pure Red (4.2 g)', 359, 299, '2021-07-11', '1'),
(270, 18, 'UCL112', 'Barn Red (4.2 g)', 359, 299, '2021-07-11', '1'),
(271, 18, 'UCL113', 'Alabama (4.2 g)', 359, 299, '2021-07-11', '1'),
(272, 18, 'UCL114', 'Suedeberry (4.2 g)', 359, 299, '2021-07-11', '1'),
(273, 18, 'UCL115', 'Magnetic (4.2 g)', 359, 299, '2021-07-11', '1'),
(274, 18, 'UCL116', 'Guava Jelly (4.2 g)', 359, 299, '2021-07-11', '1'),
(275, 18, 'UCL117', 'Ballerina (4.2 g)', 359, 299, '2021-07-11', '1'),
(276, 18, 'UCL118', 'Chestnut (4.2 g)', 359, 299, '2021-07-11', '1'),
(277, 18, 'UCL119', 'Almond Joy (4.2 g)', 359, 299, '2021-07-11', '1'),
(278, 18, 'UCL120', 'Sand Storm (4.2 g)', 359, 299, '2021-07-11', '1'),
(279, 18, 'UCL121', 'Gingerbread (4.2 g)', 359, 299, '2021-07-11', '1'),
(280, 18, 'UCL122', 'Plum (4.2 g)', 359, 299, '2021-07-11', '1'),
(281, 18, 'UCL123', 'Wine Me (4.2 g)', 359, 299, '2021-07-11', '1'),
(282, 18, 'UCL124', 'Vamp It Up (4.2 g)', 359, 299, '2021-07-11', '1'),
(283, 19, 'UCL801', 'Creme Rose (4.2 g)', 359, 299, '2021-07-11', '1'),
(284, 19, 'UCL802', 'Sorbet Pink (4.2 g)', 359, 299, '2021-07-11', '1'),
(285, 19, 'UCL803', 'Mexican Pink (4.2 g)', 359, 299, '2021-07-11', '1'),
(286, 19, 'UCL804', 'Rambutan (4.2 g)', 359, 299, '2021-07-11', '1'),
(287, 19, 'UCL805', 'Rosebud (4.2 g)', 359, 299, '2021-07-11', '1'),
(288, 19, 'UCL806', 'Ruby Shock (4.2 g)', 359, 299, '2021-07-11', '1'),
(289, 19, 'UCL807', 'Red Rum (4.2 g)', 359, 299, '2021-07-11', '1'),
(290, 19, 'UCL808', 'Daredevil (4.2 g)', 359, 299, '2021-07-11', '1'),
(291, 19, 'UCL809', 'Ferrari (4.2 g)', 359, 299, '2021-07-11', '1'),
(292, 19, 'UCL810', 'Tawny (4.2 g)', 359, 299, '2021-07-11', '1'),
(293, 19, 'UCL811', 'Ginger (4.2 g)', 359, 299, '2021-07-11', '1'),
(294, 19, 'UCL812', 'Choco Dip (4.2 g)', 359, 299, '2021-07-11', '1'),
(295, 19, 'UCL813', 'Marvelous Mauve (4.2 g)', 359, 299, '2021-07-11', '1'),
(296, 19, 'UCL814', 'Mysterious Plum (4.2 g)', 359, 299, '2021-07-11', '1'),
(297, 20, 'UC1201', 'Coral Rush (4 g)', 695, 579, '2021-07-11', '1'),
(298, 20, 'UC1202', 'Rouge (4 g)', 695, 579, '2021-07-11', '1'),
(299, 20, 'UC1203', 'Power Red (4 g)', 695, 579, '2021-07-11', '1'),
(300, 20, 'UC1207', 'Pink Velvet (4 g)', 695, 579, '2021-07-11', '1'),
(301, 20, 'UC1209', 'Exotic Wine (4 g)', 695, 579, '2021-07-11', '1'),
(302, 20, 'UC1210', 'Devine Plum (4 g)', 695, 579, '2021-07-11', '1'),
(303, 21, 'UC1601', 'Exotic Tangerine 01 (1.4g)', 730, 610, '2021-07-11', '1'),
(304, 21, 'UC1602', 'Scarlet 02 (1.4g)', 730, 610, '2021-07-11', '1'),
(305, 21, 'UC1603', 'Red Siren 03 (1.4g)', 730, 610, '2021-07-11', '1'),
(306, 21, 'UC1604', 'Burgundy 04 (1.4g)', 730, 610, '2021-07-11', '1'),
(307, 21, 'UC1607', 'Rosematic 07 (1.4g)', 730, 610, '2021-07-11', '1'),
(308, 21, 'UC1608', 'Rich Berry 08 (1.4g)', 730, 610, '2021-07-11', '1'),
(309, 21, 'UC1609', 'Bombshell Pink 09 (1.4g)', 730, 610, '2021-07-11', '1'),
(310, 21, 'UC1610', 'Latte 10 (1.4g)', 730, 610, '2021-07-11', '1'),
(311, 21, 'UC1611', 'Terracotta 11 (1.4g)', 730, 610, '2021-07-11', '1'),
(312, 21, 'UC1612', 'Moody Brown 12 (1.4g)', 730, 610, '2021-07-11', '1'),
(313, 22, 'UCL001', 'Strawberry (4.5g)', 199, 173, '2021-07-11', '1'),
(314, 22, 'UCL002', 'Orange (4.5g)', 199, 173, '2021-07-11', '1'),
(315, 22, 'UCL003', 'Cherry (4.5g)', 199, 173, '2021-07-11', '1'),
(316, 23, 'UCL301', 'Oh So Red (6 ml)', 135, 112, '2021-07-11', '1'),
(317, 23, 'UCL302', 'Born Red (6 ml)', 135, 112, '2021-07-11', '1'),
(318, 23, 'UCL303', 'Heartbeat (6 ml)', 135, 112, '2021-07-11', '1'),
(319, 23, 'UCL304', 'Lilies (6 ml)', 135, 112, '2021-07-11', '1'),
(320, 23, 'UCL305', 'Romance (6 ml)', 135, 112, '2021-07-11', '1'),
(321, 23, 'UCL306', 'Pink It! (6 ml)', 135, 112, '2021-07-11', '1'),
(322, 23, 'UCL307', 'Pink Cheeks (6 ml)', 135, 112, '2021-07-11', '1'),
(323, 23, 'UCL308', 'Kissable (6 ml)', 135, 112, '2021-07-11', '1'),
(324, 23, 'UCL309', 'Lilac Bloom (6 ml)', 135, 112, '2021-07-11', '1'),
(325, 23, 'UCL310', 'Flamingo (6 ml)', 135, 112, '2021-07-11', '1'),
(326, 23, 'UCL311', 'Sunshine (6 ml)', 135, 112, '2021-07-11', '1'),
(327, 23, 'UCL312', 'Last Kiss (6 ml)', 135, 112, '2021-07-11', '1'),
(328, 23, 'UCL313', 'Pucker Up (6 ml)', 135, 112, '2021-07-11', '1'),
(329, 23, 'UCL314', 'Bare Dare (6 ml)', 135, 112, '2021-07-11', '1'),
(330, 23, 'UCL315', 'Mysterious (6 ml)', 135, 112, '2021-07-11', '1'),
(331, 23, 'UCL316', 'Deep Blue (6 ml)', 135, 112, '2021-07-11', '1'),
(332, 23, 'UCL317', 'Teal Steal (6 ml)', 135, 112, '2021-07-11', '1'),
(333, 23, 'UCL318', 'Pink Gleam (6 ml)', 135, 112, '2021-07-11', '1'),
(334, 23, 'UCL319', 'Diva (6 ml)', 135, 112, '2021-07-11', '1'),
(335, 23, 'UCL320', 'Treasure Me (6 ml)', 135, 112, '2021-07-11', '1'),
(336, 24, 'UC2201', 'Rose (6 ml)', 155, 130, '2021-07-11', '1'),
(337, 24, 'UC2202', 'Shell (6 ml)', 155, 130, '2021-07-11', '1'),
(338, 24, 'UC2203', 'Tropix (6 ml)', 155, 130, '2021-07-11', '1'),
(339, 24, 'UC2204', 'Candy Crush (6 ml)', 155, 130, '2021-07-11', '1'),
(340, 24, 'UC2205', 'Pink Patrol (6 ml)', 155, 130, '2021-07-11', '1'),
(341, 24, 'UC2206', 'Deep Fuchsia (6 ml)', 155, 130, '2021-07-11', '1'),
(342, 24, 'UC2207', 'Cherry Charm (6 ml)', 155, 130, '2021-07-11', '1'),
(343, 24, 'UC2208', 'Peach Silk (6 ml)', 155, 130, '2021-07-11', '1'),
(344, 24, 'UC2209', 'Maple (6 ml)', 155, 130, '2021-07-11', '1'),
(345, 24, 'UC2210', 'Cinnamon (6 ml)', 155, 130, '2021-07-11', '1'),
(346, 24, 'UC2211', 'Wild Fire Red (6 ml)', 155, 130, '2021-07-11', '1'),
(347, 24, 'UC2212', 'Scarlet Boon (6 ml)', 155, 130, '2021-07-11', '1'),
(348, 24, 'UC2213', 'Hot Chilli (6 ml)', 155, 130, '2021-07-11', '1'),
(349, 24, 'UC2214', 'Sugared Spice (6 ml)', 155, 130, '2021-07-11', '1'),
(350, 24, 'UC2215', 'Mahogany (6 ml)', 155, 130, '2021-07-11', '1'),
(351, 24, 'UC2216', 'Blue Rapture (6 ml)', 155, 130, '2021-07-11', '1'),
(352, 24, 'UC2217', 'Midnight Star (6 ml)', 155, 130, '2021-07-11', '1'),
(353, 24, 'UC2218', 'Aqua Gray (6 ml)', 155, 130, '2021-07-11', '1'),
(354, 24, 'UC2219', 'Olives (6 ml)', 155, 130, '2021-07-11', '1'),
(355, 24, 'UC2220', 'Magic Mauve (6 ml)', 155, 130, '2021-07-11', '1'),
(356, 24, 'UC2221', 'Merry Berry (6 ml)', 155, 130, '2021-07-11', '1'),
(357, 25, 'UCL401', 'Party Pink (6 ml)', 140, 120, '2021-07-11', '1'),
(358, 25, 'UCL402', 'Victorian Rose (6 ml)', 140, 120, '2021-07-11', '1'),
(359, 25, 'UCL403', 'Berry Drop (6 ml)', 140, 120, '2021-07-11', '1'),
(360, 25, 'UCL404', 'Morroccan Rouge (6 ml)', 140, 120, '2021-07-11', '1'),
(361, 25, 'UCL405', 'Candy Cane (6 ml)', 140, 120, '2021-07-11', '1'),
(362, 25, 'UCL406', 'Wild Pink (6 ml)', 140, 120, '2021-07-11', '1'),
(363, 25, 'UCL407', 'Coral Sunset (6 ml)', 140, 120, '2021-07-11', '1'),
(364, 25, 'UCL408', 'Coral Haze (6 ml)', 140, 120, '2021-07-11', '1'),
(365, 25, 'UCL409', 'Peach Punch (6 ml)', 140, 120, '2021-07-11', '1'),
(366, 25, 'UCL410', 'Royal Ruby (6 ml)', 140, 120, '2021-07-11', '1'),
(367, 25, 'UCL411', 'Red Mars (6 ml)', 140, 120, '2021-07-11', '1'),
(368, 25, 'UCL412', 'Fiery Red (6 ml)', 140, 120, '2021-07-11', '1'),
(369, 25, 'UCL413', 'Rhubarb Red (6 ml)', 140, 120, '2021-07-11', '1'),
(370, 25, 'UCL414', 'Espresso (6 ml)', 140, 120, '2021-07-11', '1'),
(371, 25, 'UCL415', 'Hazelnut (6 ml)', 140, 120, '2021-07-11', '1'),
(372, 25, 'UCL416', 'Wild Orchid (6 ml)', 140, 120, '2021-07-11', '1'),
(373, 25, 'UCL417', 'Boysenberry (6 ml)', 140, 120, '2021-07-11', '1'),
(374, 25, 'UCL418', 'Smoke (6 ml)', 140, 120, '2021-07-11', '1'),
(375, 25, 'UCL419', 'Tide Pool (6 ml)', 140, 120, '2021-07-11', '1'),
(376, 25, 'UCL420', 'Ice (6 ml)', 140, 120, '2021-07-11', '1'),
(377, 25, 'UCL421', 'Jet Black (6 ml)', 140, 120, '2021-07-11', '1'),
(378, 25, 'UCL422', 'Seashell Pink (6 ml)', 140, 120, '2021-07-11', '1'),
(379, 25, 'UCL423', 'Lavender (6 ml)', 140, 120, '2021-07-11', '1'),
(380, 25, 'UCL424', 'Minty (6 ml)', 140, 120, '2021-07-11', '1'),
(381, 25, 'UCL425', 'Sea Green (6 ml)', 140, 120, '2021-07-11', '1'),
(382, 25, 'UCL426', 'Baby Blue (6 ml)', 140, 120, '2021-07-11', '1'),
(383, 26, 'UCL901', 'Silver Siren (6 ml)', 155, 130, '2021-07-11', '1'),
(384, 26, 'UCL902', 'Dancing Queen (6 ml)', 155, 130, '2021-07-11', '1'),
(385, 26, 'UCL903', 'Berry Red (6 ml)', 155, 130, '2021-07-11', '1'),
(386, 26, 'UCL904', 'Pink Tulip (6 ml)', 155, 130, '2021-07-11', '1'),
(387, 26, 'UCL905', 'Satin Onxy (6 ml)', 155, 130, '2021-07-11', '1'),
(388, 26, 'UCL906', 'Blue Satin (6 ml)', 155, 130, '2021-07-11', '1'),
(389, 26, 'UCL907', 'Kustom Cola (6 ml)', 155, 130, '2021-07-11', '1'),
(390, 26, 'UCL908', 'Kandy Grape (6 ml)', 155, 130, '2021-07-11', '1'),
(391, 26, 'UCL909', 'Golden sand (6 ml)', 155, 130, '2021-07-11', '1'),
(392, 26, 'UCL910', 'Pink Moscato (6 ml)', 155, 130, '2021-07-11', '1'),
(393, 26, 'UCL911', 'Gilded Rose (6 ml)', 155, 130, '2021-07-11', '1'),
(394, 26, 'UCL912', 'Red Hot Rio (6 ml)', 155, 130, '2021-07-11', '1'),
(395, 27, 'UC3999', 'Nail Enamel Remover (110 ml)', 198, 165, '2021-07-11', '1'),
(396, 28, 'UC8888', 'Radiance Primer (30 ml)', 600, 500, '2021-07-11', '1'),
(397, 29, 'UC4001', 'Ivory (9 g)', 840, 700, '2021-07-11', '1'),
(398, 29, 'UC4002', 'Beige (9 g)', 840, 700, '2021-07-11', '1'),
(399, 29, 'UC4003', 'Porcelain (9 g)', 840, 700, '2021-07-11', '1'),
(400, 29, 'UC4004', 'Honey (9 g)', 840, 700, '2021-07-11', '1'),
(401, 30, 'UC4301', 'Classic Ivory (30 ml)', 550, 458, '2021-07-11', '1'),
(402, 30, 'UC4302', 'Natural (30 ml)', 550, 458, '2021-07-11', '1'),
(403, 30, 'UC4303', 'Nude Beige (30 ml)', 550, 458, '2021-07-11', '1'),
(404, 30, 'UC4304', 'Honey Beige (30 ml)', 550, 458, '2021-07-11', '1'),
(405, 31, 'UC4201', 'Ivory (09 g)', 750, 625, '2021-07-11', '1'),
(406, 31, 'UC4202', 'Natural (9 g)', 750, 625, '2021-07-11', '1'),
(407, 31, 'UC4203', 'Soft Beige (9 g)', 750, 625, '2021-07-11', '1'),
(408, 32, 'UC4101', 'Fresh Coral (4 g)', 540, 440, '2021-07-11', '1'),
(409, 32, 'UC4102', 'Rose Light (4 g)', 540, 440, '2021-07-11', '1'),
(410, 32, 'UC4103', 'Sheer Glow (4 g)', 540, 440, '2021-07-11', '1'),
(411, 33, 'UC4600', 'Fair (30 g)', 495, 413, '2021-07-11', '1'),
(412, 33, 'UC4601', 'Creme Light (30 g)', 495, 413, '2021-07-11', '1'),
(413, 34, 'UC4701', 'White Ice (9 g)', 425, 354, '2021-07-11', '1'),
(414, 35, 'UC4305', 'Ivory Light 01 (25 ml)', 1199, 999, '2021-07-11', '1'),
(415, 35, 'UC4306', 'Beige Light 02 (25 ml)', 1199, 999, '2021-07-11', '1'),
(416, 35, 'UC4307', 'Soft Shell 03 (25 ml)', 1199, 999, '2021-07-11', '1'),
(417, 36, 'UC9018', 'Pro Micellar Bi-Phase Makeup Cleanser (150ml)', 499, 434, '2021-07-11', '1'),
(418, 36, 'UC9019', 'Instant Radiance Illuminating Lotion (30ml)', 1399, 1216, '2021-07-11', '1'),
(419, 37, 'UC4204', 'Ivory Light 01 (9 g)', 899, 782, '2021-07-11', '1'),
(420, 37, 'UC4205', 'Beige Light 02 (9 g)', 899, 782, '2021-07-11', '1'),
(421, 37, 'UC4206', 'Soft Shell 03 (9 g)', 899, 782, '2021-07-11', '1'),
(422, 38, 'UC4801', '30 N wipes', 255, 213, '2021-07-11', '1'),
(423, 39, 'UC9017', 'Dark Brown - 01 (1.08 g)', 600, 520, '2021-07-11', '1'),
(424, 40, 'UC9000', 'Blackest Black (0.35 g)', 360, 300, '2021-07-11', '1'),
(425, 41, 'UC9999', 'Black (9 ml)', 595, 496, '2021-07-11', '1'),
(426, 42, 'UC7002', 'Everlasting Fun (8 g)', 1400, 1167, '2021-07-11', '1'),
(427, 43, '0001ML', 'Super Black (2.5 ml)', 700, 593, '2021-07-11', '1'),
(428, 44, 'UC9013', 'Jet Black 001 (1 ml)', 630, 525, '2021-07-11', '1'),
(429, 44, 'UC9014', 'Starry Night Blue 002 (1 ml) - TILL STOCKS LAST', 630, 525, '2021-07-11', '1'),
(430, 45, 'UC9001', 'Deep Black 001 (1.2g)', 535, 445, '2021-07-11', '1'),
(431, 45, 'UC9002', 'Aqua Black 002 (1.2g)', 535, 445, '2021-07-11', '1'),
(432, 45, 'UC9003', 'Royal Blue 003 (1.2g)', 535, 445, '2021-07-11', '1'),
(433, 46, 'UC5001', 'Perfect Matte Lipstick 10 in 1 Sampler Set of Corals, Reds & Browns (10 N x 0.6g)', 299, 249, '2021-07-11', '1'),
(434, 46, 'UC5002', 'Perfect Matte Lipstick 10 in 1 Sampler Set of Pinks, Mauves & Berries (10 N x 0.6g)', 299, 249, '2021-07-11', '1'),
(435, 46, 'UC5003', 'Crème Glam Lipstick 10 in 1 Sampler Set of Corals, Reds & Browns (10 N x 0.6g)', 299, 249, '2021-07-11', '1'),
(436, 46, 'UC5004', 'Crème Glam Lipstick 10 in 1 Sampler Set of Pinks, Mauves & Berries (10 N x 0.6g)', 299, 249, '2021-07-11', '1'),
(437, 46, 'UC5005', 'Perfect Matte & Crème Glam Mix Palette Lipstick 10 in 1 Sampler (10 N x 0.6g)', 299, 249, '2021-07-11', '1'),
(438, 47, 'UC9021', 'Urban Color Flawless Finish Beauty Sponge-Black (1 N)', 199, 173, '2021-07-11', '1'),
(439, 47, 'UC9022', 'Urban Color Flawless Finish Beauty Sponge-Pink (1 N)', 199, 173, '2021-07-11', '1'),
(440, 47, 'UC8001', 'Urban Color Travel Buddy Nail Lacquer Wipes (30 N)', 150, 130, '2021-07-11', '1'),
(441, 47, 'UC9020', 'Urban Color Shape Up Crystal Nail Filer-Black (1 N)', 175, 152, '2021-07-11', '1'),
(442, 47, 'UC9023', 'Urban Color Shape Up Crystal Nail Filer-Pink (1 N)', 175, 152, '2021-07-11', '1'),
(443, 47, 'UC9016', 'Urban Color Pencil Sharpener (1 N)', 175, 125, '2021-07-11', '1'),
(444, 47, '0001LB', 'Urban Color Retractable Lip Brush 1 N (Till stocks last)', 390, 325, '2021-07-11', '1'),
(445, 48, 'UC4901', 'Pro White Fresh Radiance Day Cream (30 g)', 1599, 1390, '2021-07-11', '1'),
(446, 48, 'UC4902', 'Pro White Replenishing Night Cream (30 g)', 1599, 1390, '2021-07-11', '1'),
(447, 48, 'UC4903', 'Pro White Fresh Radiance Lotion (30 ml)', 1699, 1477, '2021-07-11', '1'),
(448, 48, 'UC4904', 'Pro White Anti-Spot Radiance Serum (10 ml)', 499, 434, '2021-07-11', '1'),
(449, 48, 'UC4905', 'Pro White Advance Anti-Wrinkle & Nourishing Tencel Sheet Mask with Collagen (25 ml)', 199, 173, '2021-07-11', '1'),
(450, 48, 'UC4906', 'Pro White Super Soothing & Anti - Ageing Tencel Sheet Mask with Aloe (25 ml)', 199, 173, '2021-07-11', '1'),
(451, 49, 'UC5904', 'Power Lift Cleanser (80 ml)', 999, 869, '2021-07-11', '1'),
(452, 49, 'UC5905', 'Pore Minimising Mist (100 ml)', 999, 869, '2021-07-11', '1'),
(453, 49, 'UC5901', 'Day Cream SPF 15 (30 g)', 2299, 1999, '2021-07-11', '1'),
(454, 49, 'UC5902', 'Night Cream (30 g)', 2299, 1999, '2021-07-11', '1'),
(455, 49, 'UC5903', 'Collagen Boosting Serum (18 ml)', 1299, 1129, '2021-07-11', '1'),
(456, 49, 'UC5906', 'Under - Eye Recovery Concentrate (12 ml)', 1299, 1129, '2021-07-11', '1'),
(457, 50, 'UCL201', '3 in 1 Cleanser, Makeup Remover & Hydrator (45 g)', 799, 700, '2021-07-11', '1'),
(458, 51, 'UCL701', 'Real Red (4 ml)', 120, 99, '2021-07-11', '1'),
(459, 51, 'UCL702', 'Real Maroon (4 ml)', 120, 99, '2021-07-11', '1'),
(460, 52, 'AG0001', 'Active - 80 (3 N x 100ml)', 369, 310, '2021-07-11', '1'),
(461, 52, 'AG0002', 'Active - 80 (500ml)', 507, 441, '2021-07-11', '1'),
(462, 52, 'AG0003', 'Active - 80 (5L)', 3549, 3086, '2021-07-11', '1'),
(463, 52, 'AG0004', 'Active - 80 Gold (500ml)', 599, 521, '2021-07-11', '1'),
(464, 52, 'AG0005', 'Activzyme (3 N x 100ml)', 462, 400, '2021-07-11', '1'),
(465, 52, 'AG0006', 'Activzyme (500ml)', 630, 550, '2021-07-11', '1'),
(466, 52, 'AG0008', 'Activmax (3 N x 100ml)', 546, 474, '2021-07-11', '1'),
(467, 52, 'AG0009', 'Activmax (500ml)', 744, 647, '2021-07-11', '1'),
(468, 53, 'MJ0054', 'Mogra (1N Ring)', 799, 726.36, '2021-07-11', '1'),
(469, 53, 'MJ0053', 'Taahira (1N Bracelet)', 1299, 1180.91, '2021-07-11', '1'),
(470, 53, 'MJ0052', 'Naina (1N Necklace+2N Earrings)', 2999, 2726.36, '2021-07-11', '1'),
(471, 53, 'MJ0055', 'Aashi (1N Ring)', 799, 726.36, '2021-07-11', '1'),
(472, 53, 'MJ0047', 'Moh (1N Bracelet)', 1099, 999.09, '2021-07-11', '1'),
(473, 53, 'MJ0048', 'Jahaan (1N Necklace+2N Earrings)', 3999, 3635.45, '2021-07-11', '1'),
(474, 53, 'MJ0051', 'Aahana (1N Necklace+2N Earrings)', 1699, 1544.55, '2021-07-11', '1'),
(475, 54, 'MJ0003', 'Chandini (Necklace 1N + Earring 2N)', 3349, 3045, '2021-07-11', '1'),
(476, 54, 'MJ0013', 'Kamal Jhumki Pink (Earring 2N)', 3349, 3045, '2021-07-11', '1'),
(477, 54, 'MJ0004', 'Kamal Jhumki Green (Earring 2N)', 3349, 3045, '2021-07-11', '1'),
(478, 54, 'MJ0007', 'Tara (Earring 2N)', 1249, 1135, '2021-07-11', '1'),
(479, 54, 'MJ0008', 'Trishna (Necklace 1N + Earring 2N)', 4999, 4545, '2021-07-11', '1'),
(480, 54, 'MJ0009', 'Mohini (Earring 2N)', 2499, 2272, '2021-07-11', '1'),
(481, 54, 'MJ0011', 'Manik Panna Mala (Necklace 1N)', 1499, 1317, '2021-07-11', '1'),
(482, 54, 'MJ0012', 'Mayuri (Earring 2N)', 2699, 2454, '2021-07-11', '1'),
(483, 54, 'MJ0018', 'Tarang (Necklace 1N + Earring 2N)', 2849, 2590, '2021-07-11', '1'),
(484, 54, 'MJR120', 'Kundan Kangan Red (Bangles 2N - 2.8\")', 1599, 1454, '2021-07-11', '1'),
(485, 54, 'MJ0020', 'Kundan Kangan Red (Bangles 2N - 2.6\")', 1599, 1454, '2021-07-11', '1'),
(486, 54, 'MJR020', 'Kundan Kangan Red (Bangles 2N - 2.4\")', 1599, 1454, '2021-07-11', '1'),
(487, 54, 'MJG121', 'Kundan Kangan Green (Bangles 2N - 2.8\")', 1599, 1454, '2021-07-11', '1'),
(488, 54, 'MJ0021', 'Kundan Kangan Green (Bangles 2N - 2.6\")', 1599, 1454, '2021-07-11', '1'),
(489, 54, 'MJG021', 'Kundan Kangan Green (Bangles 2N - 2.4\")', 1599, 1454, '2021-07-11', '1'),
(490, 54, 'MJ0022', 'Nayantara (Necklace 1N + Earring 2N)', 2200, 2000, '2021-07-11', '1'),
(491, 54, 'MJ0014', 'Chand Bala (Earring 2N)', 1799, 1635, '2021-07-11', '1'),
(492, 54, 'MJ0043', 'Phool (Bracelet 1N) NEW', 1299, 1180.91, '2021-07-11', '1'),
(493, 54, 'MJ0045', 'Rani (Pendant + Earring Set 3N) NEW', 3999, 3635.45, '2021-07-11', '1'),
(494, 54, 'MJ0049', 'Kohinoor (Bangles 2N - 2.6\")', 1899, 1726.36, '2021-07-11', '1'),
(495, 54, 'MJ0050', 'Kohinoor (Bangles 2N - 2.4\")', 1899, 1726.36, '2021-07-11', '1'),
(496, 55, 'MJ0001', 'Hansani (Pendent 1N + Earring 2N)', 1699, 1545, '2021-07-11', '1'),
(497, 55, 'MJ0002', 'Sia (Pendent 1N + Earring 2N)', 1699, 1545, '2021-07-11', '1'),
(498, 55, 'MJ0005', 'Pia (Bracelet 1N)', 849, 772, '2021-07-11', '1'),
(499, 55, 'MJ0006', 'Mehar (Bracelet 1N)', 949, 863, '2021-07-11', '1'),
(500, 55, 'MJ0010', 'Maya (Earring 2N)', 1399, 1272, '2021-07-11', '1'),
(501, 55, 'MJ0015', 'Dia (Necklace 1N + Earring 2N)', 2000, 1818, '2021-07-11', '1'),
(502, 55, 'MJ0016', 'Divya (Necklace 1N + Earring 2N)', 2399, 2181, '2021-07-11', '1'),
(503, 55, 'MJ0017', 'Moti Mala (Necklace 1N + Earring 2N)', 2199, 1999, '2021-07-11', '1'),
(504, 55, 'MJ0019', 'Heer (Earring 2N)', 1399, 1272, '2021-07-11', '1'),
(505, 55, 'MJ0041', 'Sitara (Necklace 1N + Earring 2N)', 2499, 2272, '2021-07-11', '1'),
(506, 55, 'MJ0044', 'Kiran (Earring 2N)', 1500, 1363.64, '2021-07-11', '1'),
(507, 55, 'MJ0046', 'Mahi (Bracelet Hath Pan 1N)', 1999, 1817.27, '2021-07-11', '1'),
(508, 56, 'MJ0023', 'Naaz Ruby Red (Earring 2N)', 1699, 1545, '2021-07-11', '1'),
(509, 56, 'MJ0024', 'Ada Ruby Red (Cuff 1N)', 3999, 3635, '2021-07-11', '1'),
(510, 56, 'MJ0025', 'Ada Emerald Green (Cuff 1N)', 3999, 3635, '2021-07-11', '1'),
(511, 56, 'MJ0026', 'Naaz Blue Sapphire (Earring 2N)', 1699, 1545, '2021-07-11', '1'),
(512, 56, 'MJ0027', 'Azra Ruby Red (Earring 2N)', 1799, 1635, '2021-07-11', '1'),
(513, 56, 'MJ0042', 'Azra Emerald Green (Earring 2N)', 1799, 1635, '2021-07-11', '1'),
(514, 56, 'MJ0028', 'Noor Ruby Red (Earring 2N)', 1099, 999, '2021-07-11', '1'),
(515, 56, 'MJ0029', 'Saira (Earring 2N)', 1099, 999, '2021-07-11', '1'),
(516, 56, 'MJ0030', 'Shabnam Rose Quartz (Earring 2N)', 1099, 999, '2021-07-11', '1'),
(517, 56, 'MJ0031', 'Zeenat (Bracelet 1N)', 1999, 1817, '2021-07-11', '1'),
(518, 56, 'MJ0032', 'Nausheen (Bracelet 1N)', 1999, 1817, '2021-07-11', '1'),
(519, 56, 'MJ0033', 'Zoya (Earring 2N)', 899, 817, '2021-07-11', '1'),
(520, 56, 'MJ0034', 'Nazia Onyx Pink (Earring 2N)', 1299, 1181, '2021-07-11', '1'),
(521, 56, 'MJ0036', 'Noor Emerald Green (Earring 2N)', 1099, 999, '2021-07-11', '1'),
(522, 56, 'MJ0037', 'Nazia Onyx Blue (Earring 2N)', 1299, 1181, '2021-07-11', '1'),
(523, 56, 'MJ0038', 'Ada Antique (Cuff 1N)', 3999, 3635, '2021-07-11', '1'),
(524, 56, 'MJ0039', 'Shabnam Aqua (Earring 2N)', 899, 817, '2021-07-11', '1'),
(525, 56, 'MJ0040', 'Fiza (Earring 2N)', 899, 817, '2021-07-11', '1'),
(526, 57, 'WAT001', 'SM Men\'s (Day & Date) Two Tone Rose Gold Watch (1 N)', 3449, 2999, '2021-07-11', '1'),
(527, 57, 'WAT002', 'SM Men\'s (Day & Date) Two Tone Gold Watch (1 N)', 3449, 2999, '2021-07-11', '1'),
(528, 57, 'WAT003', 'SM Men\'s (Day & Date) Black Dial Leather Strap Watch (1N)', 2599, 2249, '2021-07-11', '1'),
(529, 57, 'WAT004', 'SM Men\'s (Date) Gold Watch (1 N)', 2999, 2599, '2021-07-11', '1'),
(530, 57, 'WAT005', 'SM Men\'s (Day & Date) Square Two Tone Gold Watch (1 N)', 2999, 2599, '2021-07-11', '1'),
(531, 57, 'WAT006', 'SM His N Her Rose Gold Combo Watch Pack (2 N)', 5500, 4799, '2021-07-11', '1'),
(532, 57, 'WAT007', 'SM Ladies Rose Gold Watch (1 N)', 2999, 2599, '2021-07-11', '1'),
(533, 57, 'WAT008', 'SM Ladies Rose Gold Watch (01 N)', 2599, 2249, '2021-07-11', '1'),
(534, 57, 'WAT009', 'SM Ladies Stone Embedded Black Dial Watch(1 N)', 2999, 2599, '2021-07-11', '1'),
(535, 57, 'WAT010', 'SM Ladies Stone Embedded Two Tone Gold Watch (1 N)', 2599, 2249, '2021-07-11', '1'),
(536, 57, 'WAT011', 'SM Ladies Stone Embedded Two Tone Gold Watch With Mesh Metal Strap (1 N)', 2999, 2599, '2021-07-11', '1'),
(537, 58, 'MG0001', 'Mighty Guard Mobile Security (1 N)', 799, 665.83, '2021-07-11', '1'),
(538, 59, '600900', 'Modicare Consultant Bundi (Small)', 1950, 1950, '2021-07-11', '1'),
(539, 59, '601014', 'Modicare Consultant Bundi (Medium)', 1950, 1950, '2021-07-11', '1'),
(540, 59, '601015', 'Modicare Consultant Bundi (Large)', 1950, 1950, '2021-07-11', '1'),
(541, 59, '601016', 'Modicare Consultant Bundi (XL)', 1950, 1950, '2021-07-11', '1'),
(542, 59, '601017', 'Modicare Consultant Bundi (XXL)', 1950, 1950, '2021-07-11', '1'),
(543, 59, '601018', 'Modicare Consultant Bundi (XXXL)', 1950, 1950, '2021-07-11', '1'),
(544, 59, '601000', 'Modicare Consultant Kurti+Leggings (Small)', 1700, 1700, '2021-07-11', '1'),
(545, 59, '601005', 'Modicare Consultant Kurti+Leggings (Medium)', 1700, 1700, '2021-07-11', '1'),
(546, 59, '601006', 'Modicare Consultant Kurti+Leggings (Large)', 1700, 1700, '2021-07-11', '1'),
(547, 59, '601007', 'Modicare Consultant Kurti+Leggings (XL)', 1700, 1700, '2021-07-11', '1'),
(548, 59, '601008', 'Modicare Consultant Kurti+Leggings (XXL)', 1700, 1700, '2021-07-11', '1'),
(549, 59, '601001', 'Modicare Consultant Saree With Blouse Piece', 1700, 1700, '2021-07-11', '1'),
(550, 59, '605000', 'Azadi Medal (1 N)', 75, 75, '2021-07-11', '1'),
(551, 59, '600902', 'Modicare Backpack (1 N)', 975, 975, '2021-07-11', '1'),
(552, 59, '600903', 'Modicare Mug (1 N)', 130, 130, '2021-07-11', '1'),
(553, 59, '600862', 'Modicare Car Sticker (10 N)', 220, 220, '2021-07-11', '1'),
(554, 59, '600863', 'Modicare Bike Sticker (10 N)', 90, 90, '2021-07-11', '1'),
(555, 59, '600824', 'Modicare T-Shirt (1 N)', 795, 795, '2021-07-11', '1'),
(556, 59, '600836', 'Modicare Carry Bag (1 N)', 5, 5, '2021-07-11', '1'),
(557, 59, '600848', 'Atoot Bandhan Button Buddies (I Love Modicare & I Am Priceless) (2 N)', 40, 40, '2021-07-11', '1'),
(558, 59, '600846', 'Atoot Bandhan Mouli (1 N)', 25, 25, '2021-07-11', '1'),
(559, 60, '600901', 'Modicare Demo Kit (1 N)', 495, 495, '2021-07-11', '1'),
(560, 61, '606035', '5 in 1 Azadi Catalogue - August 2020 (1 N)', 75, 75, '2021-07-11', '1'),
(561, 61, '606041', 'Sapne (Product Catalogue) - Mizo (1 N)', 35, 35, '2021-07-11', '1'),
(562, 61, '600920', 'Sapne (Product Catalogue) - English (1 N)', 32, 32, '2021-07-11', '1'),
(563, 61, '601023', 'Urban Color (Product Catalogue)-English (1 N)', 30, 30, '2021-07-11', '1'),
(564, 61, '601035', 'Arogya-The Health & Wellness Guide English (1 N)', 49, 49, '2021-07-11', '1'),
(565, 61, '601036', 'Arogya-The Health & Wellness Guide Hindi (1 N)', 49, 49, '2021-07-11', '1'),
(566, 61, '601043', 'Modicare Digital Product Booklet English (1 N) NEW', 12, 12, '2021-07-11', '1'),
(567, 61, '601044', 'Modicare Digital Product Booklet Hindi (1 N) NEW', 12, 12, '2021-07-11', '1'),
(568, 61, '606021', 'Well- Wheel of Nutrition English (1 N)', 20, 20, '2021-07-11', '1'),
(569, 61, '606022', 'Well- Wheel of Nutrition Hindi (1 N)', 20, 20, '2021-07-11', '1'),
(570, 61, '606023', 'Product Pocket Brochure - Home Care English (1 N)', 15, 15, '2021-07-11', '1'),
(571, 61, '606024', 'Product Pocket Brochure - Home Care Hindi (1 N)', 15, 15, '2021-07-11', '1'),
(572, 61, '606030', 'Flip Chart - Parivartan & Shuruaat English (1 N)', 300, 300, '2021-07-11', '1'),
(573, 61, '601032', 'Urban Color Intense Impact Lipstick Shade Card (1 N)', 6, 6, '2021-07-11', '1'),
(574, 61, '600725', 'Consultant Application Form (2 N)', 20, 20, '2021-07-11', '1'),
(575, 61, '606033', 'Consultant Product Order Form', 0, 0, '2021-07-11', '1'),
(576, 61, '606034', 'Customer Price List', 0, 0, '2021-07-11', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `register_date` date NOT NULL,
  `last_login` datetime NOT NULL,
  `notes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `register_date`, `last_login`, `notes`) VALUES
(1, 'modicare', 'admin@gmail.com', '37830eb2d822a79a84b52d795c336283', '2021-07-08', '2021-07-13 03:07:32', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_no`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_no` (`invoice_no`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `product_name` (`product_name`),
  ADD UNIQUE KEY `product_id` (`product_id`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=577;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoice_details_ibfk_1` FOREIGN KEY (`invoice_no`) REFERENCES `invoice` (`invoice_no`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
