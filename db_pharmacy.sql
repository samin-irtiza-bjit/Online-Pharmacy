-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2021 at 05:16 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

GRANT ALL PRIVILEGES ON *.* TO 'pharma'@'192.168.56.110' IDENTIFIED BY
'tetrispass' WITH GRANT OPTION;
FLUSH PRIVILEGES;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_access`
--

CREATE TABLE `tbl_access` (
  `acc_id` int(10) UNSIGNED NOT NULL,
  `acc_name` varchar(50) NOT NULL DEFAULT '',
  `date_added` date NOT NULL DEFAULT '0000-00-00',
  `time_added` time NOT NULL DEFAULT '00:00:00',
  `date_modified` date NOT NULL DEFAULT '0000-00-00',
  `time_modified` time NOT NULL DEFAULT '00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_area`
--

CREATE TABLE `tbl_area` (
  `area_id` int(10) UNSIGNED NOT NULL,
  `area_name` varchar(180) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `c_id` int(10) UNSIGNED NOT NULL,
  `pro_id` int(11) NOT NULL DEFAULT 0,
  `c_qty` int(11) NOT NULL DEFAULT 0,
  `usr_id` int(11) NOT NULL DEFAULT 0,
  `c_subtotal` float(10,2) NOT NULL DEFAULT 0.00,
  `client_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cat_id` int(10) UNSIGNED NOT NULL,
  `cat_name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1,
  `date_added` date NOT NULL DEFAULT '0000-00-00',
  `time_added` time NOT NULL DEFAULT '00:00:00',
  `date_modified` date NOT NULL DEFAULT '0000-00-00',
  `time_modified` time NOT NULL DEFAULT '00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `cat_name`, `description`, `status`, `date_added`, `time_added`, `date_modified`, `time_modified`) VALUES
(10, 'ANTI-BACTERIAL', 'Anything that destroys bacteria or suppresses their growth or their ability to reproduce.', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(11, 'ANTIANGINAL DRUG', 'Used to provide immediate relief from symptoms and prevent angina attacks.', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(12, 'ANTI-FUNGAL', 'A drug used to treat fungal infections.', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(13, 'ANALGESIC/ANTIPYRETIC', 'Painkiller is any member of the group of drugs used to achieve analgesia, relief from pains.', 1, '2017-05-15', '00:09:00', '2017-07-12', '02:41:43'),
(14, 'COUGH PREP\'N', 'Antitussives are cough suppressants. They relieve your cough by blocking the cough reflex.', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(15, 'ANTI-INFLAMMATORY DRUG', 'Alleviate pain by counteracting the cyclooxygenase (COX) enzyme. On its own, COX enzyme synthesizes prostaglandins, creating inflammation.', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(16, 'ANTITHROMBOTIC', 'Antithrombotic magic churchur (INSERT CONTENT)', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(17, 'OXYTOCIC', 'Peptide hormone and neuropeptide', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(18, 'LAXATIVE', 'Substances that loosen stools and increase bowel movements.', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(19, 'INJECTABLES', 'A soft tissue filler injected into the skin to help fill in facial wrinkles, restoring a smoother appearance. ', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(20, 'DECONGESTANT/ANTIPYRETIC', 'A type of pharmaceutical drug that is used to relieve nasal congestion in the upper respiratory tract. ', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(21, 'GASTROKINETIC', 'A type of drug which enhances gastrointestinal motility by increasing the frequency of contractions in the small intestine or making them stronger, but without disrupting their rhy', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(22, 'SKELETAL MUSCLE RELAXANT', 'Act on the central nervous system (CNS) to relax muscles.', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(23, 'ANTI-ASTHMA', 'Used to relieve the symptoms of asthma thihsidsandas', 1, '2017-05-15', '00:09:00', '2017-07-31', '10:14:00'),
(24, 'ANTIBACTERIAL OINTMENT', '(INSERT CONTENT)', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(25, 'OPTHALMIC ANTIBACTERIAL DROPS', 'Comes in the form of eye drops or ointment. It is available only with a physician\'s prescription.', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(26, 'VITAMINS', 'An organic compound and a vital nutrient that an organism requires in limited amounts. ', 1, '2017-05-15', '00:09:00', '0000-00-00', '00:00:00'),
(27, 'Hala', '123', 0, '2017-07-09', '19:01:41', '2017-07-09', '19:01:48'),
(28, 'Jason', 'jason', 0, '2017-07-31', '10:14:10', '2017-09-13', '05:08:48'),
(29, 'Jaon', 'Lim', 0, '2017-09-15', '13:50:10', '2017-09-15', '13:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_client`
--

CREATE TABLE `tbl_client` (
  `client_id` int(10) UNSIGNED NOT NULL,
  `usr_username` varchar(180) NOT NULL DEFAULT '',
  `usr_password` varchar(180) NOT NULL DEFAULT '',
  `usr_firstname` varchar(180) NOT NULL DEFAULT '',
  `usr_lastname` varchar(180) NOT NULL DEFAULT '',
  `contact_no` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `status` int(10) UNSIGNED DEFAULT 1,
  `usr_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_client`
--

INSERT INTO `tbl_client` (`client_id`, `usr_username`, `usr_password`, `usr_firstname`, `usr_lastname`, `contact_no`, `email`, `status`, `usr_id`) VALUES
(1028, 'samin', '0cef1fb10f60529028a71f58e54ed07b', 'samin', 'samin', '236521513', 'samin@gmail.com', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery`
--

CREATE TABLE `tbl_delivery` (
  `delivery_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `date_added` date NOT NULL DEFAULT '0000-00-00',
  `time_added` time NOT NULL DEFAULT '00:00:00',
  `date_delivered` date NOT NULL DEFAULT '0000-00-00',
  `time_delivered` time NOT NULL DEFAULT '00:00:00',
  `delivery_status` int(11) NOT NULL DEFAULT 0,
  `or_number` varchar(180) NOT NULL DEFAULT '',
  `usr_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery_items`
--

CREATE TABLE `tbl_delivery_items` (
  `d_items_id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL,
  `unit_price` double(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` double(10,2) NOT NULL,
  `discount` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `date_added` date NOT NULL DEFAULT '0000-00-00',
  `time_added` time NOT NULL DEFAULT '00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_disposal`
--

CREATE TABLE `tbl_disposal` (
  `disposal_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL DEFAULT 0,
  `lot_id` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `reason` varchar(150) NOT NULL DEFAULT '',
  `date_disposed` date NOT NULL DEFAULT '0000-00-00',
  `time_disposed` time NOT NULL DEFAULT '00:00:00',
  `usr_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_disposal`
--

INSERT INTO `tbl_disposal` (`disposal_id`, `pro_id`, `lot_id`, `quantity`, `reason`, `date_disposed`, `time_disposed`, `usr_id`) VALUES
(1, 10039, 1000000005, 2, 'Damaged', '2017-07-05', '00:10:00', 1001),
(2, 10101, 1000000004, 5, 'Damaged', '2017-07-15', '00:00:00', 1001),
(3, 10039, 1000000001, 3, 'Expired', '2017-07-19', '21:37:42', 1001),
(4, 10076, 1000000002, 5, 'Damaged', '2017-07-19', '21:40:20', 1001),
(5, 10039, 1000000001, 5, 'Expired', '2017-07-19', '21:40:49', 1001),
(6, 10039, 1000000001, 5, 'Damaged', '2017-07-19', '21:41:18', 1001),
(7, 10076, 1000000002, 3, 'Damaged', '2017-07-19', '21:42:07', 1001),
(8, 10039, 1000000001, 8, 'Expired', '2017-07-31', '10:20:46', 1001),
(9, 10039, 1000000001, 3, 'Damaged', '2017-08-02', '04:25:26', 1001),
(10, 10039, 1000000005, 1, 'Expired', '2017-08-04', '19:15:47', 1001),
(11, 10039, 1000000011, 2, 'Expired', '2017-09-13', '05:20:39', 1001),
(12, 10085, 1000000012, 1, 'Expired', '2017-09-13', '14:12:54', 1001),
(13, 10058, 1000000003, 13, 'Expired', '2017-09-13', '14:12:54', 1001),
(14, 10039, 1000000011, 1, 'Expired', '2017-10-07', '01:58:17', 1001);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `total_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `amount_paid` double(10,2) NOT NULL DEFAULT 0.00,
  `amount_remaining` double(10,2) NOT NULL DEFAULT 0.00,
  `date_due` date NOT NULL DEFAULT '0000-00-00',
  `date_issued` date NOT NULL DEFAULT '0000-00-00',
  `time_issued` time NOT NULL DEFAULT '00:00:00',
  `date_modified` date NOT NULL DEFAULT '0000-00-00',
  `time_modified` time NOT NULL DEFAULT '00:00:00',
  `usr_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice_item`
--

CREATE TABLE `tbl_invoice_item` (
  `invitem_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL DEFAULT 0,
  `pro_name` varchar(100) NOT NULL DEFAULT '',
  `pro_id` int(11) NOT NULL DEFAULT 0,
  `lot_id` int(11) NOT NULL DEFAULT 0,
  `unit_price` double(10,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `subtotal` double(10,2) NOT NULL DEFAULT 0.00,
  `discount` double(10,2) NOT NULL DEFAULT 0.00,
  `total` double(10,2) NOT NULL DEFAULT 0.00,
  `date_added` date NOT NULL DEFAULT '0000-00-00',
  `time_added` time NOT NULL DEFAULT '00:00:00',
  `date_modified` date NOT NULL DEFAULT '0000-00-00',
  `time_modified` time NOT NULL DEFAULT '00:00:00',
  `usr_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lot`
--

CREATE TABLE `tbl_lot` (
  `lot_id` int(10) UNSIGNED NOT NULL,
  `lot_number` varchar(100) NOT NULL DEFAULT '',
  `pro_id` int(11) NOT NULL DEFAULT 0,
  `expiry_date` date NOT NULL DEFAULT '0000-00-00',
  `quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notifications`
--

CREATE TABLE `tbl_notifications` (
  `n_id` bigint(20) UNSIGNED NOT NULL,
  `n_date_added` date NOT NULL DEFAULT '0000-00-00',
  `n_time_added` time NOT NULL DEFAULT '00:00:00',
  `n_title` varchar(255) NOT NULL DEFAULT '',
  `n_subject` varchar(255) NOT NULL DEFAULT '',
  `n_message` longtext NOT NULL,
  `n_status` int(11) NOT NULL DEFAULT 0,
  `client_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_date` date NOT NULL DEFAULT '0000-00-00',
  `order_time` time NOT NULL DEFAULT '00:00:00',
  `total_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `term_id` int(11) NOT NULL DEFAULT 0,
  `ordtype_id` int(11) NOT NULL DEFAULT 0,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `date_modified` date NOT NULL DEFAULT '0000-00-00',
  `time_modified` time NOT NULL DEFAULT '00:00:00',
  `status` int(11) NOT NULL DEFAULT 0,
  `usr_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orditem`
--

CREATE TABLE `tbl_orditem` (
  `orditem_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `pro_id` int(11) NOT NULL DEFAULT 0,
  `lot_id` int(11) NOT NULL DEFAULT 0,
  `qty_total` int(11) NOT NULL DEFAULT 0,
  `qty_delivery` int(11) NOT NULL DEFAULT 0,
  `qty_sold` int(11) NOT NULL DEFAULT 0,
  `qty_remaining` int(11) NOT NULL DEFAULT 0,
  `qty_withdrawn` int(11) NOT NULL DEFAULT 0,
  `subtotal` double(10,2) NOT NULL DEFAULT 0.00,
  `discount` double(10,2) NOT NULL DEFAULT 0.00,
  `total` double(10,2) NOT NULL DEFAULT 0.00,
  `date_added` date NOT NULL DEFAULT '0000-00-00',
  `time_added` time NOT NULL DEFAULT '00:00:00',
  `date_modified` date NOT NULL DEFAULT '0000-00-00',
  `time_modified` time NOT NULL DEFAULT '00:00:00',
  `usr_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ordtype`
--

CREATE TABLE `tbl_ordtype` (
  `ordtype_id` int(10) UNSIGNED NOT NULL,
  `ordtype_name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(180) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ordtype`
--

INSERT INTO `tbl_ordtype` (`ordtype_id`, `ordtype_name`, `description`) VALUES
(10, 'Considered Sold', 'Sold');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ord_invoice`
--

CREATE TABLE `tbl_ord_invoice` (
  `ord_invoice_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `invoice_id` int(11) NOT NULL DEFAULT 0,
  `usr_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_paymode`
--

CREATE TABLE `tbl_paymode` (
  `paymode_id` int(10) UNSIGNED NOT NULL,
  `paymode_name` varchar(80) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_paymode`
--

INSERT INTO `tbl_paymode` (`paymode_id`, `paymode_name`) VALUES
(40, 'Cash'),
(41, 'Online Payment');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payterm`
--

CREATE TABLE `tbl_payterm` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `term_name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(180) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payterm`
--

INSERT INTO `tbl_payterm` (`term_id`, `term_name`, `description`) VALUES
(10, 'Cash on Delivery', 'Full payment upon delivery'),
(11, 'Online Payment ', 'via BillDesk');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `pro_id` int(10) UNSIGNED NOT NULL,
  `barcode` varchar(100) NOT NULL DEFAULT '',
  `pro_brand` varchar(180) NOT NULL DEFAULT '',
  `pro_generic` varchar(180) NOT NULL DEFAULT '',
  `pro_formulation` varchar(180) NOT NULL DEFAULT '',
  `pro_packaging` varchar(180) NOT NULL DEFAULT '',
  `pro_unit_price` double(10,2) NOT NULL DEFAULT 0.00,
  `pro_reorder_level` int(11) NOT NULL DEFAULT 0,
  `pro_total_qty` int(11) NOT NULL DEFAULT 0,
  `cat_id` int(11) NOT NULL DEFAULT 0,
  `date_added` date NOT NULL DEFAULT '0000-00-00',
  `time_added` time NOT NULL DEFAULT '00:00:00',
  `date_modified` date NOT NULL DEFAULT '0000-00-00',
  `time_modified` time NOT NULL DEFAULT '00:00:00',
  `status` int(11) NOT NULL DEFAULT 1,
  `usr_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`pro_id`, `barcode`, `pro_brand`, `pro_generic`, `pro_formulation`, `pro_packaging`, `pro_unit_price`, `pro_reorder_level`, `pro_total_qty`, `cat_id`, `date_added`, `time_added`, `date_modified`, `time_modified`, `status`, `usr_id`) VALUES
(10001, '', 'AMX', 'Amoxicillin', '100mg/ml PFS Drops', 'Bot. of 10ml', 72.00, 45, 60, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10007, '', 'CFA', 'Cefalexin', '125mg/5ml PFSuspension', 'Bot. of 60ml', 110.00, 50, 220, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10006, '', 'CFA', 'Cefalexin', '100mg/ml PFS Drops', 'Bot. of 10ml', 83.00, 65, 250, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10005, '', 'CFC', 'Cefaclor', '250mg/5ml  Granules for Susp.', 'Bot. of 60ml', 398.00, 80, 235, 10, '0000-00-00', '00:00:00', '2017-10-04', '20:54:16', 1, 1002),
(10003, '', 'AMX', 'Amoxicillin', '500mg  Capsule', 'Box. of 100\'s', 11.00, 50, 29, 10, '0000-00-00', '00:00:00', '2017-10-06', '04:11:46', 1, 1002),
(10004, '', 'CFC', 'Cefaclor', '50mg/ml PFS Drops 20ml', 'Bot. of 20ml', 230.00, 80, 184, 10, '0000-00-00', '00:00:00', '2017-10-06', '04:11:46', 1, 1002),
(10002, '4800390092113', 'AMX', 'Amoxicillin', '250mg/5ml  Powder for Susp.', 'Bot. of 60ml', 116.00, 45, 75, 10, '0000-00-00', '00:00:00', '2017-09-13', '05:00:50', 1, 1002),
(10008, '', 'CFA', 'Cefalexin', '250mg/5ml PFSuspension', 'Bot. of 60ml', 154.00, 50, 254, 10, '0000-00-00', '00:00:00', '2017-10-06', '04:11:46', 1, 1002),
(10009, '', 'CFA', 'Cefalexin', '500mg Capsule', 'Box. of 100\'s', 13.00, 50, 245, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10010, '', 'GLOCLAV', 'Co-Amoxiclav', '500mg/125mg Tablet', 'Box of 18\'s', 38.00, 50, 300, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10011, '', 'AZIFAST', 'Azithromycin (as dihydrate)', '500mg/125mg Tablet', 'Box of 30\'s', 60.00, 50, 20, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10012, '', 'ZEFCID', 'Cefuroxime', '500mg Tablet\r\n', 'Box of 30\'s', 47.00, 50, 200, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10013, '', 'MYCEFIX', 'Cefixime', '200mg Tablet', 'Box. of 100\'s', 64.00, 25, 210, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10014, '', 'FLOXA-200', 'Ofloxacin', '200mg Tablet', 'Box of 100\'s', 74.00, 50, 65, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10015, '', 'FLOXA-400', 'Ofloxacin', '400mg Tablet', 'Box of 100\'s', 74.00, 50, 100, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10016, '', 'LEVOTAB', 'Levofloxacin', '750mg Film-Coated Tablet', 'Box of  30\'s', 98.00, 50, 240, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10017, '', 'ZEFAXIM', 'Cefixime', '100mg/5ml Powder for Suspension', 'Bot. of 60ml', 550.00, 30, 120, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10018, '', 'XIMETAZ', 'Cefixime (as trihydrate)', '100mg/5ml Powder for Suspension', 'Bot. of 60ml', 550.00, 50, 220, 10, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10019, '', 'XANGINART', 'Trimetazidime', '35mg Film coated Tablet', 'Box of 60\'s', 20.00, 50, 170, 11, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10020, '', 'NYSTRIN', 'Nystatin', '100,000 units/mL 30mL Oral  Drops Suspension', 'Bot. of 30mL', 300.00, 50, 240, 12, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10021, '4806511170364', 'MFE', 'Mefenamic Acid', '50mg/5ml Suspension', 'Bot. of 60ml', 55.00, 25, 700, 13, '0000-00-00', '00:00:00', '2017-09-13', '05:00:20', 1, 1002),
(10022, '', 'MFE', 'Mefenamic Acid', '500mg Capsule', 'Box. of 100\'s', 4.00, 50, 200, 13, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10023, '', 'PRC', 'Paracetamol', '100mg/mL Drops', 'Bot. of 15ml', 55.00, 80, 200, 13, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10024, '', 'PRC', 'Paracetamol', '125mg/5ml Suspension', 'Bot. of 60ml', 57.00, 80, 150, 13, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10025, '', 'PRC', 'Paracetamol', '250mg/5ml Suspension', 'Bot. of 60ml', 62.00, 80, 180, 13, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10026, '', 'AMB', 'Ambroxol', '6mg/mL Drops', 'Bot. of 15ml', 56.00, 45, 100, 14, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10027, '', 'AMB', 'Ambroxol', '15mg/5ml Syrup', 'Bot. of 60ml', 63.00, 45, 80, 14, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10028, '', 'AMB', 'Ambroxol', '30mg Tablet', 'Box. of 100\'s', 3.00, 50, 75, 14, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10029, '', 'CRB', 'Carbocisteine', '50mg/ml Drops', 'Bot. of 15ml', 55.00, 50, 75, 14, '0000-00-00', '00:00:00', '2017-10-05', '02:47:56', 1, 1002),
(10030, '', 'CRB', 'Carbocisteine', '100mg/5ml Syrup', 'Bot. of 60ml', 61.00, 50, 75, 14, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10031, '', 'CRB', 'Carbocisteine', '250mg/5ml Suspension', 'Bot. of 60ml', 72.00, 50, 60, 14, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10032, '', 'CRB', 'Carbocisteine', '500mg Capsule', 'Box. of 100\'s', 6.00, 65, 42, 14, '0000-00-00', '00:00:00', '2017-10-07', '01:02:29', 1, 1002),
(10033, '', 'SGX', 'Salbutamol/Guaifenesin', '1mg/50mg/5ml Syrup', 'Bot. of 60ml', 78.00, 30, 105, 14, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10034, '', 'SGX', 'Salbutamol/Guaifenesin', '2mg/100mg Capsule', 'Box. of 100\'s', 8.00, 50, 165, 14, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10035, '', 'COFNIL', 'Salbutamol as Sulphate Bromhexine HCI Guaifenesin', ' 2mg/4mg/100mg per 10mL', 'Bot. of 60ml', 105.00, 50, 350, 14, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10036, '', 'NEOCOXIB', 'Celecoxib', '200mg Capsule', 'Box. of 100\'s', 29.00, 50, 285, 15, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10037, '', 'MEDOGREL', 'Clopidogrel', '75mg Film Coated Tablet ', 'Box of 30\'s', 19.00, 80, 200, 16, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10038, '', 'ERGON', 'Methylergometrine Maleate', '125mcg Film Coated Tablet', 'Box of 50\'s', 3.00, 25, 75, 17, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10039, '', 'ACCELAC', 'Lactulose ', '3.35g/5m', 'Box of 120mL', 398.00, 30, 79, 18, '0000-00-00', '00:00:00', '2017-10-07', '03:34:17', 1, 1002),
(10040, '', 'XYLOSE', 'Lactulose', '3.35g/5mL', 'Box of 100mL', 398.00, 25, 100, 18, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10041, '', 'AZAL', 'Azithromycin  (as dihydrate)', '500mg Powder for Injection (IV)', '500mg/Vial', 885.00, 50, 140, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10042, '', 'NORBIT', 'Norepinephrine (as bitartrate)', '1mg/mL (2mg/2mL) Sol. For Inj.', '2mL/amps', 480.00, 70, 156, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10043, '', 'SUPENEM', 'Meropenem  (as trihydrate)', '1g Powder for Injection', '1g/vial', 1440.00, 50, 120, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10044, '', 'CLINDARENE 300', 'Clindamycin (as Phosphate)', '150mg/mL (300mg/2mL) Solution for Injection (IM/IV)', '2mL/amp', 420.00, 50, 150, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10045, '', 'CLINDARENE 600', 'Clindamycin (as Phosphate) ', '150mg/mL (600mg/4mL) Solution for Injection (IM/IV)', '4mL/amp', 540.00, 50, 150, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10046, '', 'CLINDATEC 600mg', 'Clindamycin (as Phosphate)', '150mg/mL (600mg/4mL) Solution for Injection (IM/IV)', '4mL/amp', 540.00, 25, 160, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10047, '', 'CORSIN- 600', 'Clindamycin (as Phosphate) ', '150mg/mL (600mg/4mL) Solution for Injection (IM/IV)', '4mL/amp', 540.00, 50, 175, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10048, '', 'CORTIX', 'Dexamethasone Sodium Phosphate', '5mg/mL Solution for Inj', '1ml/amp', 103.00, 25, 200, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10049, '', 'ONDEX', 'Dexamethasone sodium phosphate ', '4mg/mL Sol. for Inj', 'amp', 103.00, 50, 180, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10050, '8904163910041', 'PIPERCIL 4.5', 'Piperacillin (as sodium) + Tazobactam (as sodium)', '4g/500mg Pow. For Inj.', 'Vial', 525.00, 30, 500, 19, '0000-00-00', '00:00:00', '2017-10-07', '02:38:20', 1, 1002),
(10051, '', 'RABACTAM', 'Piperacillin (as sodium) + Tazobactam (as sodium) ', '4g/500mg Pow. For Inj.', 'Vial', 525.00, 50, 260, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10052, '', 'ZEFTACARE', 'Ceftazidime (as pentahydrate) ', '1g Powder for Injection (IM/IV)', '1g/vial', 450.00, 65, 85, 19, '0000-00-00', '00:00:00', '2017-10-07', '04:02:14', 1, 1002),
(10053, '', 'CEFZON', 'Ceftriaxone (as sodium) ', '1g Powder for Injection (IV/IM)', '1g/vial', 550.00, 25, 300, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10054, '', 'CEFTRINA', 'Ceftriaxone (as sodium) ', '1g Powder for Injection (IV/IM)', '1g/vial', 385.00, 50, 293, 19, '0000-00-00', '00:00:00', '2017-09-13', '05:50:01', 1, 1002),
(10055, '', 'ROMECIL', 'Imipenem (as monohydrate) + Cilastatin (as sodium) ', '500mg/500mg Powder for Injection (IV infusion)', 'Vial', 1700.00, 50, 60, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10056, '', 'ROMECIL', '500mg/500mg Powder for Injection (IV infusion)', '500mg/500mg Powder for Injection (IV infusion)', 'Vial', 1700.00, 65, 88, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10057, '', 'DOBUMEAN', 'Dobutamine Hydrochloride', '12.5mg/mL (250mg/20mL) Solution for inj. (IV infusion)', '20mL/vial', 1450.00, 50, 90, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10058, '', 'ADIGO', 'Digoxin', '250mcg/mL Solution for Injection (IM/IV) ', 'amp', 165.00, 50, 40, 19, '0000-00-00', '00:00:00', '2017-08-24', '22:12:03', 1, 1002),
(10059, '', 'NUTRILON', ' Solution for IV Injection', '5% Amino Acids in 5% Sorbitol', 'Bot. of 500mL', 850.00, 80, 160, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10060, '', 'NUTRIMIN ', ' Amino Acids in  Sorbitol', 'Solution for IV Injection 20mL', 'Bot. of 20mL', 450.00, 50, 170, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10061, '', 'MPSS 1000', 'Methylprednisone (as sodium succinate)', '1g Pow. for Inj. w/ diluent', 'Vial', 4200.00, 50, 100, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10062, '4806517950878', 'AMPITREX', 'Ampicillin (as sodium)', '1g Powder for Injection (IM/IV)', '1g/vial', 40.00, 80, 212, 19, '0000-00-00', '00:00:00', '2017-10-07', '02:43:46', 1, 1002),
(10063, '', 'SUMPILIN', 'Ampicillin Sodium', '500mg Powder for Injection', 'Vial', 40.00, 50, 99, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10064, '', 'SODAMPEN 250', 'Ampicilin Sodium 250mg Powder for Injection BP I.M./I.V. ', '250mg Powder for Injection BP I.M./I.V. ', 'Vial', 58.00, 50, 80, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10065, '', 'SODAMPEN 1g', 'Ampicillin Sodium', '1g Powder for Injection (IM/IV)', 'Vial', 60.00, 80, 320, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10066, '', 'AMPICARE', 'Ampicillin (as sodium) + Sulbactam (as sodium)', '500mg/250mg Powder for Inj. (IM/IV)', 'Vial', 198.00, 65, 200, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10067, '', 'AMPINEX 750mg', 'Ampicillin Sodium + Sulbactam Sodium', '500mg/250mg Powder  for Inj. (IM/IV)', 'Vial', 199.00, 50, 180, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10068, '', 'AMPINEX 1.5', 'Ampicillin Sodium + Sulbactam Sodium ', '500mg/250mg Powder  for Inj. (IM/IV)', 'Vial', 199.00, 50, 100, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10069, '', 'GRAVITAM', 'Ampicillin Sodium + Sulbactam Sodium ', '1g/500mg Powder  for Inj. (IM/IV)', 'Vial', 179.00, 50, 70, 19, '0000-00-00', '00:00:00', '2017-10-05', '05:24:35', 1, 1002),
(10070, '', 'CEFAZIN', 'Cefazolin Sodium 1g Powder for Injection (IM/IV)', '1g/500mg Powder  for Inj. (IM/IV)', 'Vial', 183.00, 50, 20, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10071, '', 'AMICARE', 'Amikacin as Sulfate ', '125/mL (250mg/2mL) sol. For Inj. IM/IV', '2mL amp', 89.00, 50, 80, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10072, '', 'HYDROZONE', 'Hydrocortisone (as sodium succinate)', '100mg Powder for Injection', 'Vial', 80.00, 50, 90, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10073, '', 'CORBAL', 'Hydrocortisone (as sodium succinate) ', '100mg Powder for Injection', 'Vial', 81.00, 50, 100, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10074, '', 'ASCOL', 'Citicoline 250mg/mL Injection', '250mg/mL Injection', '4mL/amp', 83.00, 50, 120, 19, '0000-00-00', '00:00:00', '2017-10-04', '14:08:27', 1, 1002),
(10075, '', 'KETOLON', 'Ketorolac Trometarol ', '30mg/mL Solution for Injection (IM/IV) ', '1ml/amp', 93.00, 50, 80, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10076, '', 'ACIFOX', 'Cefoxitin (as sodium) ', '1g Powder for Injection IM/IV', '1g/vial', 720.00, 50, 9, 19, '0000-00-00', '00:00:00', '2017-09-30', '16:28:45', 1, 1002),
(10077, '', 'ULTRAGYL', 'Metronidazole', '5mg/mL Sol. for Infusion', 'Bot. of 100mL', 160.00, 50, 0, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10078, '', 'METRODIME', 'Metronidazole', '500mg/100mL Sol. for Infusion  (5mg/mL)', 'Bot. of 100mL', 160.00, 30, 230, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10079, '', 'SELEGESIC', 'Paracetamol 150mg/mL (300mg/2mL) Solution for Injection (I.M/I.V)', '150mg/mL (300mg/2mL) Solution for Injection (I.M/I.V)', 'Box of 10\'s', 160.00, 80, 66, 19, '0000-00-00', '00:00:00', '2017-10-04', '01:04:04', 1, 1002),
(10080, '', 'NICARIGHT', 'Nicardipine Hydrochloride 1mg/mL Solution for IV Injection 10mL', '1mg/mL Solution for IV Injection 10mL', 'Box of 5 amps', 800.00, 50, 150, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10081, '', 'NEUPIME', 'Cefepime (as hydrocholoride) 1g/vial Powder for Injection', '1g/vial Powder for Injection', '1g/vial', 490.00, 50, 274, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10082, '', 'GROXIME', 'Cefuroxime Sodium', '750mg Powder for Injection', 'Vial', 280.00, 30, 60, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10083, '', 'TRANEXAN', 'Tranexamic Acid', '100mg/mL ( 500mg/5mL) Sol. For. Inj. (IV)', 'Box of 10 amps', 275.00, 70, 250, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10084, '', 'RANIVIC', 'Ranitidine', '50mg/2mL Sterile Solution for Injection', 'amp', 50.00, 25, 50, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10085, '', 'AGLOTAC', 'Ranitidine', '50mg/2mL Sterile Solution for Injection', 'amp', 50.00, 50, 21, 19, '0000-00-00', '00:00:00', '2017-10-04', '20:47:53', 1, 1002),
(10086, '', 'WESTRAN', 'Ranitidine', '50mg/2mL Sterile Solution for Injection', 'amp', 50.00, 50, 120, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10087, '', 'OXAN', 'Oxacillin (as sodium) ', '500mg Powder for Injection IM/IV', '500mg/Vial', 185.00, 50, 90, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10088, '', 'VECTOPLEX', 'Thiamine Hcl + Pyridoxine Hcl + Cyanocobalamin + Nicotinamide + D-Panthenol', '33.3mg/33.3mg/333 mcg/ 20mg/5 mg per mL Solution for Inj. (IM/IV) 3mL', 'Box of 5 amps', 60.00, 50, 275, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10090, '', 'BENZAPEN', 'Benzathine Benzylpenicilin', '1,200,000 Units (IM)', 'vial', 60.00, 50, 90, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10091, '', 'WESTROBEX', 'GENTAMICIN SULFATE', '40mg/mL (80mg/2mL) Solution for Inj', 'Vial', 120.00, 50, 150, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10092, '', 'GENTACARE', 'GENTAMICIN SULFATE', '80mg/2mL (40mg/mL) Solution for inj.', '2mL/amps', 120.00, 50, 190, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10093, '', 'SPAMEX', 'Hyoscine -N-Butylbromide', '20mg/mL Solution for injection', 'amp', 160.00, 50, 75, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10094, '', 'HYPHEN', 'Diphenhydramine Hydochloride', '50mg/mL Solution for injection', '1ml/amp', 180.00, 50, 200, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10095, '', 'METOCLOR', 'Metoclopramide hydrochloride ', '5mg/mL (10mg/2mL) Solution for injection', '2ml/amp', 185.00, 25, 175, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10096, '', 'CEFOLAN', 'Cefotaxime Sodium', '1 gram Powder for Injection', 'Vial', 158.00, 50, 215, 19, '0000-00-00', '00:00:00', '2017-10-02', '02:02:21', 1, 1002),
(10097, '', 'OMECISE', 'Omeprazole Sodium', '40mg Lyophilized Powder for Inj', 'Vial', 291.00, 50, 200, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10098, '', 'OMCARE', 'Omeprazole Sodium', '40mg Lyophilized Powder for Inj (IV)', '40mg/vial', 291.00, 30, 310, 19, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10099, '', 'CONGESTRIL', 'Chlorphenaramine Maleate', '1mg/Dextromethorpan..15mg/', 'Bot of 60ml', 100.00, 65, 392, 20, '0000-00-00', '00:00:00', '2017-10-01', '19:09:07', 1, 1002),
(10100, '', 'CONGESTRIL', 'Paracetamol', '100mg/Phenylpropanolamine..12.5mg   Syrup', 'Bot of 60ml', 100.00, 80, 400, 20, '0000-00-00', '00:00:00', '2017-10-07', '04:03:10', 1, 1002),
(10101, '', 'CONGESTRIL Forte', 'Chlorphenaramine Maleate', '1mg/Dextromethorpan..15mg/', 'Box of 100\'s', 11.00, 50, 335, 20, '0000-00-00', '00:00:00', '2017-10-06', '04:25:22', 1, 1002),
(10102, '', 'CONGESTRIL Forte', 'Paracetamol', '325mg/Phenylpropanolamine. 10mg Cap.', 'Box of 100\'s', 11.00, 80, 175, 20, '0000-00-00', '00:00:00', '2017-10-07', '00:49:40', 1, 1002),
(10103, '', 'PPB', 'Phenylpropanolamine Hcl Phenylephrine Hcl Brompheniramine Maleate', '2.5mg/2.5mg/2mg per mL Syrup (Oral Drops)', 'Bot. of 15mL', 82.00, 50, 150, 20, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10105, '', 'EMISET', 'Domperidone Maleate', '10mg Film Coated Tablet', 'Box of 100\'s', 9.00, 50, 80, 21, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10106, '', 'PERISPA', 'Eperisone Hcl 50mg Sugar Coated Tablet', '50mg Sugar Coated Tablet', 'Box of 30\'s', 22.00, 30, 62, 22, '0000-00-00', '00:00:00', '2017-10-04', '01:04:04', 1, 1002),
(10107, '', 'BRONEX', 'Budesonide 250mcg/mL Nebulizing Suspension', '250mcg/mL Nebulizing Suspension', '2ml/amps', 23.00, 50, 70, 23, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10108, '', 'MUPIBAN', 'Mupirocin', '20mg/g (2.0% w/w) Ointment 5g', '5g/tube', 240.00, 70, 140, 24, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10109, '', 'TOBYN-D', 'Tobramycin + Dexamethasone', '3mg/1mg (0.3%/0.1%)per mL Opthalmic Sol. (Drops)', '10ml/bot', 33.00, 70, 210, 25, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10110, '', 'APPETOLL', 'Vitamin B Complex + Iron + Buclizine HCl 100\'s', 'HCl 100\'s', 'Box of 100\'s', 16.00, 50, 120, 26, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10111, '', 'MYREVIT-B Forte', 'Vit. B1..500mg/Vit. B6..250mg/Vit. B12..1mg  Tab.', '500mg/Vit. B6..250mg/Vit. B12..1mg  Tab.', 'Box 0f 100\'s', 9.00, 50, 200, 26, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10112, '', 'CELERPLEX', '(Vitamin B-Complex + Lysine + Buclizine ) Capsule', '500mg/Vit. B6..250mg/Vit. B12..1mg  Tab.', 'Box 0f 100\'s', 14.00, 50, 20, 26, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10113, '', 'Alamin FeZ', 'Amino Acids + Multivitamins + Minerals Capsule', '500mg/Vit. B6..250mg/Vit. B12..1mg  Tab.', 'Box 0f 20\'s', 16.00, 50, 48, 26, '0000-00-00', '00:00:00', '2017-10-07', '01:09:00', 1, 1002),
(10114, '', 'OBYCON', 'Ferrous Fumarat', '500mg+ Vitamins B2 ,2mg + B12  3mcg + Folic Acid 230mcg (capsule)', 'Box 0f 100\'s', 7.00, 50, 280, 26, '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1002),
(10124, '4806515270428', 'CLX', 'Cloxacillin Sodium', '125mg/5ml Powder for Suspension', '60 ml bottle', 85.00, 50, 50, 10, '2017-09-13', '04:59:28', '0000-00-00', '00:00:00', 1, 0),
(10125, '12', 'JOEY', 'RODRIGO', '125mg/5ml Powder for Suspension', '60 ml bottle', 1000.00, 40, 0, 13, '2017-09-13', '14:05:04', '2017-10-10', '22:25:53', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prod_supplier`
--

CREATE TABLE `tbl_prod_supplier` (
  `p_supplier_id` int(10) UNSIGNED NOT NULL,
  `pro_id` int(11) NOT NULL DEFAULT 0,
  `supplier_id` int(11) NOT NULL DEFAULT 0,
  `lot_number` varchar(50) NOT NULL DEFAULT '',
  `quantity` int(11) NOT NULL DEFAULT 0,
  `date_added` date NOT NULL DEFAULT '0000-00-00',
  `time_added` time NOT NULL DEFAULT '00:00:00',
  `usr_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_prod_supplier`
--

INSERT INTO `tbl_prod_supplier` (`p_supplier_id`, `pro_id`, `supplier_id`, `lot_number`, `quantity`, `date_added`, `time_added`, `usr_id`) VALUES
(1000000001, 10039, 1002, '1111', 10, '2017-07-09', '21:51:58', 1002),
(1000000002, 10076, 1002, '2222', 18, '2017-07-09', '21:51:58', 1002),
(1000000003, 10058, 1002, '3333', 40, '2017-07-09', '21:51:58', 1002),
(1000000004, 10039, 1005, '1111', 40, '2017-07-09', '21:54:08', 1002),
(1000000005, 10039, 1002, '1111', 20, '2017-07-09', '21:55:07', 1002),
(1000000006, 10101, 1001, '1234', 50, '2017-07-09', '07:36:38', 1002),
(1000000007, 10039, 1007, '5858', 30, '2017-07-09', '03:09:16', 1002),
(1000000008, 10101, 1002, '7896', 50, '2017-07-09', '23:46:55', 1002),
(1000000009, 10101, 1003, '1111', 50, '2017-07-12', '02:21:03', 1002),
(1000000010, 10039, 1004, '1111', 50, '2017-07-17', '00:03:28', 1002),
(1000000011, 10039, 1005, '1212', 30, '2017-07-19', '23:30:02', 1002),
(1000000012, 10100, 1005, '7777', 75, '2017-07-27', '17:53:12', 1002),
(1000000013, 10039, 1006, '9090', 19, '2017-07-31', '10:17:19', 1002),
(1000000014, 10076, 1006, '5050', 20, '2017-07-31', '10:17:19', 1002),
(1000000015, 10039, 1002, '85594', 20, '2017-07-31', '12:23:09', 1002),
(1000000016, 10085, 1005, '4965', 50, '2017-08-02', '04:21:17', 1002),
(1000000017, 10090, 1005, '4686', 50, '2017-08-02', '04:21:17', 1002),
(1000000018, 10107, 1008, '9685', 50, '2017-08-04', '14:39:39', 1002),
(1000000019, 10102, 1002, '8989', 100, '2017-08-24', '22:20:42', 1002),
(1000000020, 10039, 1003, '1111', 50, '2017-09-03', '11:30:35', 1002),
(1000000026, 10039, 1002, '85594', 25, '2017-09-09', '09:06:59', 1002),
(1000000027, 10076, 1002, '789SAS', 60, '2017-09-13', '05:28:25', 1002),
(1000000028, 10058, 1002, '98ASJDNS', 35, '2017-09-13', '05:28:25', 1002),
(1000000029, 10113, 1002, '87SAD', 50, '2017-09-13', '05:28:25', 1002),
(1000000030, 10067, 1002, '125268', 80, '2017-09-13', '05:28:25', 1002),
(1000000031, 10054, 1008, 'POS982A', 40, '2017-09-13', '05:29:15', 1002),
(1000000032, 10110, 1003, 'ASD001', 20, '2017-09-13', '09:17:37', 1002),
(1000000033, 10074, 1003, 'ASD002', 20, '2017-09-13', '09:17:37', 1002),
(1000000034, 10041, 1003, 'ASD014', 20, '2017-09-13', '09:17:37', 1002),
(1000000035, 10110, 1005, 'ASD001', 20, '2017-09-13', '09:20:09', 1002),
(1000000036, 10074, 1005, 'ASD122', 20, '2017-09-13', '09:20:09', 1002),
(1000000037, 10041, 1005, 'ASD121', 20, '2017-09-13', '09:20:09', 1002),
(1000000038, 10011, 1005, 'ASD004', 20, '2017-09-13', '09:20:09', 1002),
(1000000039, 10090, 1006, 'ASD013', 20, '2017-09-13', '09:21:29', 1002),
(1000000040, 10107, 1006, 'ASD006', 20, '2017-09-13', '09:21:29', 1002),
(1000000041, 10070, 1006, 'ASD007', 20, '2017-09-13', '09:21:29', 1002),
(1000000042, 10096, 1007, 'ASD010', 200, '2017-09-13', '09:23:39', 1002),
(1000000043, 10054, 1007, 'ASD011', 200, '2017-09-13', '09:23:39', 1002),
(1000000044, 10053, 1007, 'ASD012', 200, '2017-09-13', '09:23:39', 1002),
(1000000045, 10090, 1008, 'ASD005', 20, '2017-09-13', '09:26:44', 1002),
(1000000046, 10041, 1008, 'ASD003', 20, '2017-09-13', '09:26:44', 1002),
(1000000047, 10053, 1008, 'ASD015', 20, '2017-09-13', '09:26:44', 1002),
(1000000048, 10112, 1001, 'ASD016', 20, '2017-09-13', '09:30:58', 1002),
(1000000049, 10007, 1001, 'ASD017', 20, '2017-09-13', '09:30:58', 1002),
(1000000050, 10074, 1001, 'ASD018', 20, '2017-09-13', '09:30:58', 1002),
(1000000051, 10009, 1004, 'ASD020', 20, '2017-09-13', '09:36:19', 1002),
(1000000052, 10073, 1004, 'ASD021', 20, '2017-09-13', '09:36:19', 1002),
(1000000053, 10096, 1004, 'ASD022', 20, '2017-09-13', '09:36:19', 1002),
(1000000054, 10050, 1002, '123456', 500, '2017-09-13', '14:11:44', 1002),
(1000000055, 10124, 1006, 'df32532', 50, '2017-09-15', '13:53:03', 1002),
(1000000056, 10039, 1006, '7658745', 80, '2017-09-15', '13:53:03', 1002),
(1000000057, 10052, 1008, '19191919', 85, '2017-09-21', '14:45:01', 1003),
(1000000058, 10012, 1008, '18181818', 200, '2017-09-21', '14:45:01', 1003),
(1000000059, 10017, 1008, '17171717', 120, '2017-09-21', '14:45:01', 1003),
(1000000060, 10040, 1004, '292929', 100, '2017-09-21', '14:46:33', 1003),
(1000000061, 10018, 1004, '282828', 220, '2017-09-21', '14:46:33', 1003),
(1000000062, 10019, 1004, '272727', 170, '2017-09-21', '14:46:33', 1003),
(1000000063, 10091, 1006, '2424242', 150, '2017-09-21', '14:49:37', 1003),
(1000000064, 10086, 1006, '252525', 120, '2017-09-21', '14:49:37', 1003),
(1000000065, 10026, 1006, '262626', 100, '2017-09-21', '14:49:37', 1003),
(1000000066, 10027, 1006, '212121', 80, '2017-09-21', '14:49:37', 1003),
(1000000067, 10028, 1006, '222222', 75, '2017-09-21', '14:49:37', 1003),
(1000000068, 10001, 1006, '232323', 60, '2017-09-21', '14:49:37', 1003),
(1000000069, 10003, 1006, '313131', 50, '2017-09-21', '14:49:37', 1003),
(1000000070, 10002, 1006, '3232323', 75, '2017-09-21', '14:49:37', 1003),
(1000000071, 10100, 1008, '696969', 90, '2017-09-21', '14:51:27', 1003),
(1000000072, 10029, 1008, '686868', 85, '2017-09-21', '14:51:27', 1003),
(1000000073, 10030, 1008, '676767', 75, '2017-09-21', '14:51:27', 1003),
(1000000074, 10031, 1008, '66666', 60, '2017-09-21', '14:51:27', 1003),
(1000000075, 10032, 1008, '6565656', 50, '2017-09-21', '14:51:27', 1003),
(1000000076, 10074, 1005, '8558585', 80, '2017-09-21', '14:53:59', 1003),
(1000000077, 10041, 1005, '8787878', 80, '2017-09-21', '14:53:59', 1003),
(1000000078, 10110, 1005, '898989', 80, '2017-09-21', '14:53:59', 1003),
(1000000079, 10054, 1005, '888888', 80, '2017-09-21', '14:53:59', 1003),
(1000000080, 10053, 1005, '848484', 80, '2017-09-21', '14:53:59', 1003),
(1000000081, 10068, 1001, '845a58', 100, '2017-09-21', '14:56:48', 1003),
(1000000082, 10067, 1001, 'abc89', 100, '2017-09-21', '14:56:48', 1003),
(1000000083, 10071, 1001, 'f785fsa', 80, '2017-09-21', '14:56:48', 1003),
(1000000084, 10082, 1001, 'ert895s', 60, '2017-09-21', '14:56:48', 1003),
(1000000085, 10073, 1001, '885562sa', 80, '2017-09-21', '14:56:48', 1003),
(1000000086, 10075, 1001, '12s5s4d', 80, '2017-09-21', '14:56:48', 1003),
(1000000087, 10066, 1003, '494847', 200, '2017-09-21', '15:03:04', 1003),
(1000000088, 10044, 1003, '456ASD', 150, '2017-09-21', '15:03:04', 1003),
(1000000089, 10046, 1003, 'ATR5456', 160, '2017-09-21', '15:03:04', 1003),
(1000000090, 10047, 1003, 'ERQ8456', 175, '2017-09-21', '15:03:04', 1003),
(1000000091, 10099, 1003, 'POS456', 400, '2017-09-21', '15:03:04', 1003),
(1000000092, 10100, 1003, 'PLSK785', 250, '2017-09-21', '15:03:04', 1003),
(1000000093, 10101, 1003, 'ERF7854', 300, '2017-09-21', '15:03:04', 1003),
(1000000094, 10102, 1003, 'HDT456', 150, '2017-09-21', '15:03:04', 1003),
(1000000095, 10021, 1003, 'TE2123', 700, '2017-09-21', '15:03:04', 1003),
(1000000096, 10022, 1003, 'LOP656', 200, '2017-09-21', '15:03:04', 1003),
(1000000097, 10061, 1003, 'PWWW85', 100, '2017-09-21', '15:03:04', 1003),
(1000000098, 10108, 1003, '456ASH', 140, '2017-09-21', '15:03:04', 1003),
(1000000099, 10080, 1003, 'QYD789', 150, '2017-09-21', '15:03:04', 1003),
(1000000100, 10095, 1003, 'KL4474', 175, '2017-09-21', '15:03:04', 1003),
(1000000101, 10037, 1003, 'KLS888', 200, '2017-09-21', '15:03:04', 1003),
(1000000102, 10007, 1007, '77878', 200, '2017-09-21', '15:04:38', 1003),
(1000000103, 10006, 1007, '778DA', 250, '2017-09-21', '15:04:38', 1003),
(1000000104, 10008, 1007, '77SDA', 275, '2017-09-21', '15:04:38', 1003),
(1000000105, 10009, 1007, '887ASD', 225, '2017-09-21', '15:04:38', 1003),
(1000000106, 10062, 1005, '56QQQ', 200, '2017-09-21', '15:05:47', 1003),
(1000000107, 10005, 1005, 'EEE54', 240, '2017-09-21', '15:05:47', 1003),
(1000000108, 10004, 1005, 'RRR45', 200, '2017-09-21', '15:05:47', 1003),
(1000000109, 10045, 1004, 'MM111', 150, '2017-09-21', '15:12:09', 1003),
(1000000110, 10035, 1004, 'MM222', 350, '2017-09-21', '15:12:09', 1003),
(1000000111, 10048, 1004, 'MM333', 200, '2017-09-21', '15:12:09', 1003),
(1000000112, 10057, 1004, 'MM444', 90, '2017-09-21', '15:12:09', 1003),
(1000000113, 10105, 1004, 'MM555', 80, '2017-09-21', '15:12:09', 1003),
(1000000114, 10038, 1004, 'MM666', 75, '2017-09-21', '15:12:09', 1003),
(1000000115, 10014, 1004, 'MM777', 65, '2017-09-21', '15:12:09', 1003),
(1000000116, 10015, 1004, 'MM888', 100, '2017-09-21', '15:12:09', 1003),
(1000000117, 10092, 1004, 'MM999', 190, '2017-09-21', '15:12:09', 1003),
(1000000118, 10010, 1004, 'MM123', 300, '2017-09-21', '15:12:09', 1003),
(1000000119, 10069, 1004, 'MM654', 80, '2017-09-21', '15:12:09', 1003),
(1000000120, 10072, 1004, 'MM789', 90, '2017-09-21', '15:12:09', 1003),
(1000000121, 10094, 1008, 'RRR111', 200, '2017-09-21', '15:21:57', 1003),
(1000000122, 10016, 1008, 'RRR222', 240, '2017-09-21', '15:21:57', 1003),
(1000000123, 10078, 1008, 'RRR333', 230, '2017-09-21', '15:21:57', 1003),
(1000000124, 10013, 1008, 'RRR444', 210, '2017-09-21', '15:21:57', 1003),
(1000000125, 10111, 1008, 'RRR555', 200, '2017-09-21', '15:21:57', 1003),
(1000000126, 10036, 1008, 'RRR666', 285, '2017-09-21', '15:21:57', 1003),
(1000000127, 10081, 1008, 'RRR777', 274, '2017-09-21', '15:21:57', 1003),
(1000000128, 10042, 1008, 'RRR888', 156, '2017-09-21', '15:21:57', 1003),
(1000000129, 10059, 1008, 'RRR999', 160, '2017-09-21', '15:21:57', 1003),
(1000000130, 10060, 1008, 'RRR123', 170, '2017-09-21', '15:21:57', 1003),
(1000000131, 10020, 1008, 'RRR321', 240, '2017-09-21', '15:21:57', 1003),
(1000000132, 10114, 1008, 'RR56R', 280, '2017-09-21', '15:21:57', 1003),
(1000000133, 10098, 1008, 'RRR789', 310, '2017-09-21', '15:21:57', 1003),
(1000000134, 10049, 1003, 'DDD111', 180, '2017-09-21', '15:28:16', 1003),
(1000000135, 10087, 1003, 'DDD222', 90, '2017-09-21', '15:28:16', 1003),
(1000000136, 10106, 1003, 'DDD333', 80, '2017-09-21', '15:28:16', 1003),
(1000000137, 10103, 1003, 'DDD444', 150, '2017-09-21', '15:28:16', 1003),
(1000000138, 10023, 1003, 'DDD555', 200, '2017-09-21', '15:28:16', 1003),
(1000000139, 10024, 1003, 'DDD666', 150, '2017-09-21', '15:28:16', 1003),
(1000000140, 10025, 1003, 'DDD777', 180, '2017-09-21', '15:28:16', 1003),
(1000000141, 10051, 1003, 'DDD888', 260, '2017-09-21', '15:28:16', 1003),
(1000000142, 10084, 1003, 'DDD999', 50, '2017-09-21', '15:28:16', 1003),
(1000000143, 10055, 1003, 'KKK111', 60, '2017-09-21', '15:28:16', 1003),
(1000000144, 10056, 1003, 'KKK222', 88, '2017-09-21', '15:28:16', 1003),
(1000000145, 10079, 1003, 'KKK333', 75, '2017-09-21', '15:28:16', 1003),
(1000000146, 10033, 1003, 'KKK444', 105, '2017-09-21', '15:28:16', 1003),
(1000000147, 10034, 1003, 'KKK555', 165, '2017-09-21', '15:28:16', 1003),
(1000000148, 10097, 1008, 'PPP111', 200, '2017-09-21', '15:32:06', 1003),
(1000000149, 10065, 1008, 'PPP222', 320, '2017-09-21', '15:32:06', 1003),
(1000000150, 10064, 1008, 'PPP333', 80, '2017-09-21', '15:32:06', 1003),
(1000000151, 10093, 1008, 'PPP444', 75, '2017-09-21', '15:32:06', 1003),
(1000000152, 10063, 1008, 'PPP555', 99, '2017-09-21', '15:32:06', 1003),
(1000000153, 10043, 1008, 'PPP666', 120, '2017-09-21', '15:32:06', 1003),
(1000000154, 10109, 1008, 'PPP777', 210, '2017-09-21', '15:32:06', 1003),
(1000000155, 10083, 1008, 'PPP888', 250, '2017-09-21', '15:32:06', 1003),
(1000000156, 10088, 1008, 'PPP999', 275, '2017-09-21', '15:32:06', 1003),
(1000000157, 10062, 1027, '1855845h', 40, '2017-10-07', '02:40:24', 1002);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `usr_id` int(10) UNSIGNED NOT NULL,
  `usr_username` varchar(8) NOT NULL DEFAULT '',
  `usr_password` varchar(100) NOT NULL DEFAULT '',
  `usr_firstname` varchar(180) NOT NULL DEFAULT '',
  `usr_lastname` varchar(180) NOT NULL DEFAULT '',
  `usr_date_added` date NOT NULL DEFAULT '0000-00-00',
  `usr_time_added` time NOT NULL DEFAULT '00:00:00',
  `usr_date_modified` date NOT NULL DEFAULT '0000-00-00',
  `usr_time_modified` time NOT NULL DEFAULT '00:00:00',
  `usr_stat` int(11) NOT NULL DEFAULT 1,
  `acc_photo` varchar(150) NOT NULL,
  `acc_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_access`
--
ALTER TABLE `tbl_access`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `tbl_area`
--
ALTER TABLE `tbl_area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `pro_id` (`pro_id`,`usr_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_client`
--
ALTER TABLE `tbl_client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `tbl_delivery`
--
ALTER TABLE `tbl_delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `tbl_delivery_items`
--
ALTER TABLE `tbl_delivery_items`
  ADD PRIMARY KEY (`d_items_id`),
  ADD KEY `delivery_id` (`delivery_id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `lot_id` (`lot_id`);

--
-- Indexes for table `tbl_disposal`
--
ALTER TABLE `tbl_disposal`
  ADD PRIMARY KEY (`disposal_id`),
  ADD KEY `lot_id` (`lot_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Indexes for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `tbl_invoice_item`
--
ALTER TABLE `tbl_invoice_item`
  ADD PRIMARY KEY (`invitem_id`),
  ADD KEY `lot_id` (`lot_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `usr_id` (`usr_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Indexes for table `tbl_lot`
--
ALTER TABLE `tbl_lot`
  ADD PRIMARY KEY (`lot_id`),
  ADD KEY `prod_id` (`pro_id`);

--
-- Indexes for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`n_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `ordtype_id` (`ordtype_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `tbl_orditem`
--
ALTER TABLE `tbl_orditem`
  ADD PRIMARY KEY (`orditem_id`),
  ADD KEY `prod_id` (`pro_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `usr_id` (`usr_id`),
  ADD KEY `lot_id` (`lot_id`);

--
-- Indexes for table `tbl_ordtype`
--
ALTER TABLE `tbl_ordtype`
  ADD PRIMARY KEY (`ordtype_id`);

--
-- Indexes for table `tbl_ord_invoice`
--
ALTER TABLE `tbl_ord_invoice`
  ADD PRIMARY KEY (`ord_invoice_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `tbl_paymode`
--
ALTER TABLE `tbl_paymode`
  ADD PRIMARY KEY (`paymode_id`);

--
-- Indexes for table `tbl_payterm`
--
ALTER TABLE `tbl_payterm`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `tbl_prod_supplier`
--
ALTER TABLE `tbl_prod_supplier`
  ADD PRIMARY KEY (`p_supplier_id`),
  ADD KEY `prod_id` (`pro_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`usr_id`),
  ADD KEY `acc_id` (`acc_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_access`
--
ALTER TABLE `tbl_access`
  MODIFY `acc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4006;

--
-- AUTO_INCREMENT for table `tbl_area`
--
ALTER TABLE `tbl_area`
  MODIFY `area_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `c_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000132;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_client`
--
ALTER TABLE `tbl_client`
  MODIFY `client_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1029;

--
-- AUTO_INCREMENT for table `tbl_delivery`
--
ALTER TABLE `tbl_delivery`
  MODIFY `delivery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000101;

--
-- AUTO_INCREMENT for table `tbl_delivery_items`
--
ALTER TABLE `tbl_delivery_items`
  MODIFY `d_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `tbl_disposal`
--
ALTER TABLE `tbl_disposal`
  MODIFY `disposal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  MODIFY `invoice_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2000000104;

--
-- AUTO_INCREMENT for table `tbl_invoice_item`
--
ALTER TABLE `tbl_invoice_item`
  MODIFY `invitem_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000129;

--
-- AUTO_INCREMENT for table `tbl_lot`
--
ALTER TABLE `tbl_lot`
  MODIFY `lot_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000150;

--
-- AUTO_INCREMENT for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  MODIFY `n_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5000000017;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000135;

--
-- AUTO_INCREMENT for table `tbl_orditem`
--
ALTER TABLE `tbl_orditem`
  MODIFY `orditem_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `tbl_ordtype`
--
ALTER TABLE `tbl_ordtype`
  MODIFY `ordtype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_ord_invoice`
--
ALTER TABLE `tbl_ord_invoice`
  MODIFY `ord_invoice_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400000112;

--
-- AUTO_INCREMENT for table `tbl_paymode`
--
ALTER TABLE `tbl_paymode`
  MODIFY `paymode_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tbl_payterm`
--
ALTER TABLE `tbl_payterm`
  MODIFY `term_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `pro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10126;

--
-- AUTO_INCREMENT for table `tbl_prod_supplier`
--
ALTER TABLE `tbl_prod_supplier`
  MODIFY `p_supplier_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000158;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `usr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1019;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
