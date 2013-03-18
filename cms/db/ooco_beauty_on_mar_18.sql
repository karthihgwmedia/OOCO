-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2013 at 06:25 PM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ooco_beauty`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_cf7dbplugin_submits`
--

CREATE TABLE IF NOT EXISTS `wp_cf7dbplugin_submits` (
  `submit_time` decimal(16,4) NOT NULL,
  `form_name` varchar(127) CHARACTER SET utf8 DEFAULT NULL,
  `field_name` varchar(127) CHARACTER SET utf8 DEFAULT NULL,
  `field_value` longtext CHARACTER SET utf8,
  `field_order` int(11) DEFAULT NULL,
  `file` longblob,
  KEY `submit_time_idx` (`submit_time`),
  KEY `form_name_idx` (`form_name`),
  KEY `field_name_idx` (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wp_cf7dbplugin_submits`
--

INSERT INTO `wp_cf7dbplugin_submits` (`submit_time`, `form_name`, `field_name`, `field_value`, `field_order`, `file`) VALUES
('1363528367.6486', 'OCOO NEWSLETTER', 'your-name', 'karthi', 0, NULL),
('1363528367.6486', 'OCOO NEWSLETTER', 'your-email', 'karthi.intel2004@gmail.com', 1, NULL),
('1363528367.6486', 'OCOO NEWSLETTER', 'Submitted From', '::1', 10000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_commentmeta`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'http://wordpress.org/', '', '2013-03-14 09:54:04', '2013-03-14 09:54:04', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_emirate`
--

CREATE TABLE IF NOT EXISTS `wp_emirate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_of_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `featured` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `wp_emirate`
--

INSERT INTO `wp_emirate` (`id`, `name`, `slug`, `user_id`, `date_of_creation`, `status`, `featured`) VALUES
(2, 'Dubai', 'dubai', 0, '2012-09-23 16:36:14', 1, 0),
(3, 'Sharjah', 'sharjah', 0, '2012-10-18 09:34:54', 1, 0),
(4, 'Abu Dhabi', 'abu-dhabi', 0, '2012-10-18 09:34:54', 1, 0),
(5, 'Ajman', 'ajman', 0, '2012-10-18 09:34:54', 1, 0),
(6, 'Umm Al Quwain', 'umm-al-quwain', 0, '2012-10-18 09:34:54', 1, 0),
(7, 'Fujairah', 'fujairah', 0, '2012-10-18 09:34:54', 1, 0),
(8, 'Ras Al Kaimah', 'ras-al-kaimah', 0, '2012-10-18 09:34:54', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_base_products`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_base_products` (
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  `img` text NOT NULL,
  `brand` varchar(255) NOT NULL DEFAULT '',
  `ptype` varchar(255) NOT NULL DEFAULT '',
  `thecondition` varchar(255) NOT NULL DEFAULT '',
  `expiry` date NOT NULL DEFAULT '0000-00-00',
  `ean` varchar(255) NOT NULL DEFAULT '',
  `isbn` varchar(255) NOT NULL DEFAULT '',
  `mpn` varchar(255) NOT NULL DEFAULT '',
  `qty` int(5) NOT NULL DEFAULT '0',
  `xtra` text NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_eshop_base_products`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_countries`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_countries` (
  `code` char(2) NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL DEFAULT '',
  `zone` tinyint(1) NOT NULL DEFAULT '0',
  `list` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`code`),
  KEY `zone` (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_eshop_countries`
--

INSERT INTO `wp_eshop_countries` (`code`, `country`, `zone`, `list`) VALUES
('AD', 'Andorra', 1, 1),
('AE', 'United Arab Emirates', 2, 1),
('AG', 'Antigua and Barbuda', 2, 1),
('AI', 'Anguilla', 2, 1),
('AL', 'Albania', 1, 1),
('AM', 'Armenia', 1, 1),
('AN', 'Netherlands Antilles', 2, 1),
('AO', 'Angola', 2, 1),
('AR', 'Argentina', 2, 1),
('AT', 'Austria', 1, 1),
('AU', 'Australia', 3, 1),
('AW', 'Aruba', 2, 1),
('AZ', 'Azerbaijan Republic', 1, 1),
('BA', 'Bosnia and Herzegovina', 1, 1),
('BB', 'Barbados', 2, 1),
('BE', 'Belgium', 1, 1),
('BF', 'Burkina Faso', 2, 1),
('BG', 'Bulgaria', 1, 1),
('BH', 'Bahrain', 2, 1),
('BI', 'Burundi', 2, 1),
('BJ', 'Benin', 2, 1),
('BM', 'Bermuda', 2, 1),
('BN', 'Brunei', 2, 1),
('BO', 'Bolivia', 2, 1),
('BR', 'Brazil', 2, 1),
('BS', 'Bahamas', 2, 1),
('BT', 'Bhutan', 2, 1),
('BW', 'Botswana', 2, 1),
('BZ', 'Belize', 2, 1),
('CA', 'Canada', 2, 1),
('CD', 'Democratic Republic of the Congo', 2, 1),
('CG', 'Republic of the Congo', 2, 1),
('CH', 'Switzerland', 1, 1),
('CK', 'Cook Islands', 3, 1),
('CL', 'Chile', 2, 1),
('CN', 'China', 3, 1),
('CO', 'Colombia', 2, 1),
('CR', 'Costa Rica', 2, 1),
('CV', 'Cape Verde', 2, 1),
('CY', 'Cyprus', 1, 1),
('CZ', 'Czech Republic', 1, 1),
('DE', 'Germany', 1, 1),
('DJ', 'Djibouti', 2, 1),
('DK', 'Denmark', 1, 1),
('DM', 'Dominica', 2, 1),
('DO', 'Dominican Republic', 2, 1),
('DZ', 'Algeria', 2, 1),
('EC', 'Ecuador', 2, 1),
('EE', 'Estonia', 1, 1),
('ER', 'Eritrea', 2, 1),
('ES', 'Spain', 1, 1),
('ET', 'Ethiopia', 2, 1),
('FI', 'Finland', 1, 1),
('FJ', 'Fiji', 3, 1),
('FK', 'Falkland Islands', 2, 1),
('FM', 'Federated States of Micronesia', 3, 1),
('FO', 'Faroe Islands', 1, 1),
('FR', 'France', 1, 1),
('GA', 'Gabon Republic', 2, 1),
('GB', 'United Kingdom', 1, 1),
('GD', 'Grenada', 2, 1),
('GF', 'French Guiana', 2, 1),
('GI', 'Gibraltar', 1, 1),
('GL', 'Greenland', 1, 1),
('GM', 'Gambia', 2, 1),
('GN', 'Guinea', 2, 1),
('GP', 'Guadeloupe', 3, 1),
('GR', 'Greece', 1, 1),
('GT', 'Guatemala', 2, 1),
('GW', 'Guinea Bissau', 2, 1),
('GY', 'Guyana', 2, 1),
('HK', 'Hong Kong', 2, 1),
('HN', 'Honduras', 2, 1),
('HR', 'Croatia', 1, 1),
('HU', 'Hungary', 1, 1),
('ID', 'Indonesia', 2, 1),
('IE', 'Ireland', 1, 1),
('IL', 'Israel', 2, 1),
('IN', 'India', 2, 1),
('IS', 'Iceland', 1, 1),
('IT', 'Italy', 1, 1),
('JM', 'Jamaica', 2, 1),
('JO', 'Jordan', 2, 1),
('JP', 'Japan', 3, 1),
('KE', 'Kenya', 2, 1),
('KG', 'Kyrgyzstan', 1, 1),
('KH', 'Cambodia', 2, 1),
('KI', 'Kiribati', 3, 1),
('KM', 'Comoros', 2, 1),
('KN', 'St. Kitts and Nevis', 2, 1),
('KR', 'South Korea', 3, 1),
('KW', 'Kuwait', 2, 1),
('KY', 'Cayman Islands', 2, 1),
('KZ', 'Kazakhstan', 1, 1),
('LA', 'Laos', 3, 1),
('LC', 'St. Lucia', 2, 1),
('LI', 'Liechtenstein', 1, 1),
('LK', 'Sri Lanka', 2, 1),
('LS', 'Lesotho', 2, 1),
('LT', 'Lithuania', 1, 1),
('LU', 'Luxembourg', 1, 1),
('LV', 'Latvia', 1, 1),
('MA', 'Morocco', 2, 1),
('MG', 'Madagascar', 2, 1),
('MH', 'Marshall Islands', 3, 1),
('ML', 'Mali', 2, 1),
('MN', 'Mongolia', 3, 1),
('MQ', 'Martinique', 3, 1),
('MR', 'Mauritania', 2, 1),
('MS', 'Montserrat', 2, 1),
('MT', 'Malta', 1, 1),
('MU', 'Mauritius', 2, 1),
('MV', 'Maldives', 2, 1),
('MW', 'Malawi', 2, 1),
('MX', 'Mexico', 2, 1),
('MY', 'Malaysia', 2, 1),
('MZ', 'Mozambique', 2, 1),
('NA', 'Namibia', 2, 1),
('NC', 'New Caledonia', 3, 1),
('NE', 'Niger', 2, 1),
('NF', 'Norfolk Island', 3, 1),
('NI', 'Nicaragua', 2, 1),
('NL', 'Netherlands', 1, 1),
('NO', 'Norway', 1, 1),
('NP', 'Nepal', 2, 1),
('NR', 'Nauru', 3, 1),
('NU', 'Niue', 3, 1),
('NZ', 'New Zealand', 3, 1),
('OM', 'Oman', 2, 1),
('PA', 'Panama', 2, 1),
('PY', 'Paraguay', 2, 1),
('PE', 'Peru', 2, 1),
('PF', 'French Polynesia', 3, 1),
('PG', 'Papua New Guinea', 3, 1),
('PH', 'Philippines', 3, 1),
('PL', 'Poland', 1, 1),
('PM', 'St. Pierre and Miquelon', 2, 1),
('PN', 'Pitcairn Islands', 3, 1),
('PT', 'Portugal', 1, 1),
('PW', 'Palau', 3, 1),
('QA', 'Qatar', 2, 1),
('RE', 'Reunion', 2, 1),
('RO', 'Romania', 1, 1),
('RU', 'Russia', 1, 1),
('RW', 'Rwanda', 2, 1),
('SA', 'Saudi Arabia', 2, 1),
('SB', 'Solomon Islands', 3, 1),
('SC', 'Seychelles', 2, 1),
('SE', 'Sweden', 1, 1),
('SG', 'Singapore', 2, 1),
('SH', 'St. Helena', 2, 1),
('SI', 'Slovenia', 1, 1),
('SJ', 'Svalbard and Jan Mayen Islands', 3, 1),
('SK', 'Slovakia', 1, 1),
('SL', 'Sierra Leone', 2, 1),
('SM', 'San Marino', 1, 1),
('SN', 'Senegal', 2, 1),
('SO', 'Somalia', 2, 1),
('SR', 'Suriname', 2, 1),
('ST', 'Sao Tome and Principe', 2, 1),
('SV', 'El Salvador', 2, 1),
('SZ', 'Swaziland', 2, 1),
('TC', 'Turks and Caicos Islands', 2, 1),
('TD', 'Chad', 2, 1),
('TG', 'Togo', 2, 1),
('TH', 'Thailand', 2, 1),
('TJ', 'Tajikistan', 1, 1),
('TM', 'Turkmenistan', 1, 1),
('TN', 'Tunisia', 2, 1),
('TO', 'Tonga', 3, 1),
('TR', 'Turkey', 1, 1),
('TT', 'Trinidad and Tobago', 2, 1),
('TV', 'Tuvalu', 3, 1),
('TW', 'Taiwan', 3, 1),
('TZ', 'Tanzania', 2, 1),
('UA', 'Ukraine', 1, 1),
('UG', 'Uganda', 2, 1),
('US', 'United States', 2, 1),
('UY', 'Uruguay', 2, 1),
('VA', 'Vatican City State', 1, 1),
('VC', 'Saint Vincent and the Grenadines', 2, 1),
('VE', 'Venezuela', 2, 1),
('VG', 'British Virgin Islands', 2, 1),
('VN', 'Vietnam', 2, 1),
('VU', 'Vanuatu', 3, 1),
('WF', 'Wallis and Futuna Islands', 3, 1),
('WS', 'Samoa', 3, 1),
('YE', 'Yemen', 2, 1),
('YT', 'Mayotte', 3, 1),
('ZA', 'South Africa', 2, 1),
('ZM', 'Zambia', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_discount_codes`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_discount_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dtype` tinyint(1) NOT NULL DEFAULT '0',
  `disccode` varchar(255) NOT NULL DEFAULT '',
  `percent` float(5,2) NOT NULL DEFAULT '0.00',
  `remain` varchar(11) NOT NULL DEFAULT '',
  `used` int(11) NOT NULL DEFAULT '0',
  `enddate` date NOT NULL DEFAULT '0000-00-00',
  `live` char(3) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `disccode` (`disccode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_eshop_discount_codes`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_downloads`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `files` varchar(255) NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `purchases` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_eshop_downloads`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_download_orders`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_download_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkid` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `purchased` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `files` varchar(255) NOT NULL DEFAULT '',
  `downloads` smallint(1) NOT NULL DEFAULT '3',
  `code` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `code` (`code`,`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_eshop_download_orders`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_emails`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailUse` tinyint(1) NOT NULL DEFAULT '0',
  `emailType` varchar(50) NOT NULL DEFAULT '',
  `emailSubject` varchar(255) NOT NULL DEFAULT '',
  `emailContent` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `wp_eshop_emails`
--

INSERT INTO `wp_eshop_emails` (`id`, `emailUse`, `emailType`, `emailSubject`, `emailContent`) VALUES
(1, 1, 'Automatic default email', 'Your order from OCOO || The Beauty Drink', '[AUTO-RESPONSE - PLEASE DO NOT REPLY]\r\n\r\n	Dear {FIRSTNAME},\r\n\r\n	Your order has been received. Thank you! \r\n	The details of your order follow...\r\n\r\n	--------------- ORDER DETAILS ---------------\r\n\r\n	{STATUS}\r\n	{CART}\r\n\r\n\r\n	--------------- DOWNLOAD DETAILS ---------------\r\n	These are available for download via:\r\n	{DOWNLOADS}\r\n\r\n\r\n	--------------- CUSTOMER DETAILS ---------------\r\n\r\n	{NAME}\r\n	{ADDRESS}\r\n\r\n	--------------- CONTACT DETAILS ---------------\r\n\r\n	{CONTACT}\r\n\r\n	--------------- OTHER INFORMATION (if applicable) ---------------\r\n\r\n	{REFCOMM}\r\n	---\r\n\r\n	If you have questions or concerns, please contact us.\r\n	Thank you for ordering with us.'),
(2, 1, 'Admin Order Form email', 'OCOO || The Beauty Drink Notification', '[SPECIAL COMMUNICATION/NOTIFICATION]\r\n\r\n	Dear {FIRSTNAME},\r\n\r\n	*** Enter a custom message here ***\r\n\r\n	Respectfully,\r\n	*** Enter your name, title, and email here ***\r\n\r\n\r\n\r\n	--------------- ORDER DETAILS ---------------\r\n\r\n	{STATUS}\r\n	{CART}\r\n\r\n	--------------- DOWNLOAD DETAILS ---------------\r\n	These are available for download via:\r\n	{DOWNLOADS}\r\n\r\n	--------------- CUSTOMER DETAILS ---------------\r\n\r\n	{NAME}\r\n	{ADDRESS}\r\n\r\n	--------------- CONTACT DETAILS ---------------\r\n\r\n	{CONTACT}\r\n\r\n	--------------- OTHER INFORMATION (if applicable) ---------------\r\n\r\n	{REFCOMM}\r\n\r\n	---\r\n\r\n	If you have questions or concerns, please contact us.\r\n	Again, thank you for ordering with us.\r\n	'),
(3, 0, 'Automatic Paypal email', 'Your order from OCOO || The Beauty Drink', ''),
(4, 0, 'Automatic Payson email', 'Your order from OCOO || The Beauty Drink', ''),
(5, 0, 'Automatic Cash email', 'Your order from OCOO || The Beauty Drink', ''),
(6, 0, 'Automatic ePN email', 'Your order from OCOO || The Beauty Drink', ''),
(7, 0, 'Automatic webtopay email', 'Your order from OCOO || The Beauty Drink', ''),
(8, 0, 'Automatic Authorize.net email', 'Your order from OCOO || The Beauty Drink', ''),
(9, 0, 'Automatic iDeal Lite email', 'Your order from OCOO || The Beauty Drink', ''),
(10, 0, 'Automatic ogone email', 'Your order from OCOO || The Beauty Drink', ''),
(11, 0, 'Automatic Bank email', 'Your order from OCOO || The Beauty Drink', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_option_names`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_option_names` (
  `optid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `admin_name` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`optid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_eshop_option_names`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_option_sets`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_option_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` float(16,2) NOT NULL DEFAULT '0.00',
  `weight` float(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_eshop_option_sets`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_orders`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkid` varchar(255) NOT NULL DEFAULT '',
  `status` set('Sent','Completed','Pending','Failed','Deleted','Waiting') NOT NULL DEFAULT 'Pending',
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `address1` varchar(255) NOT NULL DEFAULT '',
  `address2` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `state` varchar(100) NOT NULL DEFAULT '',
  `zip` varchar(20) NOT NULL DEFAULT '',
  `country` varchar(3) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `ship_name` varchar(100) NOT NULL DEFAULT '',
  `ship_company` varchar(255) NOT NULL DEFAULT '',
  `ship_phone` varchar(30) NOT NULL DEFAULT '',
  `ship_address` varchar(255) NOT NULL DEFAULT '',
  `ship_city` varchar(100) NOT NULL DEFAULT '',
  `ship_state` varchar(100) NOT NULL DEFAULT '',
  `ship_postcode` varchar(20) NOT NULL DEFAULT '',
  `ship_country` varchar(3) NOT NULL DEFAULT '',
  `custom_field` varchar(15) NOT NULL DEFAULT '',
  `transid` varchar(255) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `thememo` text NOT NULL,
  `edited` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `downloads` set('yes','no') NOT NULL DEFAULT 'no',
  `admin_note` text NOT NULL,
  `paidvia` varchar(255) NOT NULL DEFAULT '',
  `affiliate` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `user_notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field` (`checkid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_eshop_orders`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_order_items`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkid` varchar(255) NOT NULL DEFAULT '',
  `item_id` varchar(255) NOT NULL DEFAULT '0',
  `item_qty` int(11) NOT NULL DEFAULT '0',
  `item_amt` float(16,2) NOT NULL DEFAULT '0.00',
  `tax_rate` varchar(255) NOT NULL DEFAULT '',
  `tax_amt` varchar(255) NOT NULL DEFAULT '',
  `optname` varchar(255) NOT NULL DEFAULT '',
  `optsets` text NOT NULL,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `down_id` int(11) NOT NULL DEFAULT '0',
  `weight` float(16,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `custom_field` (`checkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_eshop_order_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_rates`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(3) NOT NULL DEFAULT '',
  `items` smallint(2) NOT NULL DEFAULT '0',
  `zone1` float(16,2) NOT NULL DEFAULT '0.00',
  `zone2` float(16,2) NOT NULL DEFAULT '0.00',
  `zone3` float(16,2) NOT NULL DEFAULT '0.00',
  `zone4` float(16,2) NOT NULL DEFAULT '0.00',
  `zone5` float(16,2) NOT NULL DEFAULT '0.00',
  `zone6` float(16,2) NOT NULL DEFAULT '0.00',
  `zone7` float(16,2) NOT NULL DEFAULT '0.00',
  `zone8` float(16,2) NOT NULL DEFAULT '0.00',
  `zone9` float(16,2) NOT NULL DEFAULT '0.00',
  `weight` float(16,2) NOT NULL DEFAULT '0.00',
  `maxweight` varchar(16) NOT NULL DEFAULT '',
  `area` varchar(50) NOT NULL DEFAULT '',
  `rate_type` varchar(255) NOT NULL DEFAULT 'shipping',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `wp_eshop_rates`
--

INSERT INTO `wp_eshop_rates` (`id`, `class`, `items`, `zone1`, `zone2`, `zone3`, `zone4`, `zone5`, `zone6`, `zone7`, `zone8`, `zone9`, `weight`, `maxweight`, `area`, `rate_type`) VALUES
(1, 'A', 1, 10.00, 15.00, 20.00, 25.00, 30.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(2, 'B', 1, 15.00, 20.00, 30.00, 40.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(3, 'C', 1, 40.00, 45.00, 50.00, 50.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(4, 'D', 1, 30.00, 35.00, 40.00, 40.00, 40.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(5, 'E', 1, 50.00, 60.00, 70.00, 80.00, 90.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(6, 'A', 2, 5.00, 8.00, 10.00, 15.00, 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(7, 'B', 2, 7.00, 10.00, 20.00, 20.00, 15.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(8, 'C', 2, 20.00, 25.00, 40.00, 25.00, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(9, 'D', 2, 15.00, 25.00, 30.00, 20.00, 25.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(10, 'E', 2, 25.00, 30.00, 60.00, 40.00, 30.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping');

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_states`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(4) NOT NULL DEFAULT '',
  `stateName` varchar(30) NOT NULL DEFAULT '',
  `zone` tinyint(1) NOT NULL DEFAULT '0',
  `list` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `zone` (`zone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=155 ;

--
-- Dumping data for table `wp_eshop_states`
--

INSERT INTO `wp_eshop_states` (`id`, `code`, `stateName`, `zone`, `list`) VALUES
(1, 'AK', 'Alaska', 5, 'US'),
(2, 'HI', 'Hawaii', 5, 'US'),
(3, 'AL', 'Alabama', 2, 'US'),
(4, 'AZ', 'Arizona', 4, 'US'),
(5, 'AR', 'Arkansas', 3, 'US'),
(6, 'CA', 'California', 5, 'US'),
(7, 'CO', 'Colorado', 4, 'US'),
(8, 'CT', 'Connecticut', 1, 'US'),
(9, 'DE', 'Delaware', 2, 'US'),
(10, 'DC', 'District Of Columbia', 2, 'US'),
(11, 'FL', 'Florida', 2, 'US'),
(12, 'GA', 'Georgia', 2, 'US'),
(13, 'ID', 'Idaho', 4, 'US'),
(14, 'IL', 'Illinois', 3, 'US'),
(15, 'IN', 'Indiana', 2, 'US'),
(16, 'IA', 'Iowa', 3, 'US'),
(17, 'KS', 'Kansas', 3, 'US'),
(18, 'KY', 'Kentucky', 2, 'US'),
(19, 'LA', 'Louisiana', 3, 'US'),
(20, 'ME', 'Maine', 1, 'US'),
(21, 'MD', 'Maryland', 2, 'US'),
(22, 'MA', 'Massachusetts', 1, 'US'),
(23, 'MI', 'Michigan', 2, 'US'),
(24, 'MN', 'Minnesota', 3, 'US'),
(25, 'MS', 'Mississippi', 3, 'US'),
(26, 'MO', 'Missouri', 3, 'US'),
(27, 'MT', 'Montana', 4, 'US'),
(28, 'NE', 'Nebraska', 3, 'US'),
(29, 'NV', 'Nevada', 5, 'US'),
(30, 'NH', 'New Hampshire', 1, 'US'),
(31, 'NJ', 'New Jersey', 2, 'US'),
(32, 'NM', 'New Mexico', 4, 'US'),
(33, 'NY', 'New York', 2, 'US'),
(34, 'NC', 'North Carolina', 2, 'US'),
(35, 'ND', 'North Dakota', 3, 'US'),
(36, 'OH', 'Ohio', 2, 'US'),
(37, 'OK', 'Oklahoma', 3, 'US'),
(38, 'OR', 'Oregon', 5, 'US'),
(39, 'PA', 'Pennsylvania', 2, 'US'),
(40, 'RI', 'Rhode Island', 1, 'US'),
(41, 'SC', 'South Carolina', 2, 'US'),
(42, 'SD', 'South Dakota', 3, 'US'),
(43, 'TN', 'Tennessee', 3, 'US'),
(44, 'TX', 'Texas', 3, 'US'),
(45, 'UT', 'Utah', 4, 'US'),
(46, 'VT', 'Vermont', 1, 'US'),
(47, 'VA', 'Virginia', 2, 'US'),
(48, 'WA', 'Washington', 5, 'US'),
(49, 'WV', 'West Virginia', 2, 'US'),
(50, 'WI', 'Wisconsin', 3, 'US'),
(51, 'WY', 'Wyoming', 4, 'US'),
(52, 'AB', 'Alberta', 3, 'CA'),
(53, 'BC', 'British Columbia', 3, 'CA'),
(54, 'MB', 'Manitoba', 3, 'CA'),
(55, 'NB', 'New Brunswick', 3, 'CA'),
(56, 'NL', 'Newfoundland & Labrador', 3, 'CA'),
(57, 'NT', 'Northwest Territories', 3, 'CA'),
(58, 'NU', 'Nunavut', 3, 'CA'),
(59, 'NS', 'Nova Scotia', 3, 'CA'),
(60, 'ON', 'Ontario', 3, 'CA'),
(61, 'PE', 'Prince Edward Island', 3, 'CA'),
(62, 'QC', 'Quebec', 3, 'CA'),
(63, 'SK', 'Saskatchewan', 3, 'CA'),
(64, 'YU', 'Yukon', 3, 'CA'),
(65, 'Lond', 'London', 1, 'GB'),
(66, 'Beds', 'Bedfordshire', 1, 'GB'),
(67, 'Berk', 'Berkshire', 1, 'GB'),
(68, 'Buck', 'Buckinghamshire', 1, 'GB'),
(69, 'Camb', 'Cambridgeshire', 1, 'GB'),
(70, 'Ches', 'Cheshire', 1, 'GB'),
(71, 'Corn', 'Cornwall and Isles of Scilly', 1, 'GB'),
(72, 'Cumb', 'Cumbria', 1, 'GB'),
(73, 'Derb', 'Derbyshire', 1, 'GB'),
(74, 'Dev', 'Devon', 1, 'GB'),
(75, 'Dors', 'Dorset', 1, 'GB'),
(76, 'Durh', 'Durham', 1, 'GB'),
(77, 'ESus', 'East Sussex', 1, 'GB'),
(78, 'Esse', 'Essex', 1, 'GB'),
(79, 'Glos', 'Gloucestershire', 1, 'GB'),
(80, 'GL', 'Greater London', 1, 'GB'),
(81, 'GM', 'Greater Manchester', 1, 'GB'),
(82, 'Hamp', 'Hampshire', 1, 'GB'),
(83, 'Here', 'Herefordshire', 1, 'GB'),
(84, 'Hert', 'Hertfordshire', 1, 'GB'),
(85, 'Kent', 'Kent', 1, 'GB'),
(86, 'Lanc', 'Lancashire', 1, 'GB'),
(87, 'Leic', 'Leicestershire', 1, 'GB'),
(88, 'Linc', 'Lincolnshire', 1, 'GB'),
(89, 'Mers', 'Merseyside', 1, 'GB'),
(90, 'Norf', 'Norfolk', 1, 'GB'),
(91, 'NYor', 'North Yorkshire', 1, 'GB'),
(92, 'Nort', 'Northamptonshire', 1, 'GB'),
(93, 'Norh', 'Northumberland', 1, 'GB'),
(94, 'Nott', 'Nottinghamshire', 1, 'GB'),
(95, 'Ox', 'Oxfordshire', 1, 'GB'),
(96, 'Shrp', 'Shropshire', 1, 'GB'),
(97, 'Som', 'Somerset', 1, 'GB'),
(98, 'SYor', 'South Yorkshire', 1, 'GB'),
(99, 'Staf', 'Staffordshire', 1, 'GB'),
(100, 'Suff', 'Suffolk', 1, 'GB'),
(101, 'Surr', 'Surrey', 1, 'GB'),
(102, 'Tyne', 'Tyne and Wear', 1, 'GB'),
(103, 'Warw', 'Warwickshire', 1, 'GB'),
(104, 'WMid', 'West Midlands', 1, 'GB'),
(105, 'WSus', 'West Sussex', 1, 'GB'),
(106, 'WYor', 'West Yorkshire', 1, 'GB'),
(107, 'Wilt', 'Wiltshire', 1, 'GB'),
(108, 'Worc', 'Worcestershire', 1, 'GB'),
(109, 'Flin', 'Flintshire', 1, 'GB'),
(110, 'Glam', 'Glamorgan', 1, 'GB'),
(111, 'Meri', 'Merionethshire', 1, 'GB'),
(112, 'Mon', 'Monmouthshire', 1, 'GB'),
(113, 'Mont', 'Montgomeryshire', 1, 'GB'),
(114, 'Pemb', 'Pembrokeshire', 1, 'GB'),
(115, 'Radn', 'Radnorshire', 1, 'GB'),
(116, 'Angl', 'Anglesey', 1, 'GB'),
(117, 'Brec', 'Breconshire', 1, 'GB'),
(118, 'Caer', 'Caernarvonshire', 1, 'GB'),
(119, 'Card', 'Cardiganshire', 1, 'GB'),
(120, 'Carm', 'Carmarthenshire', 1, 'GB'),
(121, 'Denb', 'Denbighshire', 1, 'GB'),
(122, 'Kirk', 'Kirkcudbrightshire', 1, 'GB'),
(123, 'Lana', 'Lanarkshire', 1, 'GB'),
(124, 'Midl', 'Midlothian', 1, 'GB'),
(125, 'Mora', 'Moray', 1, 'GB'),
(126, 'Nair', 'Nairnshire', 1, 'GB'),
(127, 'Orkn', 'Orkney', 1, 'GB'),
(128, 'Peeb', 'Peebleshire', 1, 'GB'),
(129, 'Pert', 'Perthshire', 1, 'GB'),
(130, 'Renf', 'Renfrewshire', 1, 'GB'),
(131, 'Ross', 'Ross &amp; Cromarty', 1, 'GB'),
(132, 'Roxb', 'Roxburghshire', 1, 'GB'),
(133, 'Selk', 'Selkirkshire', 1, 'GB'),
(134, 'Shet', 'Shetland', 1, 'GB'),
(135, 'Stir', 'Stirlingshire', 1, 'GB'),
(136, 'Suth', 'Sutherland', 1, 'GB'),
(137, 'WLot', 'West Lothian', 1, 'GB'),
(138, 'Wigt', 'Wigtownshire', 1, 'GB'),
(139, 'Aber', 'Aberdeenshire', 1, 'GB'),
(140, 'Angu', 'Angus', 1, 'GB'),
(141, 'Argy', 'Argyll', 1, 'GB'),
(142, 'Ayrs', 'Ayrshire', 1, 'GB'),
(143, 'Banf', 'Banffshire', 1, 'GB'),
(144, 'Berw', 'Berwickshire', 1, 'GB'),
(145, 'Bute', 'Bute', 1, 'GB'),
(146, 'Cait', 'Caithness', 1, 'GB'),
(147, 'Clac', 'Clackmannanshire', 1, 'GB'),
(148, 'Dumf', 'Dumfriesshire', 1, 'GB'),
(149, 'Dumb', 'Dumbartonshire', 1, 'GB'),
(150, 'ELot', 'East Lothian', 1, 'GB'),
(151, 'Fife', 'Fife', 1, 'GB'),
(152, 'Inve', 'Inverness', 1, 'GB'),
(153, 'Kinc', 'Kincardineshire', 1, 'GB'),
(154, 'Kinr', 'Kinross-shire', 1, 'GB');

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_stock`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `available` int(11) NOT NULL DEFAULT '0',
  `purchases` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`,`available`,`purchases`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_eshop_stock`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_location`
--

CREATE TABLE IF NOT EXISTS `wp_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `refCountryId` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_of_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `featured` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `refCountryId` (`refCountryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=480 ;

--
-- Dumping data for table `wp_location`
--

INSERT INTO `wp_location` (`id`, `name`, `slug`, `refCountryId`, `user_id`, `date_of_creation`, `status`, `featured`) VALUES
(1, 'academic city', 'academic-city', 2, 0, '2012-10-18 09:37:23', 1, 0),
(2, 'al quoz', 'al-quoz', 2, 0, '2012-10-18 09:37:23', 1, 0),
(3, 'al qusais', 'al-qusais', 2, 0, '2012-10-18 09:37:23', 1, 0),
(4, 'al sufouh', 'al-sufouh', 2, 0, '2012-10-18 09:37:23', 1, 0),
(5, 'arabian ranches', 'arabian-ranches', 2, 0, '2012-10-18 09:37:23', 1, 0),
(6, 'barsha', 'barsha', 2, 0, '2012-10-18 09:37:23', 1, 0),
(7, 'bur dubai', 'bur-dubai', 2, 0, '2012-10-18 09:37:23', 1, 0),
(8, 'deira', 'deira', 2, 0, '2012-10-18 09:37:23', 1, 0),
(9, 'difc', 'difc', 2, 0, '2012-10-18 09:37:23', 1, 0),
(10, 'discovery gardens', 'discovery-gardens', 2, 0, '2012-10-18 09:37:23', 1, 0),
(11, 'downtown burj khalifa', 'downtown-burj-khalifa', 2, 0, '2012-10-18 09:37:23', 1, 0),
(12, 'dubai marina', 'dubai-marina', 2, 0, '2012-10-18 09:37:23', 1, 0),
(13, 'dubailand', 'dubailand', 2, 0, '2012-10-18 09:37:23', 1, 0),
(14, 'emirates hills', 'emirates-hills', 2, 0, '2012-10-18 09:37:23', 1, 0),
(15, 'festival city', 'festival-city', 2, 0, '2012-10-18 09:37:23', 1, 0),
(16, 'garhoud', 'garhoud', 2, 0, '2012-10-18 09:37:23', 1, 0),
(17, 'green community', 'green-community', 2, 0, '2012-10-18 09:37:23', 1, 0),
(18, 'hatta', 'hatta', 2, 0, '2012-10-18 09:37:23', 1, 0),
(19, 'international city', 'international-city', 2, 0, '2012-10-18 09:37:23', 1, 0),
(20, 'internet city', 'internet-city', 2, 0, '2012-10-18 09:37:23', 1, 0),
(21, 'jadaf', 'jadaf', 2, 0, '2012-10-18 09:37:23', 1, 0),
(22, 'jebel ali and dubai investments park', 'jebel-ali-and-dubai-investments-park', 2, 0, '2012-10-18 09:37:23', 1, 0),
(23, 'jumeirah and umm suqeim', 'jumeirah-and-umm-suqeim', 2, 0, '2012-10-18 09:37:23', 1, 0),
(24, 'jumeirah lakes towers', 'jumeirah-lakes-towers', 2, 0, '2012-10-18 09:37:23', 1, 0),
(25, 'karama', 'karama-25', 2, 0, '2012-10-18 09:37:23', 1, 0),
(26, 'knowledge village', 'knowledge-village', 2, 0, '2012-10-18 09:37:23', 1, 0),
(27, 'media city', 'media-city', 2, 0, '2012-10-18 09:37:23', 1, 0),
(28, 'mirdif and al warqa', 'mirdif-and-al-warqa', 2, 0, '2012-10-18 09:37:23', 1, 0),
(29, 'motor city', 'motor-city', 2, 0, '2012-10-18 09:37:23', 1, 0),
(30, 'nad al sheeba', 'nad-al-sheeba', 2, 0, '2012-10-18 09:37:23', 1, 0),
(31, 'oud metha', 'oud-metha', 2, 0, '2012-10-18 09:37:23', 1, 0),
(32, 'palm jumeirah', 'palm-jumeirah', 2, 0, '2012-10-18 09:37:23', 1, 0),
(33, 'rashidiya', 'rashidiya', 2, 0, '2012-10-18 09:37:23', 1, 0),
(34, 'satwa', 'satwa', 2, 0, '2012-10-18 09:37:23', 1, 0),
(35, 'sheikh zayed road', 'sheikh-zayed-road', 2, 0, '2012-10-18 09:37:23', 1, 0),
(36, 'silicon oasis', 'silicon-oasis', 2, 0, '2012-10-18 09:37:23', 1, 0),
(37, 'sports city', 'sports-city', 2, 0, '2012-10-18 09:37:23', 1, 0),
(38, 'tecom', 'tecom', 2, 0, '2012-10-18 09:37:23', 1, 0),
(39, 'the gardens', 'the-gardens', 2, 0, '2012-10-18 09:37:23', 1, 0),
(40, 'the greens', 'the-greens', 2, 0, '2012-10-18 09:37:23', 1, 0),
(41, 'the meadows', 'the-meadows', 2, 0, '2012-10-18 09:37:23', 1, 0),
(42, 'al ain', 'al-ain', 4, 0, '2012-10-18 09:37:23', 1, 0),
(43, 'al aman', 'al-aman', 4, 0, '2012-10-18 09:37:23', 1, 0),
(44, 'al bateen', 'al-bateen', 4, 0, '2012-10-18 09:37:23', 1, 0),
(45, 'al dhafrah', 'al-dhafrah', 4, 0, '2012-10-18 09:37:23', 1, 0),
(46, 'al khalidiyah', 'al-khalidiyah', 4, 0, '2012-10-18 09:37:23', 1, 0),
(47, 'al khubeirah', 'al-khubeirah', 4, 0, '2012-10-18 09:37:23', 1, 0),
(48, 'al madina', 'al-madina', 4, 0, '2012-10-18 09:37:23', 1, 0),
(49, 'al manhal', 'al-manhal', 4, 0, '2012-10-18 09:37:23', 1, 0),
(50, 'al maqta', 'al-maqta', 4, 0, '2012-10-18 09:37:23', 1, 0),
(51, 'al markaziyah', 'al-markaziyah', 4, 0, '2012-10-18 09:37:23', 1, 0),
(52, 'al matar', 'al-matar', 4, 0, '2012-10-18 09:37:23', 1, 0),
(53, 'al meena', 'al-meena', 4, 0, '2012-10-18 09:37:23', 1, 0),
(54, 'al muroor', 'al-muroor', 4, 0, '2012-10-18 09:37:23', 1, 0),
(55, 'al mushrif', 'al-mushrif', 4, 0, '2012-10-18 09:37:23', 1, 0),
(56, 'al nahyan', 'al-nahyan', 4, 0, '2012-10-18 09:37:23', 1, 0),
(57, 'al raha beach', 'al-raha-beach', 4, 0, '2012-10-18 09:37:23', 1, 0),
(58, 'al rahba', 'al-rahba', 4, 0, '2012-10-18 09:37:23', 1, 0),
(59, 'al rawdah', 'al-rawdah', 4, 0, '2012-10-18 09:37:23', 1, 0),
(60, 'al reehan', 'al-reehan', 4, 0, '2012-10-18 09:37:23', 1, 0),
(61, 'al saraat', 'al-saraat', 4, 0, '2012-10-18 09:37:23', 1, 0),
(62, 'al wahdah', 'al-wahdah', 4, 0, '2012-10-18 09:37:23', 1, 0),
(63, 'bain al jessrain', 'bain-al-jessrain', 4, 0, '2012-10-18 09:37:23', 1, 0),
(64, 'bani yas', 'bani-yas', 4, 0, '2012-10-18 09:37:23', 1, 0),
(65, 'central market', 'central-market', 4, 0, '2012-10-18 09:37:23', 1, 0),
(66, 'danet abu dhabi', 'danet-abu-dhabi', 4, 0, '2012-10-18 09:37:23', 1, 0),
(67, 'ghantoot', 'ghantoot', 4, 0, '2012-10-18 09:37:23', 1, 0),
(68, 'hadbat al zafranah', 'hadbat-al-zafranah', 4, 0, '2012-10-18 09:37:23', 1, 0),
(69, 'jebel dhanna', 'jebel-dhanna', 4, 0, '2012-10-18 09:37:23', 1, 0),
(70, 'jebel hafeet', 'jebel-hafeet', 4, 0, '2012-10-18 09:37:23', 1, 0),
(71, 'khalifa city', 'khalifa-city', 4, 0, '2012-10-18 09:37:23', 1, 0),
(72, 'khalifa city a', 'khalifa-city-a', 4, 0, '2012-10-18 09:37:23', 1, 0),
(73, 'liwa', 'liwa', 4, 0, '2012-10-18 09:37:23', 1, 0),
(74, 'madinat zayed', 'madinat-zayed', 4, 0, '2012-10-18 09:37:23', 1, 0),
(75, 'mirfa', 'mirfa', 4, 0, '2012-10-18 09:37:23', 1, 0),
(76, 'mohammed bin zayed city', 'mohammed-bin-zayed-city', 4, 0, '2012-10-18 09:37:23', 1, 0),
(77, 'ras al akhdar', 'ras-al-akhdar', 4, 0, '2012-10-18 09:37:23', 1, 0),
(78, 'saadiyat island', 'saadiyat-island', 4, 0, '2012-10-18 09:37:23', 1, 0),
(79, 'sas al nakhl', 'sas-al-nakhl', 4, 0, '2012-10-18 09:37:23', 1, 0),
(80, 'shahama', 'shahama', 4, 0, '2012-10-18 09:37:23', 1, 0),
(81, 'sir bani yas', 'sir-bani-yas', 4, 0, '2012-10-18 09:37:23', 1, 0),
(82, 'tourist club area', 'tourist-club-area', 4, 0, '2012-10-18 09:37:23', 1, 0),
(83, 'yas island', 'yas-island', 4, 0, '2012-10-18 09:37:23', 1, 0),
(84, 'al majaz', 'al-majaz', 3, 0, '2012-10-18 09:37:23', 1, 0),
(85, 'al qasimia', 'al-qasimia', 3, 0, '2012-10-18 09:37:23', 1, 0),
(86, 'abu shagara', 'abu-shagara', 3, 0, '2012-10-18 09:37:23', 1, 0),
(87, 'al ardiyah', 'al-ardiyah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(88, 'al ayn', 'al-ayn', 3, 0, '2012-10-18 09:37:23', 1, 0),
(89, 'al ayn al ghamur', 'al-ayn-al-ghamur', 3, 0, '2012-10-18 09:37:23', 1, 0),
(90, 'al gharb', 'al-gharb', 3, 0, '2012-10-18 09:37:23', 1, 0),
(91, 'al haira', 'al-haira', 3, 0, '2012-10-18 09:37:23', 1, 0),
(92, 'al hamriya', 'al-hamriya-92', 3, 0, '2012-10-18 09:37:23', 1, 0),
(93, 'al hayrah', 'al-hayrah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(94, 'al heera', 'al-heera', 3, 0, '2012-10-18 09:37:23', 1, 0),
(95, 'al jazirah', 'al-jazirah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(96, 'al khaledia', 'al-khaledia', 3, 0, '2012-10-18 09:37:23', 1, 0),
(97, 'al khan', 'al-khan', 3, 0, '2012-10-18 09:37:23', 1, 0),
(98, 'al layyeh', 'al-layyeh', 3, 0, '2012-10-18 09:37:23', 1, 0),
(99, 'al riqa', 'al-riqa', 3, 0, '2012-10-18 09:37:23', 1, 0),
(100, 'al rolla', 'al-rolla', 3, 0, '2012-10-18 09:37:23', 1, 0),
(101, 'al sharq', 'al-sharq', 3, 0, '2012-10-18 09:37:23', 1, 0),
(102, 'al-hirah', 'al-hirah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(103, 'aliya', 'aliya', 3, 0, '2012-10-18 09:37:23', 1, 0),
(104, 'ar rufaysah', 'ar-rufaysah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(105, 'ash mariqah', 'ash-mariqah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(106, 'ash shariqah', 'ash-shariqah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(107, 'ayn al ghamur', 'ayn-al-ghamur', 3, 0, '2012-10-18 09:37:23', 1, 0),
(108, 'daba', 'daba', 3, 0, '2012-10-18 09:37:23', 1, 0),
(109, 'daba al-hisn', 'daba-al-hisn', 3, 0, '2012-10-18 09:37:23', 1, 0),
(110, 'diba', 'diba', 3, 0, '2012-10-18 09:37:23', 1, 0),
(111, 'diba al hisn', 'diba-al-hisn', 3, 0, '2012-10-18 09:37:23', 1, 0),
(112, 'fakkan', 'fakkan', 3, 0, '2012-10-18 09:37:23', 1, 0),
(113, 'ghail', 'ghail', 3, 0, '2012-10-18 09:37:23', 1, 0),
(114, 'ghalla', 'ghalla', 3, 0, '2012-10-18 09:37:23', 1, 0),
(115, 'ghuna', 'ghuna', 3, 0, '2012-10-18 09:37:23', 1, 0),
(116, 'halwan', 'halwan', 3, 0, '2012-10-18 09:37:23', 1, 0),
(117, 'mughaidir', 'mughaidir', 3, 0, '2012-10-18 09:37:23', 1, 0),
(118, 'wasit', 'wasit', 3, 0, '2012-10-18 09:37:23', 1, 0),
(119, 'ad duss', 'ad-duss', 5, 0, '2012-10-18 09:37:23', 1, 0),
(120, 'adh dhaid', 'adh-dhaid', 5, 0, '2012-10-18 09:37:23', 1, 0),
(121, 'al bustan', 'al-bustan', 5, 0, '2012-10-18 09:37:23', 1, 0),
(122, 'al butain', 'al-butain', 5, 0, '2012-10-18 09:37:23', 1, 0),
(123, 'al dini', 'al-dini', 5, 0, '2012-10-18 09:37:23', 1, 0),
(124, 'al hamidiyah', 'al-hamidiyah', 5, 0, '2012-10-18 09:37:23', 1, 0),
(125, 'al manamah', 'al-manamah', 5, 0, '2012-10-18 09:37:23', 1, 0),
(126, 'al nakheel', 'al-nakhil-126', 5, 0, '2012-10-18 09:37:23', 1, 0),
(127, 'al owan', 'al-owan', 5, 0, '2012-10-18 09:37:23', 1, 0),
(128, 'al rumailah', 'al-rumailah-128', 5, 0, '2012-10-18 09:37:23', 1, 0),
(129, 'al-dhayd', 'al-dhayd', 5, 0, '2012-10-18 09:37:23', 1, 0),
(130, 'awanat', 'awanat', 5, 0, '2012-10-18 09:37:23', 1, 0),
(131, 'bubadi', 'bubadi', 5, 0, '2012-10-18 09:37:23', 1, 0),
(132, 'dayni', 'dayni', 5, 0, '2012-10-18 09:37:23', 1, 0),
(133, 'hamidiya', 'hamidiya', 5, 0, '2012-10-18 09:37:23', 1, 0),
(134, 'ma ali', 'ma-ali', 5, 0, '2012-10-18 09:37:23', 1, 0),
(135, 'manama', 'manama', 5, 0, '2012-10-18 09:37:23', 1, 0),
(136, 'masfut', 'masfut', 5, 0, '2012-10-18 09:37:23', 1, 0),
(137, 'shariyah', 'shariyah', 5, 0, '2012-10-18 09:37:23', 1, 0),
(138, 'sinadil', 'sinadil', 5, 0, '2012-10-18 09:37:23', 1, 0),
(139, 'sufayri', 'sufayri', 5, 0, '2012-10-18 09:37:23', 1, 0),
(140, 'suhaylah', 'suhaylah', 5, 0, '2012-10-18 09:37:23', 1, 0),
(141, 'suheila', 'suheila', 5, 0, '2012-10-18 09:37:23', 1, 0),
(142, 'ujman', 'ujman', 5, 0, '2012-10-18 09:37:23', 1, 0),
(143, 'al aahad', 'al-aahad', 6, 0, '2012-10-18 09:37:23', 1, 0),
(144, 'al haditha', 'al-haditha', 6, 0, '2012-10-18 09:37:23', 1, 0),
(145, 'al hamriya', 'al-hamriya-145', 6, 0, '2012-10-18 09:37:23', 1, 0),
(146, 'al humrah', 'al-humrah', 6, 0, '2012-10-18 09:37:23', 1, 0),
(147, 'al khor', 'al-khor', 6, 0, '2012-10-18 09:37:23', 1, 0),
(148, 'al limghadar', 'al-limghadar', 6, 0, '2012-10-18 09:37:23', 1, 0),
(149, 'al maidan', 'al-maidan', 6, 0, '2012-10-18 09:37:23', 1, 0),
(150, 'al raas', 'al-raas', 6, 0, '2012-10-18 09:37:23', 1, 0),
(151, 'al ramlah', 'al-ramlah', 6, 0, '2012-10-18 09:37:23', 1, 0),
(152, 'al raudah', 'al-raudah', 6, 0, '2012-10-18 09:37:23', 1, 0),
(153, 'al riqqah', 'al-riqqah', 6, 0, '2012-10-18 09:37:23', 1, 0),
(154, 'al salamah', 'al-salamah', 6, 0, '2012-10-18 09:37:23', 1, 0),
(155, 'falaj al ali', 'falaj-al-ali', 6, 0, '2012-10-18 09:37:23', 1, 0),
(156, 'falaj al mu alla', 'falaj-al-mu-alla', 6, 0, '2012-10-18 09:37:23', 1, 0),
(157, 'falaj ibn mu alla', 'falaj-ibn-mu-alla', 6, 0, '2012-10-18 09:37:23', 1, 0),
(158, 'fili ma ala', 'fili-ma-ala', 6, 0, '2012-10-18 09:37:23', 1, 0),
(159, 'ihaid', 'ihaid', 6, 0, '2012-10-18 09:37:23', 1, 0),
(160, 'khatm kabir', 'khatm-kabir', 6, 0, '2012-10-18 09:37:23', 1, 0),
(161, 'lazimah', 'lazimah', 6, 0, '2012-10-18 09:37:23', 1, 0),
(162, 'masjid al mazroui', 'masjid-al-mazroui', 6, 0, '2012-10-18 09:37:23', 1, 0),
(163, 'old town area', 'old-town-area', 6, 0, '2012-10-18 09:37:23', 1, 0),
(164, 'uwaynat', 'uwaynat', 6, 0, '2012-10-18 09:37:23', 1, 0),
(165, 'abadilah', 'abadilah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(166, 'adgat', 'adgat', 7, 0, '2012-10-18 09:37:23', 1, 0),
(167, 'akamiya', 'akamiya', 7, 0, '2012-10-18 09:37:23', 1, 0),
(168, 'al awdah', 'al-awdah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(169, 'al bidya', 'al-bidya', 7, 0, '2012-10-18 09:37:23', 1, 0),
(170, 'al bithna', 'al-bithna', 7, 0, '2012-10-18 09:37:23', 1, 0),
(171, 'al fujayrah', 'al-fujayrah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(172, 'al ghurfah', 'al-ghurfah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(173, 'al halah', 'al-halah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(174, 'al haybah', 'al-haybah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(175, 'al khatam', 'al-khatam', 7, 0, '2012-10-18 09:37:23', 1, 0),
(176, 'al khatt', 'al-khatt', 7, 0, '2012-10-18 09:37:23', 1, 0),
(177, 'al khawiya', 'al-khawiya', 7, 0, '2012-10-18 09:37:23', 1, 0),
(178, 'al khulaybiyah', 'al-khulaybiyah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(179, 'al kubus', 'al-kubus', 7, 0, '2012-10-18 09:37:23', 1, 0),
(180, 'al qurayyah', 'al-qurayyah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(181, 'al uyaynah', 'al-uyaynah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(182, 'al-fudjayra', 'al-fudjayra', 7, 0, '2012-10-18 09:37:23', 1, 0),
(183, 'al-rol', 'al-rol', 7, 0, '2012-10-18 09:37:23', 1, 0),
(184, 'aqqah', 'aqqah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(185, 'ar rul', 'ar-rul', 7, 0, '2012-10-18 09:37:23', 1, 0),
(186, 'arthaban', 'arthaban', 7, 0, '2012-10-18 09:37:23', 1, 0),
(187, 'as saqamqam', 'as-saqamqam', 7, 0, '2012-10-18 09:37:23', 1, 0),
(188, 'ashashah', 'ashashah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(189, 'ayaina', 'ayaina', 7, 0, '2012-10-18 09:37:23', 1, 0),
(190, 'badiya', 'badiya', 7, 0, '2012-10-18 09:37:23', 1, 0),
(191, 'badiyyah', 'badiyyah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(192, 'bilaida', 'bilaida', 7, 0, '2012-10-18 09:37:23', 1, 0),
(193, 'dibba', 'dibba', 7, 0, '2012-10-18 09:37:23', 1, 0),
(194, 'kalba', 'kalba-194', 7, 0, '2012-10-18 09:37:23', 1, 0),
(195, 'khorfakkan', 'khorfakkan-195', 7, 0, '2012-10-18 09:37:23', 1, 0),
(196, 'masafi', 'masafi', 7, 0, '2012-10-18 09:37:23', 1, 0),
(197, 'qidfa', 'qidfa', 7, 0, '2012-10-18 09:37:23', 1, 0),
(198, 'ad dharbaniya', 'ad-dharbaniya', 8, 0, '2012-10-18 09:37:23', 1, 0),
(199, 'adhan', 'adhan', 8, 0, '2012-10-18 09:37:23', 1, 0),
(200, 'adhin', 'adhin', 8, 0, '2012-10-18 09:37:23', 1, 0),
(201, 'ajima', 'ajima', 8, 0, '2012-10-18 09:37:23', 1, 0),
(202, 'al fahlayn', 'al-fahlayn', 8, 0, '2012-10-18 09:37:23', 1, 0),
(203, 'al fai', 'al-fai', 8, 0, '2012-10-18 09:37:23', 1, 0),
(204, 'al fara', 'al-fara', 8, 0, '2012-10-18 09:37:23', 1, 0),
(205, 'al fay', 'al-fay', 8, 0, '2012-10-18 09:37:23', 1, 0),
(206, 'al fulayyah', 'al-fulayyah', 8, 0, '2012-10-18 09:37:23', 1, 0),
(207, 'al ghabah', 'al-ghabah', 8, 0, '2012-10-18 09:37:23', 1, 0),
(208, 'al ghabam', 'al-ghabam', 8, 0, '2012-10-18 09:37:23', 1, 0),
(209, 'al ghashban', 'al-ghashban', 8, 0, '2012-10-18 09:37:23', 1, 0),
(210, 'al ghil', 'al-ghil', 8, 0, '2012-10-18 09:37:23', 1, 0),
(211, 'al hamra', 'al-hamra', 8, 0, '2012-10-18 09:37:23', 1, 0),
(212, 'al hamraniyah', 'al-hamraniyah', 8, 0, '2012-10-18 09:37:23', 1, 0),
(213, 'al hayir', 'al-hayir', 8, 0, '2012-10-18 09:37:23', 1, 0),
(214, 'al hayl', 'al-hayl', 8, 0, '2012-10-18 09:37:23', 1, 0),
(215, 'al hayr', 'al-hayr', 8, 0, '2012-10-18 09:37:23', 1, 0),
(216, 'al hulaylah', 'al-hulaylah', 8, 0, '2012-10-18 09:37:23', 1, 0),
(217, 'al jaddah', 'al-jaddah', 8, 0, '2012-10-18 09:37:23', 1, 0),
(218, 'al jazirah al hamra', 'al-jazirah-al-hamra', 8, 0, '2012-10-18 09:37:23', 1, 0),
(219, 'al kharan', 'al-kharan', 8, 0, '2012-10-18 09:37:23', 1, 0),
(220, 'al khari', 'al-khari', 8, 0, '2012-10-18 09:37:23', 1, 0),
(221, 'al khashfah', 'al-khashfah', 8, 0, '2012-10-18 09:37:23', 1, 0),
(222, 'al maham', 'al-maham', 8, 0, '2012-10-18 09:37:23', 1, 0),
(223, 'al masafirah', 'al-masafirah', 8, 0, '2012-10-18 09:37:23', 1, 0),
(224, 'al mataf', 'al-mataf', 8, 0, '2012-10-18 09:37:23', 1, 0),
(225, 'al mu amurah', 'al-mu-amurah', 8, 0, '2012-10-18 09:37:23', 1, 0),
(226, 'al qawr', 'al-qawr', 8, 0, '2012-10-18 09:37:23', 1, 0),
(227, 'al qir', 'al-qir', 8, 0, '2012-10-18 09:37:23', 1, 0),
(228, 'al qor', 'al-qor', 8, 0, '2012-10-18 09:37:23', 1, 0),
(229, 'algida', 'algida', 8, 0, '2012-10-18 09:37:23', 1, 0),
(230, 'al-naslah', 'al-naslah', 8, 0, '2012-10-18 09:37:23', 1, 0),
(231, 'abu hail', 'abu-hail', 2, 0, '2012-10-18 09:37:23', 1, 0),
(232, 'al buteen', 'al-buteen', 2, 0, '2012-10-18 09:37:23', 1, 0),
(233, 'al hudaiba', 'al-hudaiba', 2, 0, '2012-10-18 09:37:23', 1, 0),
(234, 'al khawaneej', 'al-khawaneez', 2, 0, '2012-10-18 09:37:23', 1, 0),
(235, 'al manee', 'al-manee', 2, 0, '2012-10-18 09:37:23', 1, 0),
(236, 'al mizhar', 'al-mizhar', 2, 0, '2012-10-18 09:37:23', 1, 0),
(237, 'al murar', 'al-murar', 2, 0, '2012-10-18 09:37:23', 1, 0),
(238, 'al nahda', 'al-nahda-238', 2, 0, '2012-10-18 09:37:23', 1, 0),
(239, 'al ras', 'al-ras-239', 2, 0, '2012-10-18 09:37:23', 1, 0),
(240, 'al sabkha', 'al-sabkha', 2, 0, '2012-10-18 09:37:23', 1, 0),
(241, 'al shaab', 'al-shaab', 2, 0, '2012-10-18 09:37:23', 1, 0),
(242, 'al shath', 'al-shath', 2, 0, '2012-10-18 09:37:23', 1, 0),
(243, 'al thanawiya', 'al-thanawiya', 2, 0, '2012-10-18 09:37:23', 1, 0),
(244, 'al twar', 'al-twar', 2, 0, '2012-10-18 09:37:23', 1, 0),
(245, 'al warba', 'al-warba', 2, 0, '2012-10-18 09:37:23', 1, 0),
(246, 'al wasl', 'al-wasl', 2, 0, '2012-10-18 09:37:23', 1, 0),
(247, 'aweer', 'aweer', 2, 0, '2012-10-18 09:37:23', 1, 0),
(248, 'ayal nasir', 'ayal-nasir', 2, 0, '2012-10-18 09:37:23', 1, 0),
(249, 'business bay', 'business-bay', 2, 0, '2012-10-18 09:37:23', 1, 0),
(250, 'dubai health care city', 'dubai-health-care-city', 2, 0, '2012-10-18 09:37:23', 1, 0),
(251, 'hamarain', 'hamarain', 2, 0, '2012-10-18 09:37:23', 1, 0),
(252, 'hamriya', 'hamriya-252', 2, 0, '2012-10-18 09:37:23', 1, 0),
(253, 'hor al anz', 'hor-al-anz', 2, 0, '2012-10-18 09:37:23', 1, 0),
(254, 'jafiliya', 'jafiliya', 2, 0, '2012-10-18 09:37:23', 1, 0),
(255, 'al mamzar', 'al-mamzar', 2, 0, '2012-10-18 09:37:23', 1, 0),
(256, 'masfoot', 'masfoot', 2, 0, '2012-10-18 09:37:23', 1, 0),
(257, 'mizhar', 'mizhar', 2, 0, '2012-10-18 09:37:23', 1, 0),
(258, 'muhaisnah', 'muhaisnah', 2, 0, '2012-10-18 09:37:23', 1, 0),
(259, 'muraqabbat', 'muraqabbat', 2, 0, '2012-10-18 09:37:23', 1, 0),
(260, 'mushrif', 'mushrif', 2, 0, '2012-10-18 09:37:23', 1, 0),
(261, 'al muteena', 'muteena', 2, 0, '2012-10-18 09:37:23', 1, 0),
(262, 'nad al hamar', 'nad-al-hamar', 2, 0, '2012-10-18 09:37:23', 1, 0),
(263, 'outer dubai/others', 'outer-dubaiothers', 2, 0, '2012-10-18 09:37:23', 1, 0),
(264, 'ras al khor', 'ras-al-khor', 2, 0, '2012-10-18 09:37:23', 1, 0),
(265, 'shindagha', 'shindagha', 2, 0, '2012-10-18 09:37:23', 1, 0),
(266, 'springs', 'springs', 2, 0, '2012-10-18 09:37:23', 1, 0),
(267, 'zaabeel', 'zaabeel', 2, 0, '2012-10-18 09:37:23', 1, 0),
(268, 'al aweer', 'al-aweer', 2, 0, '2012-10-18 09:37:23', 1, 0),
(269, 'airport area', 'airport-area-269', 3, 0, '2012-10-18 09:37:23', 1, 0),
(270, 'al azra', 'al-azra', 3, 0, '2012-10-18 09:37:23', 1, 0),
(271, 'al bu daniq', 'al-bu-daniq', 3, 0, '2012-10-18 09:37:23', 1, 0),
(272, 'al buhaira', 'al-buhaira', 3, 0, '2012-10-18 09:37:23', 1, 0),
(273, 'al dhaid', 'al-dhaid', 3, 0, '2012-10-18 09:37:23', 1, 0),
(274, 'al falah', 'al-falah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(275, 'al ghuwair', 'al-ghuwair', 3, 0, '2012-10-18 09:37:23', 1, 0),
(276, 'al goaz', 'al-goaz', 3, 0, '2012-10-18 09:37:23', 1, 0),
(277, 'al jubail', 'al-jubail', 3, 0, '2012-10-18 09:37:23', 1, 0),
(278, 'al madam', 'al-madam', 3, 0, '2012-10-18 09:37:23', 1, 0),
(279, 'al mahatah', 'al-mahatah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(280, 'al majaz 1', 'al-majaz-1', 3, 0, '2012-10-18 09:37:23', 1, 0),
(281, 'al majaz 3', 'al-majaz-3', 3, 0, '2012-10-18 09:37:23', 1, 0),
(282, 'al manakh', 'al-manakh', 3, 0, '2012-10-18 09:37:23', 1, 0),
(283, 'al mujarrah', 'al-mujarrah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(284, 'al nabba', 'al-nabba', 3, 0, '2012-10-18 09:37:23', 1, 0),
(285, 'al nahda', 'al-nahda-285', 3, 0, '2012-10-18 09:37:23', 1, 0),
(286, 'al nasserya', 'al-nasserya', 3, 0, '2012-10-18 09:37:23', 1, 0),
(287, 'al nud', 'al-nud', 3, 0, '2012-10-18 09:37:23', 1, 0),
(288, 'al qadessia', 'al-qadessia', 3, 0, '2012-10-18 09:37:23', 1, 0),
(289, 'al ras', 'al-ras-289', 3, 0, '2012-10-18 09:37:23', 1, 0),
(290, 'al rifah', 'al-rifah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(291, 'al rumailah', 'al-rumailah-291', 3, 0, '2012-10-18 09:37:23', 1, 0),
(292, 'al senala', 'al-senala', 3, 0, '2012-10-18 09:37:23', 1, 0),
(293, 'al shuwaihean', 'al-shuwaihean', 3, 0, '2012-10-18 09:37:23', 1, 0),
(294, 'al sweihat', 'al-sweihat', 3, 0, '2012-10-18 09:37:23', 1, 0),
(295, 'al taawun', 'al-taawun-295', 3, 0, '2012-10-18 09:37:23', 1, 0),
(296, 'al yamook', 'al-yamook', 3, 0, '2012-10-18 09:37:23', 1, 0),
(297, 'al zahra', 'al-zahra-297', 3, 0, '2012-10-18 09:37:23', 1, 0),
(298, 'bu tina', 'bu-tina', 3, 0, '2012-10-18 09:37:23', 1, 0),
(299, 'corniche', 'corniche-299', 3, 0, '2012-10-18 09:37:23', 1, 0),
(300, 'king faisal', 'faisal', 3, 0, '2012-10-18 09:37:23', 1, 0),
(301, 'ghubaiba', 'ghubaiba', 3, 0, '2012-10-18 09:37:23', 1, 0),
(302, 'industrial area', 'industrial-area', 3, 0, '2012-10-18 09:37:23', 1, 0),
(303, 'industrial area 1', 'industrial-area-1', 3, 0, '2012-10-18 09:37:23', 1, 0),
(304, 'kalba', 'kalba-304', 3, 0, '2012-10-18 09:37:23', 1, 0),
(305, 'khorfakkan', 'khorfakkan-305', 3, 0, '2012-10-18 09:37:23', 1, 0),
(306, 'nuaimiya', 'nuaimiya', 3, 0, '2012-10-18 09:37:23', 1, 0),
(307, 'qiyadah', 'qiyadah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(308, 'saman', 'saman', 3, 0, '2012-10-18 09:37:23', 1, 0),
(309, 'sanaeyah', 'sanaeyah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(310, 'sanman', 'sanman', 3, 0, '2012-10-18 09:37:23', 1, 0),
(311, 'um tarrafa', 'um-tarrafa', 3, 0, '2012-10-18 09:37:23', 1, 0),
(312, 'university city zone', 'university-city-zone', 3, 0, '2012-10-18 09:37:23', 1, 0),
(313, 'al wahda', 'al-wahda', 3, 0, '2012-10-18 09:37:23', 1, 0),
(314, 'abu al abyad -2', 'abu-al-abyad-2', 4, 0, '2012-10-18 09:37:23', 1, 0),
(315, 'abu dhabi island', 'abu-dhabi-island', 4, 0, '2012-10-18 09:37:23', 1, 0),
(316, 'airport area', 'airport-area-316', 4, 0, '2012-10-18 09:37:23', 1, 0),
(317, 'al bahia', 'al-bahia', 4, 0, '2012-10-18 09:37:23', 1, 0),
(318, 'al bayah', 'al-bayah', 4, 0, '2012-10-18 09:37:23', 1, 0),
(319, 'al faya', 'al-faya', 4, 0, '2012-10-18 09:37:23', 1, 0),
(320, 'al ghurrah', 'al-ghurrah', 4, 0, '2012-10-18 09:37:23', 1, 0),
(321, 'al ittihad', 'al-ittihad', 4, 0, '2012-10-18 09:37:23', 1, 0),
(322, 'al jawazath', 'al-jawazath', 4, 0, '2012-10-18 09:37:23', 1, 0),
(323, 'al karamah', 'al-karamah-323', 4, 0, '2012-10-18 09:37:23', 1, 0),
(324, 'al mafraq', 'al-mafraq', 4, 0, '2012-10-18 09:37:23', 1, 0),
(325, 'al maha', 'al-maha', 4, 0, '2012-10-18 09:37:23', 1, 0),
(326, 'al mankhal', 'al-mankhal', 4, 0, '2012-10-18 09:37:23', 1, 0),
(327, 'al mirfaa', 'al-mirfaa', 4, 0, '2012-10-18 09:37:23', 1, 0),
(328, 'al nakheel', 'al-nakheel', 4, 0, '2012-10-18 09:37:23', 1, 0),
(329, 'al qathara', 'al-qathara', 4, 0, '2012-10-18 09:37:23', 1, 0),
(330, 'al qubesat', 'al-qubesat', 4, 0, '2012-10-18 09:37:23', 1, 0),
(331, 'al ruwais', 'al-ruwais', 4, 0, '2012-10-18 09:37:23', 1, 0),
(332, 'al safraat', 'al-safraat', 4, 0, '2012-10-18 09:37:23', 1, 0),
(333, 'al salam', 'al-salam', 4, 0, '2012-10-18 09:37:23', 1, 0),
(334, 'al samha', 'al-samha', 4, 0, '2012-10-18 09:37:23', 1, 0),
(335, 'al silaa', 'al-silaa', 4, 0, '2012-10-18 09:37:23', 1, 0),
(336, 'al taawun', 'al-taawun-336', 4, 0, '2012-10-18 09:37:23', 1, 0),
(337, 'al wathba', 'al-wathba', 4, 0, '2012-10-18 09:37:23', 1, 0),
(338, 'al yasat', 'al-yasat', 4, 0, '2012-10-18 09:37:23', 1, 0),
(339, 'asab', 'asab', 4, 0, '2012-10-18 09:37:23', 1, 0),
(340, 'bu hasa', 'bu-hasa', 4, 0, '2012-10-18 09:37:23', 1, 0),
(341, 'corniche', 'corniche-341', 4, 0, '2012-10-18 09:37:23', 1, 0),
(342, 'das island', 'das-island', 4, 0, '2012-10-18 09:37:23', 1, 0),
(343, 'delma island', 'delma-island', 4, 0, '2012-10-18 09:37:23', 1, 0),
(344, 'gayati area ', 'gayati-area-', 4, 0, '2012-10-18 09:37:23', 1, 0),
(345, 'ghiathi', 'ghiathi', 4, 0, '2012-10-18 09:37:23', 1, 0),
(346, 'ghuwaifat', 'ghuwaifat', 4, 0, '2012-10-18 09:37:23', 1, 0),
(347, 'habshan', 'habshan', 4, 0, '2012-10-18 09:37:23', 1, 0),
(348, 'mahawi', 'mahawi', 4, 0, '2012-10-18 09:37:23', 1, 0),
(349, 'marina village', 'marina-village', 4, 0, '2012-10-18 09:37:23', 1, 0),
(350, 'masdar city', 'masdar-city', 4, 0, '2012-10-18 09:37:23', 1, 0),
(351, 'al mussafah', 'mussafah-351', 4, 0, '2012-10-18 09:37:23', 1, 0),
(352, 'seih shuaib', 'seih-shuaib', 4, 0, '2012-10-18 09:37:23', 1, 0),
(353, 'shawamekh', 'shawamekh', 4, 0, '2012-10-18 09:37:23', 1, 0),
(354, 'sila', 'sila', 4, 0, '2012-10-18 09:37:23', 1, 0),
(355, 'sowwah island', 'sowwah-island', 4, 0, '2012-10-18 09:37:23', 1, 0),
(356, 'sweihan', 'sweihan', 4, 0, '2012-10-18 09:37:23', 1, 0),
(357, 'taweela', 'taweela', 4, 0, '2012-10-18 09:37:23', 1, 0),
(358, 'zakum island', 'zakum-island', 4, 0, '2012-10-18 09:37:23', 1, 0),
(359, 'musharief', 'musharief', 5, 0, '2012-10-18 09:37:23', 1, 0),
(360, 'madhab', 'madhab-361', 5, 0, '2012-10-18 09:37:23', 1, 0),
(361, 'al jurf', 'al-jurf', 5, 0, '2012-10-18 09:37:23', 1, 0),
(362, 'hamriya', 'hamriya-363', 5, 0, '2012-10-18 09:37:23', 1, 0),
(363, 'al tala', 'al-tala', 5, 0, '2012-10-18 09:37:23', 1, 0),
(364, 'al zahra', 'al-zahra-365', 5, 0, '2012-10-18 09:37:23', 1, 0),
(365, 'salem al qewani', 'salem-al-qewani', 5, 0, '2012-10-18 09:37:23', 1, 0),
(366, 'al gharafa', 'al-gharafa', 5, 0, '2012-10-18 09:37:23', 1, 0),
(367, 'nuaima', 'nuaima', 5, 0, '2012-10-18 09:37:23', 1, 0),
(368, 'karama', 'karama-369', 5, 0, '2012-10-18 09:37:23', 1, 0),
(369, 'madhab', 'madhab-370', 7, 0, '2012-10-18 09:37:23', 1, 0),
(370, 'tawian', 'tawian', 7, 0, '2012-10-18 09:37:23', 1, 0),
(371, 'arouba', 'arouba', 7, 0, '2012-10-18 09:37:23', 1, 0),
(372, 'kalbar', 'kalbar-373', 7, 0, '2012-10-18 09:37:23', 1, 0),
(373, 'dadna', 'dadna', 7, 0, '2012-10-18 09:37:23', 1, 0),
(374, 'sheikh hamad bin abdullah street', 'sheikh-hamad-bin-abdullah-street', 7, 0, '2012-10-18 09:37:23', 1, 0),
(375, 'al nakheel', 'al-nakhil-376', 8, 0, '2012-10-18 09:37:23', 1, 0),
(376, 'al marid', 'al-marid', 8, 0, '2012-10-18 09:37:23', 1, 0),
(377, 'al seer', 'al-seer', 8, 0, '2012-10-18 09:37:23', 1, 0),
(378, 'nakheel', 'nakheel', 8, 0, '2012-10-18 09:37:23', 1, 0),
(379, 'al uraibi', 'al-uraibi-380', 8, 0, '2012-10-18 09:37:23', 1, 0),
(380, 'khozam', 'khozam', 8, 0, '2012-10-18 09:37:23', 1, 0),
(381, 'al mazraa', 'al-mazraa', 8, 0, '2012-10-18 09:37:23', 1, 0),
(382, 'al daith', 'al-daith', 8, 0, '2012-10-18 09:37:23', 1, 0),
(383, 'al nadiyah', 'al-nadiyah', 8, 0, '2012-10-18 09:37:23', 1, 0),
(384, 'dafan al khor', 'dafan-al-khor', 8, 0, '2012-10-18 09:37:23', 1, 0),
(393, 'umm hurair', 'umm-hurair', 2, 0, '2012-10-18 09:37:23', 1, 0),
(394, 'corniche', 'corniche', 8, 0, '2012-10-18 09:37:23', 1, 0),
(395, 'al ittihad', 'al-ittihad-401', 7, 0, '2012-10-18 09:37:23', 1, 0),
(396, 'corniche', 'corniche-402', 7, 0, '2012-10-18 09:37:23', 1, 0),
(397, 'fujairah dubai intersection', 'fujairah-dubai-intersection', 7, 0, '2012-10-18 09:37:23', 1, 0),
(398, 'airport area', 'airport-area', 7, 0, '2012-10-18 09:37:23', 1, 0),
(399, 'umm al nar', 'umm-al-nar', 4, 0, '2012-10-18 09:37:23', 1, 0),
(400, 'al fardan', 'al-fardan', 3, 0, '2012-10-18 09:37:23', 1, 0),
(401, 'al falah', 'al-falah-408', 4, 0, '2012-10-18 09:37:23', 1, 0),
(402, 'bainal jesrain', 'bainal-jesrain', 4, 0, '2012-10-18 09:37:23', 1, 0),
(403, 'al sada', 'al-sada', 4, 0, '2012-10-18 09:37:23', 1, 0),
(404, 'airport free zone', 'airport-free-zone', 3, 0, '2012-10-18 09:37:23', 1, 0),
(405, 'city centre', 'city-centre', 5, 0, '2012-10-18 09:37:23', 1, 0),
(406, 'new industrial area', 'new-industrial-area', 5, 0, '2012-10-18 09:37:23', 1, 0),
(407, 'military headquarters', 'military-headquarters', 4, 0, '2012-10-18 09:37:23', 1, 0),
(408, 'dubai outsource zone', 'dubai-outsource-zone', 2, 0, '2012-10-18 09:37:23', 1, 0),
(409, 'galadari', 'galadari', 2, 0, '2012-10-18 09:37:23', 1, 0),
(410, 'emirates road', 'emirates-road', 5, 0, '2012-10-18 09:37:23', 1, 0),
(411, 'al jarf', 'al-jarf', 5, 0, '2012-10-18 09:37:23', 1, 0),
(412, 'sharjah - fujairah road', 'sharjah-fujairah-road', 3, 0, '2012-10-18 09:37:23', 1, 0),
(413, 'abu al abyad', 'abu-al-abyad', 4, 0, '2012-10-18 09:37:23', 1, 0),
(414, 'abu zaby', 'abu-zaby', 4, 0, '2012-10-18 09:37:23', 1, 0),
(415, 'adnec', 'adnec', 4, 0, '2012-10-18 09:37:23', 1, 0),
(416, 'al khaleej al arabi road', 'al-khaleej-al-arabi-road', 4, 0, '2012-10-18 09:37:23', 1, 0),
(417, 'al mamoura', 'al-mamoura', 4, 0, '2012-10-18 09:37:23', 1, 0),
(418, 'al maryah island', 'al-maryah-island', 4, 0, '2012-10-18 09:37:23', 1, 0),
(419, 'al mattar road', 'al-mattar-road', 4, 0, '2012-10-18 09:37:23', 1, 0),
(420, 'al musalla', 'al-musalla', 4, 0, '2012-10-18 09:37:23', 1, 0),
(421, 'al remha', 'al-remha', 4, 0, '2012-10-18 09:37:23', 1, 0),
(422, 'al riyadiya', 'al-riyadiya', 4, 0, '2012-10-18 09:37:23', 1, 0),
(423, 'al saya', 'al-saya', 4, 0, '2012-10-18 09:37:23', 1, 0),
(424, 'corniche break water', 'corniche-break-water', 4, 0, '2012-10-18 09:37:23', 1, 0),
(425, 'corniche road', 'corniche-road', 4, 0, '2012-10-18 09:37:23', 1, 0),
(426, 'dana muroor road', 'dana-muroor-road', 4, 0, '2012-10-18 09:37:23', 1, 0),
(427, 'golf garden', 'golf-garden', 4, 0, '2012-10-18 09:37:23', 1, 0),
(428, 'liwa desert', 'liwa-desert', 4, 0, '2012-10-18 09:37:23', 1, 0),
(429, 'musharaf', 'musharaf', 4, 0, '2012-10-18 09:37:23', 1, 0),
(430, 'mussafah industrial', 'mussafah-industrial', 4, 0, '2012-10-18 09:37:23', 1, 0),
(431, 'new airport road', 'new-airport-road', 4, 0, '2012-10-18 09:37:23', 1, 0),
(432, 'officer city', 'officer-city', 4, 0, '2012-10-18 09:37:23', 1, 0),
(433, 'port zayed', 'port-zayed', 4, 0, '2012-10-18 09:37:23', 1, 0),
(434, 'samha', 'samha', 4, 0, '2012-10-18 09:37:23', 1, 0),
(435, 'samha road', 'samha-road', 4, 0, '2012-10-18 09:37:23', 1, 0),
(436, 'sheik maktoum bin rashid road', 'sheik-maktoum-bin-rashid-road', 4, 0, '2012-10-18 09:37:23', 1, 0),
(437, 'twin towers', 'twin-towers', 4, 0, '2012-10-18 09:37:23', 1, 0),
(438, 'zayed bridge', 'zayed-bridge', 4, 0, '2012-10-18 09:37:23', 1, 0),
(439, 'zayed sports city', 'zayed-sports-city', 4, 0, '2012-10-18 09:37:23', 1, 0),
(440, 'al baraha', 'al-baraha', 2, 0, '2012-10-18 09:37:23', 1, 0),
(441, 'corniche', 'corniche-450', 2, 0, '2012-10-18 09:37:23', 1, 0),
(442, 'al butina', 'al-butina', 3, 0, '2012-10-18 09:37:23', 1, 0),
(443, 'al dar al baida', 'al-dar-al-baida', 6, 0, '2012-10-18 09:37:23', 1, 0),
(444, 'al talah', 'al-talah', 3, 0, '2012-10-18 09:37:23', 1, 0),
(445, 'khor al baida', 'khor-al-baida', 6, 0, '2012-10-18 09:37:23', 1, 0),
(446, 'nad al sheba', 'nad-al-sheba', 2, 0, '2012-10-18 09:37:23', 1, 0),
(447, 'al wahda road', 'al-wahda-road', 3, 0, '2012-10-18 09:37:23', 1, 0),
(448, 'airport road', 'airport-road', 2, 0, '2012-10-18 09:37:23', 1, 0),
(449, 'dubai outlet mall', 'dubai-outlet-mall', 2, 0, '2012-10-18 09:37:23', 1, 0),
(450, 'al khezammia', 'al-khezammia', 3, 0, '2012-10-18 09:37:23', 1, 0),
(451, 'paragon bay', 'paragon-bay', 4, 0, '2012-10-18 09:37:23', 1, 0),
(452, 'airport road', 'airport-road-462', 4, 0, '2012-10-18 09:37:23', 1, 0),
(453, 'rashidiya', 'rashidiya-463', 5, 0, '2012-10-18 09:37:23', 1, 0),
(454, 'rak bank road', 'rak-bank-road', 5, 0, '2012-10-18 09:37:23', 1, 0),
(455, 'bin bader', 'bin-bader', 5, 0, '2012-10-18 09:37:23', 1, 0),
(456, 'ajman beach road', 'ajman-beach-road', 5, 0, '2012-10-18 09:37:23', 1, 0),
(457, 'al gaith', 'al-gaith', 5, 0, '2012-10-18 09:37:23', 1, 0),
(458, 'corniche road', 'corniche-road-468', 5, 0, '2012-10-18 09:37:23', 1, 0),
(459, 'al faseel rd', 'al-faseel-rd', 7, 0, '2012-10-18 09:37:23', 1, 0),
(460, 'ahmed bin abdulla street', 'ahmed-bin-abdulla-street', 7, 0, '2012-10-18 09:37:23', 1, 0),
(461, 'al mustaqbal', 'al-mustaqbal', 7, 0, '2012-10-18 09:37:23', 1, 0),
(462, 'king faisal road', 'king-faisal-road', 7, 0, '2012-10-18 09:37:23', 1, 0),
(463, 'city of fujairah', 'city-of-fujairah', 7, 0, '2012-10-18 09:37:23', 1, 0),
(464, 'fujairah trade centre', 'fujairah-trade-centre', 7, 0, '2012-10-18 09:37:23', 1, 0),
(465, 'dafan al nakheel', 'dafan-al-nakheel', 8, 0, '2012-10-18 09:37:23', 1, 0),
(466, 'king faisal road', 'king-faisal-road-476', 8, 0, '2012-10-18 09:37:23', 1, 0),
(467, 'al mustaqbal', 'al-mustaqbal-477', 8, 0, '2012-10-18 09:37:23', 1, 0),
(468, 'ahmed bin abdulla street', 'ahmed-bin-abdulla-street-478', 8, 0, '2012-10-18 09:37:23', 1, 0),
(469, 'sidroh', 'sidroh', 8, 0, '2012-10-18 09:37:23', 1, 0),
(478, 'abadilah 1', 'abadilah-1', 7, 0, '2012-10-18 09:37:23', 1, 1),
(479, 'Al Ain  Road', 'al-ain-road', 2, 0, '2012-12-16 17:04:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=248 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms', 'yes'),
(2, 'blogname', 'OCOO || The Beauty Drink', 'yes'),
(3, 'blogdescription', 'Just another WordPress site', 'yes'),
(4, 'users_can_register', '0', 'yes'),
(5, 'admin_email', 'karthik@hgwmedia.com', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '1', 'yes'),
(10, 'comments_notify', '1', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'open', 'yes'),
(19, 'default_ping_status', 'open', 'yes'),
(20, 'default_pingback_flag', '1', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'F j, Y', 'yes'),
(23, 'time_format', 'g:i a', 'yes'),
(24, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(25, 'links_recently_updated_prepend', '<em>', 'yes'),
(26, 'links_recently_updated_append', '</em>', 'yes'),
(27, 'links_recently_updated_time', '120', 'yes'),
(28, 'comment_moderation', '0', 'yes'),
(29, 'moderation_notify', '1', 'yes'),
(30, 'permalink_structure', '/%postname%/', 'yes'),
(31, 'gzipcompression', '0', 'yes'),
(32, 'hack_file', '0', 'yes'),
(33, 'blog_charset', 'UTF-8', 'yes'),
(34, 'moderation_keys', '', 'no'),
(35, 'active_plugins', 'a:6:{i:0;s:58:"contact-form-7-to-database-extension/contact-form-7-db.php";i:1;s:36:"contact-form-7/wp-contact-form-7.php";i:2;s:50:"local-search-seo-contact-page/seo-contact-page.php";i:3;s:25:"ooco_press/ooco_press.php";i:4;s:31:"ooco_products/ooco_products.php";i:5;s:39:"ooco_testimonials/ooco_testimonials.php";}', 'yes'),
(36, 'home', 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms', 'yes'),
(37, 'category_base', '', 'yes'),
(38, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(39, 'advanced_edit', '0', 'yes'),
(40, 'comment_max_links', '2', 'yes'),
(41, 'gmt_offset', '4', 'yes'),
(42, 'default_email_category', '1', 'yes'),
(43, 'recently_edited', '', 'no'),
(44, 'template', 'ooco_beauty', 'yes'),
(45, 'stylesheet', 'ooco_beauty', 'yes'),
(46, 'comment_whitelist', '1', 'yes'),
(47, 'blacklist_keys', '', 'no'),
(48, 'comment_registration', '0', 'yes'),
(49, 'html_type', 'text/html', 'yes'),
(50, 'use_trackback', '0', 'yes'),
(51, 'default_role', 'subscriber', 'yes'),
(52, 'db_version', '22441', 'yes'),
(53, 'uploads_use_yearmonth_folders', '1', 'yes'),
(54, 'upload_path', '', 'yes'),
(55, 'blog_public', '1', 'yes'),
(56, 'default_link_category', '2', 'yes'),
(57, 'show_on_front', 'posts', 'yes'),
(58, 'tag_base', '', 'yes'),
(59, 'show_avatars', '1', 'yes'),
(60, 'avatar_rating', 'G', 'yes'),
(61, 'upload_url_path', '', 'yes'),
(62, 'thumbnail_size_w', '150', 'yes'),
(63, 'thumbnail_size_h', '150', 'yes'),
(64, 'thumbnail_crop', '1', 'yes'),
(65, 'medium_size_w', '300', 'yes'),
(66, 'medium_size_h', '300', 'yes'),
(67, 'avatar_default', 'mystery', 'yes'),
(68, 'large_size_w', '1024', 'yes'),
(69, 'large_size_h', '1024', 'yes'),
(70, 'image_default_link_type', 'file', 'yes'),
(71, 'image_default_size', '', 'yes'),
(72, 'image_default_align', '', 'yes'),
(73, 'close_comments_for_old_posts', '0', 'yes'),
(74, 'close_comments_days_old', '14', 'yes'),
(75, 'thread_comments', '1', 'yes'),
(76, 'thread_comments_depth', '5', 'yes'),
(77, 'page_comments', '0', 'yes'),
(78, 'comments_per_page', '50', 'yes'),
(79, 'default_comments_page', 'newest', 'yes'),
(80, 'comment_order', 'asc', 'yes'),
(81, 'sticky_posts', 'a:0:{}', 'yes'),
(82, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(83, 'widget_text', 'a:0:{}', 'yes'),
(84, 'widget_rss', 'a:0:{}', 'yes'),
(85, 'uninstall_plugins', 'a:0:{}', 'no'),
(86, 'timezone_string', '', 'yes'),
(87, 'page_for_posts', '0', 'yes'),
(88, 'page_on_front', '0', 'yes'),
(89, 'default_post_format', '0', 'yes'),
(90, 'link_manager_enabled', '0', 'yes'),
(91, 'initial_db_version', '22441', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:64:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:5:"eShop";b:1;s:11:"eShop_admin";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:35:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:5:"eShop";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:8:{s:19:"wp_inactive_widgets";a:0:{}s:19:"primary-widget-area";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:21:"secondary-widget-area";a:0:{}s:24:"first-footer-widget-area";a:0:{}s:25:"second-footer-widget-area";N;s:24:"third-footer-widget-area";N;s:25:"fourth-footer-widget-area";N;s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:4:{i:1363643647;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1363688948;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1363693593;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(146, 'inkthemes_options', 'a:35:{s:11:"of_template";a:20:{i:0;a:2:{s:4:"name";s:16:"General Settings";s:4:"type";s:7:"heading";}i:1;a:4:{s:4:"name";s:11:"Custom Logo";s:4:"desc";s:61:"Choose your own logo. Optimal Size: 160px Wide by 30px Height";s:2:"id";s:14:"inkthemes_logo";s:4:"type";s:6:"upload";}i:2;a:4:{s:4:"name";s:14:"Custom Favicon";s:4:"desc";s:71:"Specify a 16px x 16px image that will represent your website''s favicon.";s:2:"id";s:17:"inkthemes_favicon";s:4:"type";s:6:"upload";}i:3;a:5:{s:4:"name";s:13:"Tracking Code";s:4:"desc";s:58:"Paste your Google Analytics (or other) tracking code here.";s:2:"id";s:19:"inkthemes_analytics";s:3:"std";s:0:"";s:4:"type";s:8:"textarea";}i:4;a:2:{s:4:"name";s:21:"Social media Settings";s:4:"type";s:7:"heading";}i:5;a:5:{s:4:"name";s:17:"Facebook page URL";s:4:"desc";s:33:"paste your facebook page Url here";s:2:"id";s:25:"social_media_facebook_url";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:6;a:5:{s:4:"name";s:14:"Facebook Label";s:4:"desc";s:44:"Paste your label for your facebook page here";s:2:"id";s:27:"social_media_facebook_title";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:7;a:5:{s:4:"name";s:25:"Facebook page description";s:4:"desc";s:36:"Paste your facebook page description";s:2:"id";s:33:"social_media_facebook_description";s:3:"std";s:0:"";s:4:"type";s:8:"textarea";}i:8;a:5:{s:4:"name";s:16:"Twitter page URL";s:4:"desc";s:32:"paste your twitter page Url here";s:2:"id";s:24:"social_media_twitter_url";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:9;a:5:{s:4:"name";s:13:"Twitter Label";s:4:"desc";s:43:"Paste your label for your Twitter page here";s:2:"id";s:26:"social_media_twitter_title";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:10;a:5:{s:4:"name";s:24:"Twitter page description";s:4:"desc";s:35:"Paste your twitter page description";s:2:"id";s:32:"social_media_twitter_description";s:3:"std";s:0:"";s:4:"type";s:8:"textarea";}i:11;a:5:{s:4:"name";s:16:"YouTube page URL";s:4:"desc";s:32:"paste your YouTube page Url here";s:2:"id";s:24:"social_media_youtube_url";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:12;a:5:{s:4:"name";s:13:"YouTube Label";s:4:"desc";s:43:"Paste your label for your YouTube page here";s:2:"id";s:26:"social_media_youtube_title";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:13;a:5:{s:4:"name";s:24:"YouTube page description";s:4:"desc";s:35:"Paste your YouTube page description";s:2:"id";s:32:"social_media_youtube_description";s:3:"std";s:0:"";s:4:"type";s:8:"textarea";}i:14;a:5:{s:4:"name";s:18:"Pinterest page URL";s:4:"desc";s:34:"paste your Pinterest page Url here";s:2:"id";s:26:"social_media_pinterest_url";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:15;a:5:{s:4:"name";s:15:"Pinterest Label";s:4:"desc";s:45:"Paste your label for your Pinterest page here";s:2:"id";s:28:"social_media_pinterest_title";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:16;a:5:{s:4:"name";s:26:"Pinterest page description";s:4:"desc";s:37:"Paste your Pinterest page description";s:2:"id";s:34:"social_media_pinterest_description";s:3:"std";s:0:"";s:4:"type";s:8:"textarea";}i:17;a:5:{s:4:"name";s:18:"Instagram page URL";s:4:"desc";s:34:"paste your Instagram page Url here";s:2:"id";s:26:"social_media_instagram_url";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:18;a:5:{s:4:"name";s:15:"Instagram Label";s:4:"desc";s:45:"Paste your label for your Instagram page here";s:2:"id";s:28:"social_media_instagram_title";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:19;a:5:{s:4:"name";s:26:"Instagram page description";s:4:"desc";s:37:"Paste your Instagram page description";s:2:"id";s:34:"social_media_instagram_description";s:3:"std";s:0:"";s:4:"type";s:8:"textarea";}}s:12:"of_themename";s:11:"OOCO Beauty";s:12:"of_shortname";s:2:"of";s:14:"inkthemes_logo";s:100:"http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/wp-content/uploads/2013/03/OCOOlogo_header.png";s:17:"inkthemes_favicon";s:92:"http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/wp-content/uploads/2013/03/favicon.ico";s:19:"inkthemes_analytics";s:0:"";s:20:"inkthemes_featureimg";s:0:"";s:19:"inkthemes_headline1";s:0:"";s:14:"inkthemes_img1";s:0:"";s:18:"inkthemes_feature1";s:0:"";s:15:"inkthemes_link1";s:0:"";s:19:"inkthemes_headline2";s:0:"";s:14:"inkthemes_img2";s:0:"";s:18:"inkthemes_feature2";s:0:"";s:15:"inkthemes_link2";s:0:"";s:19:"inkthemes_headline3";s:0:"";s:14:"inkthemes_img3";s:0:"";s:18:"inkthemes_feature3";s:0:"";s:15:"inkthemes_link3";s:0:"";s:17:"inkthemes_options";a:16:{s:14:"inkthemes_logo";s:0:"";s:17:"inkthemes_favicon";s:0:"";s:19:"inkthemes_analytics";s:0:"";s:20:"inkthemes_featureimg";s:0:"";s:19:"inkthemes_headline1";s:0:"";s:14:"inkthemes_img1";s:0:"";s:18:"inkthemes_feature1";s:0:"";s:15:"inkthemes_link1";s:0:"";s:19:"inkthemes_headline2";s:0:"";s:14:"inkthemes_img2";s:0:"";s:18:"inkthemes_feature2";s:0:"";s:15:"inkthemes_link2";s:0:"";s:19:"inkthemes_headline3";s:0:"";s:14:"inkthemes_img3";s:0:"";s:18:"inkthemes_feature3";s:0:"";s:15:"inkthemes_link3";s:0:"";}s:25:"social_media_facebook_url";s:35:"https://www.facebook.com/OCOOBeauty";s:33:"social_media_facebook_description";s:187:"l enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cuscipit impercibus diam sit amet mi eleifend vitae aliquet mauris ";s:24:"social_media_twitter_url";s:30:"https://twitter.com/OcooBeauty";s:32:"social_media_twitter_description";s:38:"l enim euismod ultrices. Sed ac egesta";s:24:"social_media_youtube_url";s:0:"";s:32:"social_media_youtube_description";s:0:"";s:26:"social_media_pinterest_url";s:32:"http://pinterest.com/OcooBeauty/";s:34:"social_media_pinterest_description";s:119:"l enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere";s:26:"social_media_instagram_url";s:31:"http://instagram.com/OcooBeauty";s:34:"social_media_instagram_description";s:188:"l enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cuscipit impercibus diam sit amet mi eleifend vitae aliquet mauris\r\n";s:27:"social_media_facebook_title";s:23:"Facebook.com/OcooBeauty";s:26:"social_media_twitter_title";s:23:" twitter.com/OcooBeauty";s:26:"social_media_youtube_title";s:0:"";s:28:"social_media_pinterest_title";s:25:"pinterest.com/OcooBeauty/";s:28:"social_media_instagram_title";s:25:" Instagram.com/OcooBeauty";}', 'yes'),
(101, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:1:{i:0;O:8:"stdClass":9:{s:8:"response";s:6:"latest";s:8:"download";s:40:"http://wordpress.org/wordpress-3.5.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":4:{s:4:"full";s:40:"http://wordpress.org/wordpress-3.5.1.zip";s:10:"no_content";s:51:"http://wordpress.org/wordpress-3.5.1-no-content.zip";s:11:"new_bundled";s:52:"http://wordpress.org/wordpress-3.5.1-new-bundled.zip";s:7:"partial";b:0;}s:7:"current";s:5:"3.5.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.5";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1363600539;s:15:"version_checked";s:5:"3.5.1";}', 'yes'),
(166, '_site_transient_update_plugins', 'O:8:"stdClass":3:{s:12:"last_checked";i:1363600539;s:7:"checked";a:9:{s:19:"akismet/akismet.php";s:5:"2.5.7";s:36:"contact-form-7/wp-contact-form-7.php";s:5:"3.3.3";s:58:"contact-form-7-to-database-extension/contact-form-7-db.php";s:3:"2.5";s:9:"hello.php";s:3:"1.6";s:50:"local-search-seo-contact-page/seo-contact-page.php";s:5:"1.0.2";s:25:"ooco_press/ooco_press.php";s:0:"";s:31:"ooco_products/ooco_products.php";s:0:"";s:39:"ooco_testimonials/ooco_testimonials.php";s:0:"";s:43:"testimonials-widget/testimonials-widget.php";s:5:"2.9.1";}s:8:"response";a:1:{s:58:"contact-form-7-to-database-extension/contact-form-7-db.php";O:8:"stdClass":5:{s:2:"id";s:5:"16507";s:4:"slug";s:36:"contact-form-7-to-database-extension";s:11:"new_version";s:5:"2.5.1";s:3:"url";s:73:"http://wordpress.org/extend/plugins/contact-form-7-to-database-extension/";s:7:"package";s:84:"http://downloads.wordpress.org/plugin/contact-form-7-to-database-extension.2.5.1.zip";}}}', 'yes'),
(244, '_site_transient_timeout_theme_roots', '1363602340', 'yes'),
(245, '_site_transient_theme_roots', 'a:2:{s:11:"ooco_beauty";s:7:"/themes";s:11:"themia-lite";s:7:"/themes";}', 'yes'),
(153, '_site_transient_update_themes', 'O:8:"stdClass":3:{s:12:"last_checked";i:1363583488;s:7:"checked";a:2:{s:11:"ooco_beauty";s:3:"1.0";s:11:"themia-lite";s:5:"1.3.1";}s:8:"response";a:0:{}}', 'yes'),
(106, '_site_transient_timeout_browser_a5eed82526012fbf52a4469d70d0dd0a', '1363861749', 'yes'),
(107, '_site_transient_browser_a5eed82526012fbf52a4469d70d0dd0a', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"19.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(108, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:53:"http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms";s:4:"link";s:129:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/";s:3:"url";s:162:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:14:"WordPress Blog";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:20:"Other WordPress News";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(111, 'can_compress_scripts', '1', 'yes'),
(112, '_transient_timeout_feed_e9611637e0004dea1342d6337620d138', '1363300150', 'no'),
(113, '_transient_feed_e9611637e0004dea1342d6337620d138', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:4:"\n  \n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:33:"\n    \n    \n    \n    \n    \n    \n  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:80:"link:http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/ - Google Blog Search";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:117:"http://www.google.com/search?ie=utf-8&q=link:http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/&tbm=blg&tbs=sbd:1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:111:"Your search - <b>link:http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/</b> - did not match any documents.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://a9.com/-/spec/opensearch/1.1/";a:3:{s:12:"totalResults";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:10:"startIndex";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:12:"itemsPerPage";a:1:{i:0;a:5:{s:4:"data";s:2:"10";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:9:{s:12:"content-type";s:28:"text/xml; charset=ISO-8859-1";s:4:"date";s:29:"Thu, 14 Mar 2013 10:29:06 GMT";s:7:"expires";s:2:"-1";s:13:"cache-control";s:18:"private, max-age=0";s:10:"set-cookie";a:2:{i:0;s:143:"PREF=ID=92bf896b88019928:FF=0:TM=1363256946:LM=1363256946:S=zv7XqCARAKFom5E5; expires=Sat, 14-Mar-2015 10:29:06 GMT; path=/; domain=.google.com";i:1;s:212:"NID=67=bpHd9teaNFnidWB6oTAdQug1B6v323C0j18FwnD5r1EP3vvtNy97Glsp5ZMycg-HkVUpzR8-ZL4RgdqiawZJCJHdcK4wpDqLdUmWb3drSzPLwhmnShF7XnuzfoStjuNd; expires=Fri, 13-Sep-2013 10:29:06 GMT; path=/; domain=.google.com; HttpOnly";}s:3:"p3p";s:122:"CP="This is not a P3P policy! See http://www.google.com/support/accounts/bin/answer.py?hl=en&answer=151657 for more info."";s:6:"server";s:3:"gws";s:16:"x-xss-protection";s:13:"1; mode=block";s:15:"x-frame-options";s:10:"SAMEORIGIN";}s:5:"build";s:14:"20121202124312";}', 'no'),
(114, '_transient_timeout_feed_mod_e9611637e0004dea1342d6337620d138', '1363300150', 'no'),
(115, '_transient_feed_mod_e9611637e0004dea1342d6337620d138', '1363256950', 'no'),
(239, '_transient_timeout_feed_mod_867bd5c64f85878d03a060509cd2f92c', '1363640352', 'no'),
(240, '_transient_feed_mod_867bd5c64f85878d03a060509cd2f92c', '1363597152', 'no'),
(241, '_transient_timeout_dash_aa95765b5cc111c56d5993d476b1c2f0', '1363640352', 'no'),
(242, '_transient_dash_aa95765b5cc111c56d5993d476b1c2f0', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://alexking.org/blog/2013/03/17/announcing-threads'' title=''.threads-post-notice { background: #e8e8e8; padding: 10px; } .threads-post-notice a { font-weight: bold; } I’ve just released an initial beta of Threads, a WordPress plugin I’ve been working on for about a year. The idea is simple: show posts that comprise a single overall story/topic in a timeline. Then link to that timeline from the posts so that your  [&hellip;]''>Alex King: Announcing Threads</a></li><li><a class=''rsswidget'' href=''http://feedproxy.google.com/~r/weblogtoolscollection/UXMP/~3/iCzrsWmhJSE/'' title=''New plugins Barc Chat provides a simple yet feature rich chat room for your whole community to interact in real-time directly on your site. Get Directions is a flexible and responsive map plugin. Namaste! LMS is a learning management system for WordPress. Pinterest Verify Meta Tag simply inserts the Pinterest meta tag verification code to the correct section [&hellip;]''>Weblog Tools Collection: WordPress Plugin Releases for 3/17</a></li><li><a class=''rsswidget'' href=''http://wordpress.tv/2013/03/17/make-quick-posts-to-your-wordpress-blog-with-press-this/'' title='' [&hellip;]''>WordPress.tv: Make Quick Posts to Your WordPress Blog with Press This</a></li><li><a class=''rsswidget'' href=''http://wordpress.tv/2013/03/17/chris-lema-success-in-distributed-contexts/'' title='' [&hellip;]''>WordPress.tv: Chris Lema: Success in Distributed Contexts</a></li><li><a class=''rsswidget'' href=''http://wordpress.tv/2013/03/16/melinda-samson-workshop-google-analytics-101/'' title='' [&hellip;]''>WordPress.tv: Melinda Samson: Google Analytics 101 Workshop</a></li></ul></div>', 'no'),
(124, '_transient_timeout_feed_a5420c83891a9c88ad2a4f04584a5efc', '1363300152', 'no'),
(125, '_transient_feed_a5420c83891a9c88ad2a4f04584a5efc', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"http://wordpress.org/extend/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 10:28:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"WordPress SEO by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/extend/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"8321@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using the WordPress SEO plugin by Yoast.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"http://wordpress.org/extend/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:39:"15@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/extend/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"23862@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:104:"Supercharge your WordPress site with powerful features previously only available to WordPress.com users.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:24:"Michael Adams (mdawaffe)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"http://wordpress.org/extend/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"2141@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Google Analytics for WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:77:"http://wordpress.org/extend/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"2316@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:145:"Track your WordPress site easily and with lots of metadata: views per author &#38; category, automatic tracking of outbound clicks and pageviews.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"http://wordpress.org/extend/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:40:"132@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Arne";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wordpress.org/extend/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"18101@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wordpress.org/extend/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"1169@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:120:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 6 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://wordpress.org/extend/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:40:"753@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:86:"WordPress SEO plugin to automatically optimize your Wordpress blog for Search Engines.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/extend/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"29860@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Ultimate TinyMCE";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/extend/plugins/ultimate-tinymce/#post-32088";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Nov 2011 09:06:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"32088@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:84:"Description: Beef up your visual tinymce editor with a plethora of advanced options.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Josh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"W3 Total Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wordpress.org/extend/plugins/w3-total-cache/#post-12073";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2009 18:46:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"12073@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Easy Web Performance Optimization (WPO) using caching: browser, page, object, database, minify and content delivery network support.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Frederick Townes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:8:"Facebook";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://wordpress.org/extend/plugins/facebook/#post-37351";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 02 May 2012 19:36:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"37351@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Add Facebook social plugins and the ability to publish new posts to a Facebook Timeline or Facebook Page. Official Facebook plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:18:"Samuel Wood (Otto)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:8:"BackWPup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://wordpress.org/extend/plugins/backwpup/#post-11392";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 23 Jun 2009 11:31:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"11392@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:53:"Flexible, scheduled WordPress backups to any location";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Daniel Huesken";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Share Buttons by AddThis";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://wordpress.org/extend/plugins/addthis/#post-8124";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 17 Dec 2008 16:03:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"8124@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:134:"AddThis Share Buttons help drive traffic to your site by helping visitors share, bookmark and email your content to over 330 services.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"_mjk_";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:52:"http://wordpress.org/extend/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:7:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Thu, 14 Mar 2013 10:29:07 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Thu, 01 Jan 2009 20:34:44 GMT";s:4:"x-nc";s:11:"HIT luv 139";}s:5:"build";s:14:"20121202124312";}', 'no'),
(126, '_transient_timeout_feed_mod_a5420c83891a9c88ad2a4f04584a5efc', '1363300152', 'no'),
(127, '_transient_feed_mod_a5420c83891a9c88ad2a4f04584a5efc', '1363256952', 'no'),
(128, '_transient_timeout_feed_57bc725ad6568758915363af670fd8bc', '1363300152', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(129, '_transient_feed_57bc725ad6568758915363af670fd8bc', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress Plugins » View: Newest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:47:"http://wordpress.org/extend/plugins/browse/new/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress Plugins » View: Newest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 09:57:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Filmied";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://wordpress.org/extend/plugins/filmtied/#post-50666";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 13 Mar 2013 14:34:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50666@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:59:"Filmtied plugin replaces IMDB links with Filmtied.com links";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"Filmtied";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"BulkPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"http://wordpress.org/extend/plugins/bulkpress/#post-50647";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Mar 2013 20:26:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50647@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"Easily add multiple categories, pages, custom taxonomy terms and custom post type posts. By just listing the titles and possibly the slugs, this plugi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:18:"Jesper van Engelen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"Comment Redlist";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.org/extend/plugins/comment-redlist/#post-50675";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 13 Mar 2013 17:06:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50675@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:149:"Plugin offers a &#34;redlist&#34; which compliments the blacklist in Settings &#62; Discussion. If a character sequence in the redlist is in any part";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"skunkbad";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:38:"Easy Digital Downloads - Free Download";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"http://wordpress.org/extend/plugins/easy-digital-downloads-free-download/#post-50632";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Mar 2013 15:29:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50632@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:78:"Easy Digital Downloads extension for easier free download or freebies sharing.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"vafpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Float Ads Fixed Position";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"http://wordpress.org/extend/plugins/float-ads-fixed-position/#post-50662";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 13 Mar 2013 10:10:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50662@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"This plugin usefull for advertising on sidebar. Ads will drift vertically down to the footer, ads will disappear. The position of ads always fixed whi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:6:"saokim";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"Pinterest Site Verification plugin using Meta Tag";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"http://wordpress.org/extend/plugins/pinterest-site-verification/#post-50671";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 13 Mar 2013 15:26:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50671@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:82:"Simply insert your Pinterest meta tag verification code using this helpful plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Himanshu Parashar";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"ContactUs.com Contact Form+";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/extend/plugins/contactuscom/#post-50612";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Mar 2013 23:05:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50612@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:70:"Add Contact Form from ContactUs.com account to your WordPress website.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"ContactUs.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:41:"Gravity Forms Paystation (3 Party Hosted)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:87:"http://wordpress.org/extend/plugins/gravity-forms-paystation-3-party-hosted/#post-50553";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Mar 2013 02:13:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50553@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:144:"Integrates Gravity Forms with the Paystation 3 party hosted payment gateway allowing end-users to purchase goods and services via Gravity Forms.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"paystationNZ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Sidebar Per User Role";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"http://wordpress.org/extend/plugins/sidebar-per-user-role/#post-50569";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Mar 2013 14:01:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50569@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:52:"This Plugin lets you display a sidebar per user role";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Bainternet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"Empty Title &amp; Category Checker";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:76:"http://wordpress.org/extend/plugins/empty-title-category-checker/#post-50342";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 07 Mar 2013 15:15:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50342@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:117:"Checks if title is empty or if no category or category &#34;no category&#34; is checked then cancel publish or update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Dmitry Fatakov";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Sunrise";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/extend/plugins/sunrise/#post-49956";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 25 Feb 2013 04:54:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49956@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:56:"Quick deployment, together with sufficient functionality";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"gn_themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"FRED At a Glance";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/extend/plugins/fred-at-a-glance/#post-50337";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 07 Mar 2013 14:23:33 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50337@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:112:"A widget showcasing popular economic data series from the Federal Reserve Bank of St. Louis&#039; FRED database.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Julie Knoll";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Bible References";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/extend/plugins/bible-references/#post-50349";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 07 Mar 2013 20:16:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50349@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:174:"Website <a href="http://bibleonline.ru/tools/ref/" rel="nofollow">http://bibleonline.ru/tools/ref/</a>\n\nAutomatically replace Bible references to a hyperlink with Bible text.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"bibleonline";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"Manage Calameo Publications by Athlon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:82:"http://wordpress.org/extend/plugins/athlon-manage-calameo-publications/#post-50631";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Mar 2013 14:58:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50631@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:112:"Tool for management and embedding various types of documents and present them in a custom styled Calameo viewer.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Athlon Production";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Twitter Cards Meta";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wordpress.org/extend/plugins/twitter-cards-meta/#post-50625";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Mar 2013 12:45:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"50625@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:117:"The Best and Easiest Way to Add Twitter Cards Metadata in WordPress Site. Enable Twitter Cards for Your Blog at ease.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"M Asif Rahman";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:48:"http://wordpress.org/extend/plugins/rss/view/new";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Thu, 14 Mar 2013 10:29:08 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:7:"expires";s:29:"Thu, 14 Mar 2013 10:32:39 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Thu, 14 Mar 2013 09:57:39 +0000";s:4:"x-nc";s:11:"HIT luv 139";}s:5:"build";s:14:"20121202124312";}', 'no'),
(130, '_transient_timeout_feed_mod_57bc725ad6568758915363af670fd8bc', '1363300152', 'no'),
(131, '_transient_feed_mod_57bc725ad6568758915363af670fd8bc', '1363256952', 'no'),
(132, '_transient_timeout_plugin_slugs', '1363600919', 'no'),
(133, '_transient_plugin_slugs', 'a:9:{i:0;s:19:"akismet/akismet.php";i:1;s:36:"contact-form-7/wp-contact-form-7.php";i:2;s:58:"contact-form-7-to-database-extension/contact-form-7-db.php";i:3;s:9:"hello.php";i:4;s:50:"local-search-seo-contact-page/seo-contact-page.php";i:5;s:25:"ooco_press/ooco_press.php";i:6;s:31:"ooco_products/ooco_products.php";i:7;s:39:"ooco_testimonials/ooco_testimonials.php";i:8;s:43:"testimonials-widget/testimonials-widget.php";}', 'no'),
(233, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1363640351', 'no'),
(234, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1363597151', 'no'),
(235, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1363640351', 'no'),
(236, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://wordpress.org/news/2013/01/wordpress-3-5-1/'' title=''WordPress 3.5.1 is now available. Version 3.5.1 is the first maintenance release of 3.5, fixing 37 bugs. It is also a security release for all previous WordPress versions. For a full list of changes, consult the list of tickets and the changelog, which include: Editor: Prevent certain HTML elements from being unexpectedly removed or modified in rare [&hellip;]''>WordPress 3.5.1 Maintenance and Security Release</a> <span class="rss-date">January 24, 2013</span><div class=''rssSummary''>WordPress 3.5.1 is now available. Version 3.5.1 is the first maintenance release of 3.5, fixing 37 bugs. It is also a security release for all previous WordPress versions. For a full list of changes, consult the list of tickets and the changelog, which include: Editor: Prevent certain HTML elements from being unexpectedly removed or modified in rare [&hellip;]</div></li><li><a class=''rsswidget'' href=''http://wordpress.org/news/2013/01/2012-a-look-back/'' title=''Another year is coming to a close, and it’s time to look back and reflect on what we’ve accomplished in the past twelve months. The WordPress community is stronger than ever, and some of the accomplishments of the past year are definitely worth remembering. Software Releases We had two major releases of the WordPress web [&hellip;]''>2012: A Look Back</a> <span class="rss-date">January 1, 2013</span><div class=''rssSummary''>Another year is coming to a close, and it’s time to look back and reflect on what we’ve accomplished in the past twelve months. The WordPress community is stronger than ever, and some of the accomplishments of the past year are definitely worth remembering. Software Releases We had two major releases of the WordPress web [&hellip;]</div></li></ul></div>', 'no'),
(237, '_transient_timeout_feed_867bd5c64f85878d03a060509cd2f92c', '1363640352', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(238, '_transient_feed_867bd5c64f85878d03a060509cd2f92c', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:61:"\n	\n	\n	\n	\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"WordPress Planet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:28:"http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress Planet - http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:50:{i:0;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Alex King: Announcing Threads";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://alexking.org/?p=16176";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://alexking.org/blog/2013/03/17/announcing-threads";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2417:".threads-post-notice {\n	background: #e8e8e8;\n	padding: 10px;\n}\n.threads-post-notice a {\n	font-weight: bold;\n}\n\n<p><img src="http://alexking.org/wp-content/uploads/2013/03/threads-timeline-510x382.jpg" alt="threads-timeline" width="480" height="359" class="aligncenter size-medium-img wp-image-16181" /></p>\n<p>I&#8217;ve just released an initial beta of <a href="http://wordpress.org/extend/plugins/threads/">Threads</a>, a WordPress plugin I&#8217;ve been working on for about a year. The idea is simple: show posts that comprise a single overall story/topic in a timeline. Then link to that timeline from the posts so that your readers have a chance to get more historical context about a post without you having to link back to 20 previous posts.</p>\n<p>Here are some example threads:</p>\n<ul>\n<li><a href="http://alexking.org/blog/thread/social">Social</a></li>\n<li><a href="http://alexking.org/blog/thread/hard-drive-recovery">My Hard Drive Recovery Saga</a></li>\n<li><a href="http://alexking.org/blog/thread/twitter-tools">Twitter Tools</a></li>\n<li><a href="http://alexking.org/blog/thread/passwords">Passwords</a></li>\n<li><a href="http://alexking.org/blog/thread/weight-loss">Weight Loss</a></li>\n</ul>\n<p>As you can see on this site, the thread timeline is responsive and retina/HiDPI ready. Also included is a sidebar widget to show recently active threads and a shortcode so that you can embed a thread timeline in a page.</p>\n<p>Give it a spin &#8211; I hope it works out well for you!</p>\n<p>A quick note about support: As this is a free plugin released under the GPL I am offering only &#8220;Product Support&#8221; for this plugin. That means I will do my best to fix bugs and usabiity issues that are posted on the <a href="http://wordpress.org/support/">WordPress support forums</a>. Contrast this with &#8220;User Support&#8221; which we offer for all of <a href="http://crowdfavorite.com">Crowd Favorite</a>&#8216;s commercial products. With &#8220;User Support&#8221; we do our best to troubleshoot and address each customer&#8217;s issues.</p>\n<p>Developers, contributions are welcome on <a href="https://github.com/crowdfavorite/wp-threads">GitHub</a>.</p>\n<p class="threads-post-notice">This post is part of the thread: <a href="http://alexking.org/blog/thread/content">Content Presentation</a> &#8211; an ongoing story on this site. View the thread timeline for more context on this post.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 17 Mar 2013 21:35:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Alex";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"Weblog Tools Collection: WordPress Plugin Releases for 3/17";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"http://weblogtoolscollection.com/?p=12787";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://feedproxy.google.com/~r/weblogtoolscollection/UXMP/~3/iCzrsWmhJSE/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1168:"<h3>New plugins</h3>\n<p><a href="http://wordpress.org/extend/plugins/barc-chat/"><strong>Barc Chat</strong></a> provides a simple yet feature rich chat room for your whole community to interact in real-time directly on your site.</p>\n<p><a href="http://wordpress.org/extend/plugins/get-directions/"><strong>Get Directions</strong></a> is a flexible and responsive map plugin.</p>\n<p><a href="http://namaste-lms.org/"><strong>Namaste! LMS</strong></a> is a learning management system for WordPress.</p>\n<p><a href="http://tutskid.com/pinterest-verify-meta-tag/"><strong>Pinterest Verify Meta Tag</strong></a> simply inserts the Pinterest meta tag verification code to the correct section of your site.</p>\n<h3>Updated plugins</h3>\n<p><a href="http://wordpress.org/extend/plugins/backwpup/"><strong>BackWPup</strong></a> allows you to backup your WordPress database, files, and more.</p>\n<p><a href="http://wordpress.org/extend/plugins/ooyala-video-browser/"><strong>Ooyala Video</strong></a> allows you to easily embed videos from the Ooyala Video Platform.</p>\n<img src="http://feeds.feedburner.com/~r/weblogtoolscollection/UXMP/~4/iCzrsWmhJSE" height="1" width="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 17 Mar 2013 14:00:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"James";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:69:"WordPress.tv: Make Quick Posts to Your WordPress Blog with Press This";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17934";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:87:"http://wordpress.tv/2013/03/17/make-quick-posts-to-your-wordpress-blog-with-press-this/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:653:"<div id="v-zbaXcN4P-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17934/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17934/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17934&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/17/make-quick-posts-to-your-wordpress-blog-with-press-this/"><img alt="PressThis.mov" src="http://videos.videopress.com/zbaXcN4P/video-b1ff756587_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 17 Mar 2013 07:00:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:57:"WordPress.tv: Chris Lema: Success in Distributed Contexts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=18183";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:74:"http://wordpress.tv/2013/03/17/chris-lema-success-in-distributed-contexts/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:670:"<div id="v-1oRdV9R4-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/18183/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/18183/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=18183&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/17/chris-lema-success-in-distributed-contexts/"><img alt="Chris Lema: Success in Distributed Contexts" src="http://videos.videopress.com/1oRdV9R4/video-fd51521a82_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 17 Mar 2013 07:00:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"WordPress.tv: Melinda Samson: Google Analytics 101 Workshop";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17624";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:76:"http://wordpress.tv/2013/03/16/melinda-samson-workshop-google-analytics-101/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:666:"<div id="v-Wa1tv4CB-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17624/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17624/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17624&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/16/melinda-samson-workshop-google-analytics-101/"><img alt="Workshop: Google Analytics 101" src="http://videos.videopress.com/Wa1tv4CB/workshop_google_analytics_101_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 16 Mar 2013 07:00:28 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:68:"WordPress.tv: Greg Taylor: Fundamentals of a Kick Ass WordPress Site";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=18191";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"http://wordpress.tv/2013/03/16/greg-taylor-fundamentals-of-a-kick-ass-wordpress-site/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:686:"<div id="v-cSUD5DNg-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/18191/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/18191/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=18191&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/16/greg-taylor-fundamentals-of-a-kick-ass-wordpress-site/"><img alt="Greg Taylor: Fundamentals of a Kick Ass WordPress Site" src="http://videos.videopress.com/cSUD5DNg/video-6e7f46dc65_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 16 Mar 2013 07:00:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"Weblog Tools Collection: WordPress Theme Releases for 3/15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"http://weblogtoolscollection.com/?p=12779";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://feedproxy.google.com/~r/weblogtoolscollection/UXMP/~3/lRqztGNTtv8/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1767:"<p><a href="http://wordpress.org/extend/themes/ease"><img class="alignnone size-thumbnail wp-image-12780" alt="screenshot" src="http://i0.wp.com/weblogtoolscollection.com/wp-content/uploads/2013/03/screenshot3.png?resize=150%2C150" /></a></p>\n<p><a href="http://wordpress.org/extend/themes/ease"><strong>Ease</strong></a> is a simple red and white theme.</p>\n<p><a href="http://emptynestthemes.com/2013/03/14/nomad-wordpress-blog-theme/"><img class="alignnone size-thumbnail wp-image-12783" alt="DemoBlog" src="http://i2.wp.com/weblogtoolscollection.com/wp-content/uploads/2013/03/DemoBlog2.png?resize=150%2C150" /></a></p>\n<p><a href="http://emptynestthemes.com/2013/03/14/nomad-wordpress-blog-theme/"><strong>Nomad</strong></a> is an attractive professional, business or blog theme with an unusual, very narrow orientation and design.</p>\n<p><a href="http://wordpress.org/extend/themes/sensitive"><img class="alignnone size-thumbnail wp-image-12782" alt="screenshot-2" src="http://i2.wp.com/weblogtoolscollection.com/wp-content/uploads/2013/03/screenshot-22.png?resize=150%2C150" /></a></p>\n<p><a href="http://wordpress.org/extend/themes/sensitive"><strong>Sensitive</strong></a> is fully responsive theme using Twitter Bootstrap and a Metro-styled accent.</p>\n<p><a href="http://wordpress.org/extend/themes/visual"><img class="alignnone size-thumbnail wp-image-12781" alt="screenshot-1" src="http://i0.wp.com/weblogtoolscollection.com/wp-content/uploads/2013/03/screenshot-13.png?resize=150%2C150" /></a></p>\n<p><a href="http://wordpress.org/extend/themes/visual"><strong>Visual</strong></a> is a dark minimalist theme for displaying photos and images.</p>\n<img src="http://feeds.feedburner.com/~r/weblogtoolscollection/UXMP/~4/lRqztGNTtv8" height="1" width="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 15 Mar 2013 19:00:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"James";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:57:"WordPress.tv: Andrew Nacin: WP_Query / WordPress In-depth";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17990";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"http://wordpress.tv/2013/03/15/andrew-nacin-wp_query-wordpress-in-depth/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:671:"<div id="v-fN7XVxWJ-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17990/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17990/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17990&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/15/andrew-nacin-wp_query-wordpress-in-depth/"><img alt="Andrew Nacin: WP_Query / WordPress in Depth" src="http://videos.videopress.com/fN7XVxWJ/andrewnacin-wpquery_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 15 Mar 2013 07:00:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:45:"WordPress.tv: Andrew Nacin: WordPress in 2012";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=18004";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wordpress.tv/2013/03/15/andrew-nacin-wordpress-in-2012/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:647:"<div id="v-w1h37UGG-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/18004/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/18004/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=18004&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/15/andrew-nacin-wordpress-in-2012/"><img alt="AndrewNacin-WordPressin2012" src="http://videos.videopress.com/w1h37UGG/andrewnacin-wordpressin2012_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 15 Mar 2013 07:00:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:54:"Weblog Tools Collection: WordPress 3.6 Release Delayed";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"http://weblogtoolscollection.com/?p=12772";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://feedproxy.google.com/~r/weblogtoolscollection/UXMP/~3/N8oZD4gd_rM/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:820:"<p>The impending release of <a href="http://wordpress.org">WordPress</a> 3.6 has been pushed back one more week to April 29.</p>\n<p>At this time, WordPress 3.6 is not yet feature complete (meaning that all intended new features have not been entirely finished), so <a href="http://make.wordpress.org/core/2013/03/13/the-road-to-3-6-beta-1/">the decision was made</a> to push the first beta release back two weeks to March 27 and the final release back one week to April 29. This will allow the team time to focus on finalizing the in-progress new features so that they (and the brave folks who enjoy running beta software) can simply focus on testing and bug fixing rather than polishing up partial features.</p>\n<img src="http://feeds.feedburner.com/~r/weblogtoolscollection/UXMP/~4/N8oZD4gd_rM" height="1" width="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 14:00:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"James";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:45:"WordPress.tv: Karim Osman: over WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17975";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wordpress.tv/2013/03/14/karim-osman-over-wordpress-com/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:649:"<div id="v-3Y8BPEXu-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17975/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17975/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17975&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/14/karim-osman-over-wordpress-com/"><img alt="Karim Osman: over WordPress-com" src="http://videos.videopress.com/3Y8BPEXu/karim-wordpress-com_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 13:25:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:44:"WordPress.tv: Paul Gibbs: BuddyPress in 2012";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17997";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"http://wordpress.tv/2013/03/14/paul-gibbs-buddypress-in-2012/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:653:"<div id="v-6oGBfrOG-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17997/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17997/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17997&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/14/paul-gibbs-buddypress-in-2012/"><img alt="Paul Gibbs: BuddyPress In 2012" src="http://videos.videopress.com/6oGBfrOG/paulgibs-buddypressin2012_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 13:25:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:57:"WordPress.tv: Elles de Boorder: Case: Mobiel solliciteren";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17980";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wordpress.tv/2013/03/14/elles-de-boorder-case-mobiel-solliciteren/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:632:"<div id="v-38Fa0w7P-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17980/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17980/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17980&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/14/elles-de-boorder-case-mobiel-solliciteren/"><img alt="EllesdeBoorder" src="http://videos.videopress.com/38Fa0w7P/ellesdeboorder_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 13:25:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"WordPress.tv: Björn Wijers: WordPress als CMS voor je intranet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=18006";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"http://wordpress.tv/2013/03/14/bjorn-wijers-wordpress-als-cms-voor-je-intranet/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:631:"<div id="v-5VOLRNIc-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/18006/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/18006/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=18006&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/14/bjorn-wijers-wordpress-als-cms-voor-je-intranet/"><img alt="Björn Wijers" src="http://videos.videopress.com/5VOLRNIc/bjorn-ff_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 13:25:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"WordPress.tv: Bas van der Lans: WordPress voor ondernemers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=18002";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"http://wordpress.tv/2013/03/14/bas-van-der-lans-wordpress-voor-ondernemers/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:686:"<div id="v-lwAbDvM7-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/18002/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/18002/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=18002&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/14/bas-van-der-lans-wordpress-voor-ondernemers/"><img alt="BasvanderLans-WordPress-voor-ondernemers" src="http://videos.videopress.com/lwAbDvM7/basvanderlans-wordpress-voor-ondernemers_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 13:25:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:51:"WordPress.tv: Remkus de Vries: 10 WordPress weetjes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=18010";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wordpress.tv/2013/03/14/remkus-de-vries-10-wordpress-weetjes/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:663:"<div id="v-ZPtpJB08-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/18010/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/18010/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=18010&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/14/remkus-de-vries-10-wordpress-weetjes/"><img alt="RemkusdeVries-10WordPressweetjes" src="http://videos.videopress.com/ZPtpJB08/remkusdevries-10wordpressweetjes_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 13:25:02 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:45:"WordPress.tv: Coen Jacobs: Core Contributions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17992";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wordpress.tv/2013/03/14/coen-jacobs-core-contributions/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:649:"<div id="v-rT4xpicr-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17992/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17992/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17992&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/14/coen-jacobs-core-contributions/"><img alt="CoenJacobs-CoreContributions" src="http://videos.videopress.com/rT4xpicr/coenjacobs-corecontributions_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 13:24:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:62:"WordPress.tv: Noel Tock: Customizing WP-Admin for your Clients";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17995";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"http://wordpress.tv/2013/03/14/noel-tock-customizing-wp-admin-for-your-clients/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:628:"<div id="v-SG6bzhAh-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17995/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17995/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17995&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/14/noel-tock-customizing-wp-admin-for-your-clients/"><img alt="Noel.mp4.ff" src="http://videos.videopress.com/SG6bzhAh/noel-ff_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 07:00:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:101:"WordPress.tv: Maurizio Pelizzone: Strumenti e metodi per lavorare con WordPress in progetti complessi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:118:"http://wordpress.tv/2013/03/14/maurizio-pelizzone-strumenti-e-metodi-per-lavorare-con-wordpress-in-progetti-complessi/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:690:"<div id="v-AOGI9WO3-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17321/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17321/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17321&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/14/maurizio-pelizzone-strumenti-e-metodi-per-lavorare-con-wordpress-in-progetti-complessi/"><img alt="04 Maurizio Pelizzone.mp4" src="http://videos.videopress.com/AOGI9WO3/video-c5e85ec88e_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 07:00:02 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"Weblog Tools Collection: WordPress Plugin Releases for 3/13";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"http://weblogtoolscollection.com/?p=12768";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://feedproxy.google.com/~r/weblogtoolscollection/UXMP/~3/nc1L0kLDbSc/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1374:"<h3>New plugins</h3>\n<p><a href="http://wordpress.org/extend/plugins/easy-media-gallery/"><strong>Easy Media Gallery</strong></a> is designed to display portfolios and various media types including gallery sets, single images, google maps, video, audio, and links with ease and elegance.</p>\n<p><a href="http://wordpress.org/extend/plugins/ytlink/"><strong>ytlink</strong></a> provides a preview image for embedded YouTube videos.</p>\n<h3>Updated plugins</h3>\n<p><a href="http://wordpress.org/extend/plugins/backwpup/"><strong>BackWPup</strong></a> allows you to backup your WordPress database, files, and more.</p>\n<p><a href="http://wordpress.org/extend/plugins/genericond/"><strong>Genericon&#8217;d</strong></a> enables easy use of the <a href="http://genericons.com">Genericons</a> icon font set from within WordPress. Icons can be inserted using either HTML or a shortcode.</p>\n<p><a href="http://wordpress.org/extend/plugins/keyring/"><strong>Keyring</strong></a> provides a very hookable, completely customizable framework for connecting your WordPress site to an external service.</p>\n<p><a href="http://wordpress.org/extend/plugins/wp-all-import/"><strong>WP All Import</strong></a> makes it easy to import any XML or CSV file into your WordPress site.</p>\n<img src="http://feeds.feedburner.com/~r/weblogtoolscollection/UXMP/~4/nc1L0kLDbSc" height="1" width="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Mar 2013 05:45:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"James";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Matt: The Redhat of Drupal";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=42287";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"http://ma.tt/2013/03/the-redhat-of-drupal/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1225:"<p>I got this email today:</p>\n<div class="blockquote">\n<blockquote>Hi Matt,</p>\n<p>I apologize for the cold email. I was researching Automattic , Inc. and wanted to ask you if there was any gaps/pains within your CMS and website.  I work for the &#8220;Redhat of Drupal&#8221;, (Acquia) and we have seen an explosion of Drupal use in the Media, News, and Entertainment Industry.</p>\n<p>Some companies using Drupal/Acquia include Warner Music, Maxim, NBC Universal, and NPR.<br />\nIf you are evaluating your current system or are looking into new web projects, I would love to connect and discuss Drupal as an option. </p>\n<p>Would it make sense to connect on this? If there is someone better at Automattic , Inc. to speak with, perhaps you could point me in the right direction?</p>\n<p>Cheers,</p>\n<p>&#8211;<br />\nDillon J. ********<br />\nEnterprise Drupal Solutions<br />\nDirect: (781) 238-****</p>\n<p>http://www.acquia.com</p>\n<p>Acquia, 25 Corporate Drive Fourth Floor<br />\nBurlington, MA 01803</p>\n<p>Acquia ranked #1 Software Vendor on the 2012 Inc 500</p></blockquote>\n</div>\n<p>Hmmm, maybe I&#8217;ve been <a href="http://wordpress.org/">doing it wrong</a> all these years&#8230; Dillon, I&#8217;ll be in touch!</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 13 Mar 2013 16:17:54 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Matt: SxSW, Work, and Blogging";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=42282";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:44:"http://ma.tt/2013/03/sxsw-work-and-blogging/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2241:"<p><img class="alignright size-thumbnail wp-image-42284" alt="369ajvpd7nrkwmlf1amk" src="http://i2.wp.com/s.ma.tt/files/2013/03/369ajvpd7nrkwmlf1amk.png?resize=195%2C135" /> I&#8217;ve been at the SxSW festival since Friday, it&#8217;s actually my tenth year attending. Since the first time I used my parent&#8217;s gas card and drove up from Houston this event has had a special place in my heart, even as I&#8217;ve gone in and out of love with it as it&#8217;s grown over the years. (I heard that there were more interactive badges this year than film or music.)</p>\n<p>I&#8217;ve spoken here and there the last few days and it has generated some good blog posts, so here&#8217;s a sampling of them you may find interesting:</p>\n<p>On the way to our interview session <a href="http://allthingsd.com/20130310/wordpress-matt-mullenweg-talks-about-future-of-blogging-in-a-sxsw-pedicab/">Kara Swisher recorded an interview on a pedi-cab</a>.</p>\n<p>Techcrunch TV did a nice short interview, <a href="http://techcrunch.com/2013/03/10/wordpress-matt-mullenweg-on-working-from-home-making-money-without-ads-and-more-tctv/">WordPress’ Matt Mullenweg On Working From Home, Making Money Without Ads, And More [TCTV]</a>.</p>\n<div></div>\n<p><br /></p>\n<p>Paidcontent wrote on <a href="http://paidcontent.org/2013/03/09/where-wordpress-is-headed-longform-content-curation-and-maybe-some-native-advertising/">Where WordPress[.com] is headed: Longform content, curation and maybe even native ads</a>.</p>\n<p>Marketing Land wrote two great posts, <a href="http://marketingland.com/wordpress-mullenweg-at-sxsw-blogging-still-booming-35808">WordPress Founder Matt Mullenweg At SXSW: Blogging Still Booming</a> and <a href="http://marketingland.com/why-not-work-from-home-we-have-the-technology-says-wordpress-mullenweg-35814">Why Not Work From Home? “We Have The Technology,” Says WordPress’ Mullenweg</a>.</p>\n<p>Finally Access PR asked <a href="http://blog.accesspr.com/2013/03/wordpress-airbnb-sxsw/">SXSW: What do WordPress and Airbnb have in common?</a></p>\n<p>The coolest part about this and every year is meeting WordPress users all over &#8212; at restaurants, in the streets, at the booth&#8230; please don&#8217;t hesitate to say hi.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 13 Mar 2013 15:16:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:84:"WordPress.tv: Kate Kendall: A Case Study – Using WordPress for Magazine Publishing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17535";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wordpress.tv/2013/03/13/kate-kendall-a-case-study-using-wordpress-for-magazine-publishing/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:733:"<div id="v-PV4q3LTd-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17535/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17535/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17535&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/13/kate-kendall-a-case-study-using-wordpress-for-magazine-publishing/"><img alt="A Case Study: Using WordPress for Magazine Publishing" src="http://videos.videopress.com/PV4q3LTd/case_study_using_wordpress_magazine_publishing_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 13 Mar 2013 07:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:84:"WordPress.tv: Emily Doig: Create a Social Media Strategy for Your Blog in 30 Minutes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:98:"http://wordpress.tv/2013/03/13/emily-doig-create-a-social-media-strategy-for-your-blog-in-30-mins/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:745:"<div id="v-a44SsMX9-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17539/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17539/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17539&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/13/emily-doig-create-a-social-media-strategy-for-your-blog-in-30-mins/"><img alt="Emily Doig: Create a Social Media Strategy for Your Blog in 30 Minutes" src="http://videos.videopress.com/a44SsMX9/create_social_media_strategy_your_blog_30_mins_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 13 Mar 2013 07:00:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:57:"WordPress.tv: How to Create an Image Gallery in WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17932";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"http://wordpress.tv/2013/03/12/how-to-create-an-image-gallery-in-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:671:"<div id="v-GKoEC54c-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17932/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17932/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17932&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/12/how-to-create-an-image-gallery-in-wordpress/"><img alt="How to Create an Image Gallery in WordPress" src="http://videos.videopress.com/GKoEC54c/video-0a7ce34deb_scruberthumbnail_2.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 13 Mar 2013 05:43:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"WordPress.tv: Isaac Keyet: WordPress is Mobile";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17978";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.tv/2013/03/12/isaac-keyet-wordpress-is-mobile/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:665:"<div id="v-raZQlGdN-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17978/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17978/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17978&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/12/isaac-keyet-wordpress-is-mobile/"><img alt="Isaac Keyet &#8211; WordPress is mobile" src="http://videos.videopress.com/raZQlGdN/isaackeyt-wordpresismobile_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Mar 2013 20:15:07 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"BuddyPress: BuddyPress 1.7 Beta 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"http://buddypress.org/?p=156137";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"http://buddypress.org/2013/03/buddypress-1-7-beta-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:839:"<p>Tuesday&#8217;s getting even more terrific as we announce the second beta of BuddyPress 1.7!</p>\n<p>Building on a solid first beta, beta 2 has a number of bug fixes and improvements, mainly around the theme compatibility and admin screens. For those of you interested in a changelog between beta 1 and 2, <a href="https://buddypress.trac.wordpress.org/log?action=stop_on_copy&mode=stop_on_copy&rev=6848&stop_rev=6798+&limit=100">check out this report in Trac</a>.</p>\n<p>Now&#8217;s the time to test your themes and plugins, and let us know if you find anything unexpected happening. If you think you&#8217;ve found a bug, please report it on the <a href="http://buddypress.trac.wordpress.org">BuddyPress Core Trac</a>.</p>\n<p><a href="http://downloads.wordpress.org/plugin/buddypress.zip">Download BuddyPress 1.7, Beta 2 ↓</a></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Mar 2013 20:14:49 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Paul Gibbs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"Joseph: I am Speaking at the OpenWest Conference";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"https://josephscott.org/?p=7033";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:81:"http://josephscott.org/archives/2013/03/i-am-speaking-at-the-openwest-conference/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1818:"<p><a href="http://www.openwest.org/"><img class="alignleft" alt="" src="http://i2.wp.com/www.openwest.org/wp-content/uploads/2013/01/speaker_300.jpg?resize=300%2C388" /></a></p>\n<p>The <a href="http://www.openwest.org/">OpenWest Conference</a> is happening May 2-4, 2013 (formerly the Utah Open Source Conference) at Utah Valley University in Orem, Utah.</p>\n<p>This year the <a href="http://www.openwest.org/keynote/">keynote speakers</a> are Rasmus Lerdorf, creator of PHP, and Mark Callaghan, lead of the MySQL engineering team at Facebook.</p>\n<p>For my part I&#8217;ll be giving three different presentations this time around.  First up is &#8220;Simple Filesystems with Python and FUSE&#8221;, where I&#8217;ll cover the basics of getting a simple filesystem up and running written in Python using the FUSE library.  Next up is &#8220;Site Testing with CasperJS&#8221;, which is an intro to using <a href="http://casperjs.org/">CasperJS</a> to run user tests against your site.  Last, but not least, is &#8220;Scaling WordPress&#8221;, where I&#8217;ll talk about some of the methods that WordPress.com (the largest WordPress install in the world) uses to host tens of millions of sites that add up to billions of page views per month.</p>\n<p>I tried to keep my session titles direct and to the point.  At times there will up to ten sessions running at once ( <a href="http://www.openwest.org/custom/grid.php">OpenWest session schedule</a> ), so I wanted people to be able to tell at a glance what my sessions are about.</p>\n<p><a href="http://www.openwest.org/tickets/">Tickets for OpenWest</a> are available at $80.  Every open source group in the area has been given a discount code though, so you can bring that down significantly.</p>\n<p>If you&#8217;ll be at the OpenWest conference be sure to say hi.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Mar 2013 16:13:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Joseph Scott";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:47:"Weblog Tools Collection: Do You Work From Home?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"http://weblogtoolscollection.com/?p=12760";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://feedproxy.google.com/~r/weblogtoolscollection/UXMP/~3/x7WcwEeaJQk/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1933:"<p>There has been <a href="http://scottberkun.com/2013/grand-summary-of-posts-on-remote-work-yahoo/">a lot of talk lately</a> about working from home and maintaining a distributed workforce.</p>\n<p>Web-based software, like <a href="http://wordpress.org">WordPress</a>, <a href="http://www.joomla.org">Joomla</a>, and <a href="http://drupal.org">Drupal</a>, are taking over the publishing industry and allow you to work from anywhere with an internet connection. Though, even though they can be managed  from home, working from home and maintaining a distributed workforce is not yet broadly acknowledged in society as a successful and efficient alternative to working in an office. Despite working with software that doesn&#8217;t need to be tied to one specific workstation, you could still find yourself tied to a desk in cubicle.</p>\n<p>I work full-time for <a href="http://automattic.com">Automattic</a> and have the pleasure of both working from home and setting my own hours. After all, I only need a browser, an email client, and IRC client, and <a href="http://www.skype.com/">Skype</a> to do my job. A desk is nice, but there&#8217;s no one saying that said desk has to be in the dark corner of some corporate office. As for communication between the 150 of us (130 who work from home, far away from the central &#8220;office&#8221; in San Francisco), we communicate mostly via a variety of blogs running the <a href="http://p2theme.com">P2 theme</a>. It&#8217;s as close as you can get to a water cooler or a meeting room with text, you should try it. For other communication needs, we use primarily IRC followed by Skype for less work-related chats.</p>\n<p>Do you work from home? And, if you work from home for a larger company (not just yourself), how is communication and overall efficiency maintained?</p>\n<img src="http://feeds.feedburner.com/~r/weblogtoolscollection/UXMP/~4/x7WcwEeaJQk" height="1" width="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Mar 2013 14:00:46 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"James";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"WordPress.tv: Martin Reed: Essential SEO + Link Building 101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17545";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.tv/2013/03/12/essential-seo-link-building-101/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:658:"<div id="v-r7GBMtVP-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17545/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17545/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17545&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/12/essential-seo-link-building-101/"><img alt="Essential SEO + Link Building 101" src="http://videos.videopress.com/r7GBMtVP/essential_seo_link_building_101_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Mar 2013 07:00:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:30;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:74:"WordPress.tv: Sara Cannon: Designer vs Developer – Creators in WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17838";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:87:"http://wordpress.tv/2013/03/12/sara-cannon-designer-vs-developer-creators-in-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:668:"<div id="v-5FeqMDZy-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17838/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17838/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17838&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/12/sara-cannon-designer-vs-developer-creators-in-wordpress/"><img alt="Sara Cannon: Designer vs Developer" src="http://videos.videopress.com/5FeqMDZy/video-fc01cc3ef1_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Mar 2013 07:00:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:31;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"Lorelle on WP: WordPress Anniversary: WordPress and Evil";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"http://lorelle.wordpress.com/?p=8342";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:81:"http://lorelle.wordpress.com/2013/03/11/wordpress-anniversary-wordpress-and-evil/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:483:"As I look back on the ten years of WordPress, there is a dark side to blogging. While many blamed WordPress for the evil, like guns, WordPress doesn&#8217;t cause evil, people cause evil. In fact, WordPress, Automattic, and the WordPress Community has fought longer and harder against the evil doers in the world than most [...]<img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=lorelle.wordpress.com&blog=72&post=8342&subd=lorelle&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Mar 2013 20:29:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Lorelle VanFossen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:32;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:67:"Dougal Campbell: The WordPress Community Offers Advice to Beginners";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://dougal.gunters.org/?p=72499";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:93:"http://dougal.gunters.org/blog/2013/03/11/the-wordpress-community-offers-advice-to-beginners/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:834:"<p><i>The next time somebody asks me for advice on how to get started with WordPress development or community, I just need to point them to this article (which includes a brief quote from yours truly).</i></p>\n<p><a href="http://wp.smashingmagazine.com/2013/02/01/wordpress-community-offers-advice-beginners/">The WordPress Community Offers Advice to Beginners</a></p>\n<p>Original Article: <a href="http://dougal.gunters.org/blog/2013/03/11/the-wordpress-community-offers-advice-to-beginners/">The WordPress Community Offers Advice to Beginners</a>\n<a href="http://dougal.gunters.org">Dougal Campbell&#039;s geek ramblings - WordPress, web development, and world domination.</a></p><div class="yarpp-related-rss yarpp-related-none">\n<h3>Related posts:</h3>\n<img src="http://yarpp.org/pixels/5db43ee24c4f1e1d0e45d08cc91b0130" />\n</div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Mar 2013 17:29:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Dougal Campbell";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:33;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"Weblog Tools Collection: WordPress Theme Releases for 3/11";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"http://weblogtoolscollection.com/?p=12751";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://feedproxy.google.com/~r/weblogtoolscollection/UXMP/~3/VEQ7XOUJdgU/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1777:"<p><a href="http://wordpress.org/extend/themes/attitude"><img class="alignnone size-thumbnail wp-image-12752" alt="screenshot" src="http://i0.wp.com/weblogtoolscollection.com/wp-content/uploads/2013/03/screenshot2.png?resize=150%2C150" /></a></p>\n<p><a href="http://wordpress.org/extend/themes/attitude"><strong>Attitude</strong></a> is a simple, clean, and responsive retina-ready theme.</p>\n<p><a href="http://wordpress.org/extend/themes/catch-everest"><img class="alignnone size-thumbnail wp-image-12753" alt="screenshot-1" src="http://i0.wp.com/weblogtoolscollection.com/wp-content/uploads/2013/03/screenshot-12.png?resize=150%2C150" /></a></p>\n<p><a href="http://wordpress.org/extend/themes/catch-everest"><strong>Catch Everest</strong></a> is a simple, clean, and responsive theme.</p>\n<p><a href="http://emptynestthemes.com/2013/03/05/liberus-wordpress-business-theme/"><img class="alignnone size-thumbnail wp-image-12755" alt="DemoBlog" src="http://i0.wp.com/weblogtoolscollection.com/wp-content/uploads/2013/03/DemoBlog1.png?resize=150%2C150" /></a></p>\n<p><a href="http://emptynestthemes.com/2013/03/05/liberus-wordpress-business-theme/"><strong>Liberus</strong></a> is an ideal business related theme that is relatively simple and would suit any blog or website.</p>\n<p><a href="http://wordpress.org/extend/themes/stitch"><img class="alignnone size-thumbnail wp-image-12754" alt="screenshot-2" src="http://i2.wp.com/weblogtoolscollection.com/wp-content/uploads/2013/03/screenshot-21.png?resize=150%2C150" /></a></p>\n<p><a href="http://wordpress.org/extend/themes/stitch"><strong>Stitch</strong></a> is an elegant, modern theme with optional fixed header.</p>\n<img src="http://feeds.feedburner.com/~r/weblogtoolscollection/UXMP/~4/VEQ7XOUJdgU" height="1" width="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Mar 2013 14:00:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"James";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:34;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:69:"WordPress.tv: Japh Thomson: Using WordPress as a Development Platform";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17568";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"http://wordpress.tv/2013/03/11/japh-thomson-using-wordpress-as-a-development-platform/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:708:"<div id="v-6ATOH0KA-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17568/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17568/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17568&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/11/japh-thomson-using-wordpress-as-a-development-platform/"><img alt="Japh Thomson: Using WordPress as a Development Platform" src="http://videos.videopress.com/6ATOH0KA/using_wordpress_development_platform_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Mar 2013 07:00:33 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:35;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:102:"WordPress.tv: Dion Hulse: Workshop: How to become a Surgeon: An intro into WordPress core contributing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17635";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:117:"http://wordpress.tv/2013/03/11/dion-hulse-workshop-how-to-become-a-surgeon-an-intro-into-wordpress-core-contributing/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:759:"<div id="v-rNX1748d-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17635/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17635/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17635&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/11/dion-hulse-workshop-how-to-become-a-surgeon-an-intro-into-wordpress-core-contributing/"><img alt="Dion Hulse: An intro to WordPress core contributing" src="http://videos.videopress.com/rNX1748d/workshop_how_become_surgeon_intro_wordpress_core_contributin_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Mar 2013 07:00:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:36;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:54:"WordPress.tv: Jess Jurick: Writing Tools for WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17801";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wordpress.tv/2013/03/10/jess-jurick-writing-tools-for-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:664:"<div id="v-sug4kAo0-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17801/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17801/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17801&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/10/jess-jurick-writing-tools-for-wordpress/"><img alt="Jess Jurick: Writing Tools for WordPress" src="http://videos.videopress.com/sug4kAo0/video-9f145e6c33_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Mar 2013 06:22:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:37;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"WordPress.tv: Alexandra Farrar: The Law of Twitter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17551";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"http://wordpress.tv/2013/03/10/alexandra-farrar-the-law-of-twitter/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:627:"<div id="v-3HtgOKgv-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17551/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17551/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17551&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/10/alexandra-farrar-the-law-of-twitter/"><img alt="The Law of Twitter" src="http://videos.videopress.com/3HtgOKgv/law_twitter_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 07:00:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:38;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"Weblog Tools Collection: WordPress Plugin Releases for 3/9";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"http://weblogtoolscollection.com/?p=12746";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://feedproxy.google.com/~r/weblogtoolscollection/UXMP/~3/bO5NxobHs5o/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1269:"<h3>New plugins</h3>\n<p><a href="http://wordpress.org/extend/plugins/wp-antispambot/"><strong>WP-AntiSpambot</strong></a> adds a shortcode that can be used to stop spambots from harvesting emails entered into your WordPress editor while creating pages or posts.</p>\n<p><a href="http://wordpress.org/extend/plugins/zoninator/"><strong>Zone Manager (Zoninator)</strong></a> is designed to help you curate your content by assigning and ordering stories within zones that you can create, edit, and delete.</p>\n<h3>Updated plugins</h3>\n<p><a href="http://wordpress.org/extend/plugins/contemplate/"><strong>Contemplate</strong></a> allows you to create unlimited shortcodes containing any text/HTML you like.</p>\n<p><a href="http://wordpress.org/extend/plugins/genericond/"><strong>Genericon&#8217;d</strong></a> enables easy use of the <a href="http://genericons.com">Genericons</a> icon font set from within WordPress. Icons can be inserted using either HTML or a shortcode.</p>\n<p><a href="http://wordpress.org/extend/plugins/safe-report-comments/"><strong>Safe Report Comments</strong></a> gives your visitors the ability to report a comment as inappropriate.</p>\n<img src="http://feeds.feedburner.com/~r/weblogtoolscollection/UXMP/~4/bO5NxobHs5o" height="1" width="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 09 Mar 2013 14:00:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"James";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:39;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"WordPress.tv: Shelia Oliver: Selecting a Theme";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17804";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.tv/2013/03/09/shelia-oliver-selecting-a-theme/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:642:"<div id="v-wWC1dNmC-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17804/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17804/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17804&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/09/shelia-oliver-selecting-a-theme/"><img alt="Shelia Oliver: Selecting a Theme" src="http://videos.videopress.com/wWC1dNmC/video-09a458d26f_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 09 Mar 2013 07:00:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:40;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"WordPress.tv: Troy Dean: A Better WordPress for Your Clients";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17575";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"http://wordpress.tv/2013/03/09/troy-dean-workshop-a-better-wordpress-for-your-clients/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:701:"<div id="v-u0oYwdlO-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17575/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17575/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17575&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/09/troy-dean-workshop-a-better-wordpress-for-your-clients/"><img alt="Troy Dean: A Better WordPress for Your Clients" src="http://videos.videopress.com/u0oYwdlO/workshop_better_wordpress_your_clients_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 09 Mar 2013 07:00:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:41;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:91:"WordPress.tv: Paul Clark: How WordPress Saves Lives – Freedom, Hope and Custom Post Types";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17826";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:103:"http://wordpress.tv/2013/03/08/paul-clark-how-wordpress-saves-lives-freedom-hope-and-custom-post-types/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:737:"<div id="v-BadwqS0c-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17826/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17826/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17826&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/08/paul-clark-how-wordpress-saves-lives-freedom-hope-and-custom-post-types/"><img alt="Paul Clark: How WordPress Saves Lives &#8211; Freedom, Hope and Custom Post Types" src="http://videos.videopress.com/BadwqS0c/video-a47f3d8431_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 08 Mar 2013 07:00:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:42;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:43:"WordPress.tv: David Albert: Creating Themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.tv/2013/03/08/david-albert-creating-themes/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:642:"<div id="v-GUObb3Lv-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17832/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17832/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17832&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/08/david-albert-creating-themes/"><img alt="David Albert: Creating Themes" src="http://videos.videopress.com/GUObb3Lv/video-ae688e4604_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 08 Mar 2013 07:00:13 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:43;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:76:"WordPress.tv: Giuliano Ambrosio: Sfruttare il Potenziale Nativo di WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17333";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:93:"http://wordpress.tv/2013/03/07/giuliano-ambrosio-sfruttare-il-potenziale-nativo-di-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:708:"<div id="v-mDLSbyoz-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17333/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17333/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17333&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/07/giuliano-ambrosio-sfruttare-il-potenziale-nativo-di-wordpress/"><img alt="Giuliano Ambrosio: Sfruttare il Potenziale Nativo di WordPress" src="http://videos.videopress.com/mDLSbyoz/video-a2388d6b97_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 07 Mar 2013 15:50:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:44;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:90:"WordPress.tv: Luca Bartoli: Sviluppare plugin per WordPress, Best Practice e Silver Bullet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=17326";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:106:"http://wordpress.tv/2013/03/07/luca-bartoli-sviluppare-plugin-per-wordpress-best-practice-e-silver-bullet/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:735:"<div id="v-RxUKTwkX-1" class="video-player">\n</div>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/17326/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/17326/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=17326&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/03/07/luca-bartoli-sviluppare-plugin-per-wordpress-best-practice-e-silver-bullet/"><img alt="Luca Bartoli: Sviluppare plugin per WordPress, Best Practice e Silver Bullet" src="http://videos.videopress.com/RxUKTwkX/video-0919b4b753_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 07 Mar 2013 15:49:33 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:45;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress.tv Blog: Meet the Moderators: Phil Erb";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"http://wptvblog.wordpress.com/?p=234";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wptvblog.wordpress.com/2013/03/07/phil-erb/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4346:"<p>In the last posts, we chatted with <a title="Meet the Moderators: Chandra Maharzan" href="http://wptvblog.wordpress.com/2013/02/20/chandra-maharzan/" target="_blank">Chandra Maharzan</a> and <a title="Meet the Moderators: Jerry Bates" href="http://wptvblog.wordpress.com/2013/02/20/jerry-bates/" target="_blank">Jerry Bates</a>, two moderators at <a href="http://wordpress.tv/" target="_blank">WordPress.tv</a>. We&#8217;d like to introduce a third volunteer on this team. Everyone, meet Phil Erb.</p>\n<p><span id="more-234"></span></p>\n<h3>Phil Erb<br />\nScranton, Pennsylvania</h3>\n<h4><img class="alignleft size-medium wp-image-254" alt="Phil Erb" src="http://wptvblog.files.wordpress.com/2013/02/phil.jpg?w=300&h=225" width="300" height="225" /></h4>\n<h4>Tell us a bit about yourself.</h4>\n<p>I&#8217;m a systems administrator/programmer at the University of Scranton. While I do some work with WordPress at the university, most of my WordPress projects are after hours as a consultant or just for fun.</p>\n<h4>How did you get involved with WordPress?</h4>\n<p>I&#8217;ve been creating websites since 2002 &#8212; the <a href="http://philerb.com/" target="_blank">philerb.com</a> domain name turned 10 years old in September! &#8212; originally purely by hand, then by creating very basic CMS-type systems with Perl, PHP, and MySQL. I&#8217;d installed WordPress in 2007 and 2008 to play with it, but never had time to sit down and learn it. It wasn&#8217;t until just before 3.0 came out that I convinced myself custom-coded solutions aren&#8217;t the way to go. Now, I&#8217;m consulting on the side and working on WordPress sites for nonprofits and small businesses.</p>\n<p>I didn&#8217;t really become involved with the WordPress community until last fall. Last year, I began following more WordPress folks on Twitter and started answering questions in the forums. I attended my first WordCamp &#8211; <a href="http://central.wordcamp.org/wordcamps/wordcamp-philly/" target="_blank">WordCamp Philly</a> &#8212; in October.<strong> </strong>I&#8217;ve helped set up a <a href="http://www.nepawp.com" target="_blank">Northeast Pennsylvania WordPress meetup</a> &#8212; we had our first meetup recently in Scranton and are planning our next one for March 26. (We can be found on <a href="http://www.meetup.com/nepawp/" target="_blank">Meetup.com</a> or on Twitter <a href="https://twitter.com/nepawp" target="_blank">@nepawp</a>.)</p>\n<p>For WordPress 3.5, I published my first plugin (<a href="http://wordpress.org/extend/plugins/disable-xml-rpc/" target="_blank">Disable XML-RPC</a>). It&#8217;s a simple one-line plugin, but it&#8217;s left me wanting to create more. I&#8217;ve set a goal to contribute at least one thing to core in 2013.</p>\n<h4><span>Why do you want to be a WordPress.tv moderator?</span></h4>\n<p>I&#8217;ve only been to one WordCamp so far, but I love watching the videos from other conferences. They&#8217;ve helped me understand how much you can do with WordPress and inspire me in my own projects. I wanted to get more involved in the community so was very excited when I read about the need for moderators for <a href="http://wordpress.tv/" target="_blank">WordPress.tv</a>. I now have a (good) excuse to sit down and watch videos about WordPress, by some of the best in the business, every day.</p>\n<h4>What other things do you like to do?</h4>\n<p>When I&#8217;m not immersed in code or following the WordPress universe via Twitter on my phone, I&#8217;m playing with (and wrangling) my two kids: three-year-old Adam and one-year-old Rachel.</p>\n<p><i>If you&#8217;re interested in getting involved in WordPress events, such as WordCamps and WordPress meetups, check out the </i><a href="http://make.wordpress.org/events/"><i>Making WordPress Events</i></a><i> discussion forum. You can also see what Phil and the WordPress.tv moderators are up to at </i><a href="http://wptvmods.wordpress.com/"><i>wptvmods</i></a><i>.</i></p>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptvblog.wordpress.com/234/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptvblog.wordpress.com/234/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wptvblog.wordpress.com&blog=5310177&post=234&subd=wptvblog&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 07 Mar 2013 08:01:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Cheri Lucas";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:46;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:57:"Weblog Tools Collection: WordPress Theme Releases for 3/6";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"http://weblogtoolscollection.com/?p=12737";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://feedproxy.google.com/~r/weblogtoolscollection/UXMP/~3/QRLNoZmiDdY/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1389:"<p><a href="http://wordpress.org/extend/themes/chun"><img class="alignnone size-thumbnail wp-image-12738" alt="screenshot" src="http://i0.wp.com/weblogtoolscollection.com/wp-content/uploads/2013/03/screenshot1.png?resize=150%2C150" /></a></p>\n<p><a href="http://wordpress.org/extend/themes/chun"><strong>Chun</strong></a> is a free responsive HTML5 boilerplate theme.</p>\n<p><a href="http://wordpress.org/extend/themes/opus-primus"><img class="alignnone size-thumbnail wp-image-12739" alt="screenshot-1" src="http://i1.wp.com/weblogtoolscollection.com/wp-content/uploads/2013/03/screenshot-11.png?resize=150%2C150" /></a></p>\n<p><a href="http://wordpress.org/extend/themes/opus-primus"><strong>Opus Primus</strong></a> is designed and developed to be extensible and easily modified, based in the principles of decisions not options.</p>\n<p><a href="http://wordpress.org/extend/themes/superhero"><img class="alignnone size-thumbnail wp-image-12740" alt="screenshot-2" src="http://i0.wp.com/weblogtoolscollection.com/wp-content/uploads/2013/03/screenshot-2.png?resize=150%2C150" /></a></p>\n<p><a href="http://wordpress.org/extend/themes/superhero"><strong>Superhero</strong></a> features full-bleed featured posts and featured images, a fixed header, and subtle CSS3 transitions.</p>\n<img src="http://feeds.feedburner.com/~r/weblogtoolscollection/UXMP/~4/QRLNoZmiDdY" height="1" width="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 06 Mar 2013 14:00:46 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"James";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:47;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:62:"Lorelle on WP: WordPress Course at PCC-Rock Creek in Beaverton";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"http://lorelle.wordpress.com/?p=8268";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:88:"http://lorelle.wordpress.com/2013/03/06/wordpress-course-at-pcc-rock-creek-in-beaverton/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:515:"I will be teaching a WordPress Introduction college course at Portland Community College in Beaverton, just west of Portland, Oregon, starting April 3 &#8211; June 12, 2013. The course is a hybrid online course meetings Wednesdays from 6-9PM with a minimum of two hours online per week. Called &#8220;CMS Website Creation: WordPress,&#8221; this 3 credit [...]<img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=lorelle.wordpress.com&blog=72&post=8268&subd=lorelle&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 06 Mar 2013 12:44:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Lorelle VanFossen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:48;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:84:"Lorelle on WP: Introduction to WordPress Class at Clark College Continuing Education";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"http://lorelle.wordpress.com/?p=8253";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:110:"http://lorelle.wordpress.com/2013/03/05/introduction-to-wordpress-class-at-clark-college-continuing-education/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:520:"I will be teaching another Introduction to WordPress course at Clark College Corporate and Continuing Education in Vancouver, Washington, starting Saturdays, April 27 through July 13, 2013. The class will be at the Columbia Tech Center in eastern Vancouver, just across the Columbia River off Interstate 205, just a few minutes from downtown Portland, Oregon. [...]<img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=lorelle.wordpress.com&blog=72&post=8253&subd=lorelle&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 05 Mar 2013 21:13:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Lorelle VanFossen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:49;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WordPress.tv Blog: Meet the Moderators: Chandra Maharzan";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"http://wptvblog.wordpress.com/?p=231";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"http://wptvblog.wordpress.com/2013/03/05/chandra-maharzan/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4316:"<p>In last week&#8217;s post, we talked to <a title="Meet the Moderators: Jerry Bates" href="http://wptvblog.wordpress.com/2013/02/20/jerry-bates/" target="_blank">Jerry Bates</a>, one of the moderators at <a href="http://wordpress.tv/" target="_blank">WordPress.tv</a>. Let&#8217;s continue our &#8220;Meet the Moderators&#8221; Q&amp;A series with another member of this team, hailing all the way from Nepal: Chandra Maharzan.</p>\n<p><span id="more-231"></span></p>\n<h3>Chandra Maharzan<br />\nKathmandu, Nepal</h3>\n<h4><img class="size-medium wp-image-248 alignright" alt="Chandra Maharzan" src="http://wptvblog.files.wordpress.com/2013/02/chandra.jpg?w=225&h=300" width="225" height="300" />Tell us about yourself and your work.</h4>\n<p>I&#8217;m a theme designer, and since 2008 I&#8217;ve worked at <a href="http://graphpaperpress.com/" target="_blank">Graph Paper Press</a> to produce photography themes. Some of my themes have been on &#8220;top 100 free WP themes&#8221; lists on sites like <em><a href="http://www.smashingmagazine.com/">Smashing Magazine</a>, </em>and <a href="http://theme.wordpress.com/themes/gridspace/" target="_blank">Gridspace</a> &#8212; one of the themes I crafted &#8212; is the 10th most popular theme in WordPress.com&#8217;s <a href="http://theme.wordpress.com/" target="_blank">Theme Showcase</a>. I currently have three free themes at WordPress.org, and one of them, <a href="http://theme.wordpress.com/themes/book-lite/" target="_blank">Book Lite</a>, is now available on WordPress.com, too. I also create minimal themes at <a href="http://www.wpshoppe.com/" target="_blank">WPshoppe</a> and review themes at <a href="http://wordpress.org/" target="_blank">WordPress.org</a>.</p>\n<p>In 2011, I set up a WordPress group in Kathmandu, and we meet monthly. We organized our first <a href="http://2012.nepal.wordcamp.org/" target="_blank">WordCamp Nepal</a> in November, which was pretty awesome!</p>\n<p><em></em><em>Pictured at right: Chandra (right) with Philip Arthur Moore, theme wrangler at <a href="http://automattic.com/" target="_blank">Automattic</a>, in WordCamp Nepal.</em></p>\n<h4>How did you get involved with WordPress?</h4>\n<p>I began using WordPress extensively for client projects. I, along with others, thought that if WordPress was so efficient, time-saving, and cost-effective, we should share our experience with others. In April 2011, we had our first WordPress meetup with just four people. We created a Facebook group and soon after found people who were really into WordPress. While the group didn&#8217;t expand that much, we continued our monthly meetups. In August 2011, I was able to go to WordCamp San Francisco &#8212; an eye opener! I was determined to do a WordCamp in Kathmandu, so that&#8217;s how it started. We now have over 600 people in the group, and students in colleges are excited to start WordPress clubs.</p>\n<h4>Why do you want to be a WordPress.tv moderator?</h4>\n<p>I have learned many new things from the videos at <a href="http://wordpress.tv/" target="_blank">WordPress.tv</a>. But I do wish the videos were more interactive (with slides), and had high-quality sound. So, as a listener, sometimes you get lost. I want to improve our future videos and make WordPress.tv the best resource for WordPress! I want to help the WordPress community beyond the local level.</p>\n<h4>What other things do you like to do?</h4>\n<p>I have a baby girl who takes up a lot of my time. I also keep busy photographing and making music.</p>\n<p><i>Stay tuned for the next Q&amp;A in this series! If you&#8217;re interested in getting involved in WordPress events, such as WordCamps and WordPress meetups, check out the </i><a href="http://make.wordpress.org/events/"><i>Making WordPress Events</i></a><i> discussion forum. You can also see what Chandra and the WordPress.tv moderators are up to at </i><a href="http://wptvmods.wordpress.com/"><i>wptvmods</i></a><i>.</i></p>\n<br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptvblog.wordpress.com/231/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptvblog.wordpress.com/231/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wptvblog.wordpress.com&blog=5310177&post=231&subd=wptvblog&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 05 Mar 2013 18:00:20 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Cheri Lucas";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:9:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Mon, 18 Mar 2013 08:59:09 GMT";s:12:"content-type";s:8:"text/xml";s:14:"content-length";s:5:"84399";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Mon, 18 Mar 2013 08:45:15 GMT";s:4:"x-nc";s:11:"HIT luv 138";s:13:"accept-ranges";s:5:"bytes";}s:5:"build";s:14:"20121202124312";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(231, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1363640351', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(232, '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:50:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:25:"http://wordpress.org/news";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 07 Mar 2013 14:21:02 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:39:"http://wordpress.org/?v=3.6-alpha-23708";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress 3.5.1 Maintenance and Security Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/news/2013/01/wordpress-3-5-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/news/2013/01/wordpress-3-5-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 24 Jan 2013 22:23:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2531";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:359:"WordPress 3.5.1 is now available. Version 3.5.1 is the first maintenance release of 3.5, fixing 37 bugs. It is also a security release for all previous WordPress versions. For a full list of changes, consult the list of tickets and the changelog, which include: Editor: Prevent certain HTML elements from being unexpectedly removed or modified in rare [...]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2499:"<p>WordPress 3.5.1 is now available. Version 3.5.1 is the first maintenance release of 3.5, <a href="http://core.trac.wordpress.org/milestone/3.5.1">fixing 37 bugs</a>. It is also a security release for all previous WordPress versions. For a full list of changes, consult the <a href="http://core.trac.wordpress.org/query?milestone=3.5.1">list of tickets</a> and the <a href="http://core.trac.wordpress.org/log/branches/3.5?rev=23341&amp;stop_rev=23167">changelog</a>, which include:</p>\n<ul>\n<li>Editor: Prevent certain HTML elements from being unexpectedly removed or modified in rare cases.</li>\n<li>Media: Fix a collection of minor workflow and compatibility issues in the new media manager.</li>\n<li>Networks: Suggest proper rewrite rules when creating a new network.</li>\n<li>Prevent scheduled posts from being stripped of certain HTML, such as video embeds, when they are published.</li>\n<li>Work around some misconfigurations that may have caused some JavaScript in the WordPress admin area to fail.</li>\n<li>Suppress some warnings that could occur when a plugin misused the database or user APIs.</li>\n</ul>\n<p>Additionally, a bug affecting Windows servers running IIS can prevent updating from 3.5 to 3.5.1. If you receive the error &#8220;Destination directory for file streaming does not exist or is not writable,&#8221; you will need to <a href="http://codex.wordpress.org/Version_3.5.1">follow the steps outlined on the Codex</a>.</p>\n<p>WordPress 3.5.1 also addresses the following security issues:</p>\n<ul>\n<li>A server-side request forgery vulnerability and remote port scanning using pingbacks. This vulnerability, which could potentially be used to expose information and compromise a site, affects all previous WordPress versions. This was fixed by the WordPress security team. We&#8217;d like to thank security researchers <a href="http://codeseekah.com/">Gennady Kovshenin</a> and <a href="http://www.ethicalhack3r.co.uk/">Ryan Dewhurst</a> for reviewing our work.</li>\n<li>Two instances of cross-site scripting via shortcodes and post content. These issues were discovered by Jon Cave of the WordPress security team.</li>\n<li>A cross-site scripting vulnerability in the external library Plupload. Thanks to the Moxiecode team for working with us on this, and for releasing Plupload 1.5.5 to address this issue.</li>\n</ul>\n<p><strong><a href="http://wordpress.org/download/">Download 3.5.1</a> or visit Dashboard → Updates in your site admin to update now.</strong></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2013/01/wordpress-3-5-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:17:"2012: A Look Back";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"http://wordpress.org/news/2013/01/2012-a-look-back/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2013/01/2012-a-look-back/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 01 Jan 2013 02:22:20 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:13:"Uncategorized";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2525";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:340:"Another year is coming to a close, and it&#8217;s time to look back and reflect on what we&#8217;ve accomplished in the past twelve months. The WordPress community is stronger than ever, and some of the accomplishments of the past year are definitely worth remembering. Software Releases We had two major releases of the WordPress web [...]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"Jen Mylo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4441:"<p>Another year is coming to a close, and it&#8217;s time to look back and reflect on what we&#8217;ve accomplished in the past twelve months. The WordPress community is stronger than ever, and some of the accomplishments of the past year are definitely worth remembering.</p>\n<h4>Software Releases</h4>\n<p>We had two major releases of the WordPress web application with versions <a href="http://wordpress.org/news/2012/06/green/">3.4</a> and <a href="http://wordpress.org/news/2012/12/elvin/">3.5</a>, as well as 5 security releases during 2012. 3.4 included the theme customizer, while 3.5 became the long awaited &#8220;media release&#8221; featuring a new uploader and gallery management tool. 3.5 contained code contributions from more people than ever, and we hope to continue growing the contributor ranks in the year ahead. We currently have native apps on 6 mobile platforms &#8212; <a href="http://ios.wordpress.org/">iOS</a>, <a href="http://android.wordpress.org/">Android</a>, <a href="http://blackberry.wordpress.org/">Blackberry</a>, <a href="http://wpwindowsphone.wordpress.com/">Windows Phone</a>, <a href="http://nokia.wordpress.org/">Nokia</a>, and <a href="http://webos.wordpress.org/">WebOS</a> &#8212; and saw several updates there as well.</p>\n<h4>Plugin Directory</h4>\n<p>A number of improvements were made to the Plugin Directory in 2012. More cosmetic  updates, like the introduction of branded plugin page headers, make it a nicer browsing experience, while functional changes like better-integrated support forums, plugin reviews, and a favorites system made the plugin directory even more useful as a resource.</p>\n<h4>The &#8220;Make&#8221; Network and Team Reps</h4>\n<p>2012 was the year that saw the creation of <a href="http://make.wordpress.org/">Make.wordpress.org</a>, a network of sites for the teams of contributors responsible for the different areas of the WordPress project. Now anyone can follow along and get involved with the teams that work on <a href="http://make.wordpress.org/core/">core</a>, <a href="http://make.wordpress.org/themes/">theme review</a>, <a href="http://make.wordpress.org/support/">forum support</a>, <a href="http://make.wordpress.org/docs/">documentation</a>, and more. In 2013 we&#8217;ll work to improve these sites to make it easier to become a contributor. Each team also now has elected Team Reps, a new role that has already led to more cross-team communication. Team reps post each week to the <a href="https://make.wordpress.org/updates/">Updates blog</a> so that the other reps can keep up with what&#8217;s going on in other teams.</p>\n<h4>WordPress Community Summit</h4>\n<p>At the end of October, about 100 of the most influential and respected members of the WordPress community attended an inaugural <a href="https://make.wordpress.org/summit">summit</a> to discuss where we all stand, and to figure out where we go next with WordPress. A &#8220;conference of conversations,&#8221; this unconference made everyone an active participant, and while not every issue brought to the table was solved by the end of the event, the right questions were being asked.</p>\n<h4>Meetup.com</h4>\n<p>The WordPress Foundation now has a central account with Meetup.com. We&#8217;ve brought in a couple dozen existing meetup groups as a pilot to test the system, and are in the process of working with more existing meetups (as well as new ones) to join us so that local organizers won&#8217;t have to pay organizer dues and can get more support from the WordPress project.</p>\n<h4>Internet Blackout Day</h4>\n<p>We participated in the protest against SOPA/PIPA, Internet Blackout Day, on January 18. Though we usually stay out of politics, this campaign was important, and we not only participated in the blackout on WordPress.org, we encouraged our users to do so as well, and recommended plugins to provide blackout functionality. It was deemed the <a href="http://sopastrike.com/numbers/">largest online protest in history</a>.</p>\n<h4>WordCamps</h4>\n<p>And finally, it wouldn&#8217;t be a recap without counting up the <a href="http://wordcamp.org">WordCamps</a>! There were 67 WordCamps around the world in 2012, bringing together WordPress users, developers, and fans. If you didn&#8217;t make it to a WordCamp this year, maybe it can be one of your new year resolutions: <a href="http://central.wordcamp.org/schedule/">check the schedule</a> to find one near you!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"http://wordpress.org/news/2013/01/2012-a-look-back/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"WordPress 3.5 “Elvin”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://wordpress.org/news/2012/12/elvin/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:49:"http://wordpress.org/news/2012/12/elvin/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 11 Dec 2012 16:54:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2517";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:363:"It&#8217;s the most wonderful time of the year: a new WordPress release is available and chock-full of goodies to delight bloggers and developers alike. We&#8217;re calling this one &#8220;Elvin&#8221; in honor of drummer Elvin Jones, who played with John Coltrane in addition to many others. If you&#8217;ve been around WordPress a while, the most dramatic [...]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:20083:"<p>It&#8217;s the most wonderful time of the year: a new WordPress release <a href="http://wordpress.org/download/">is available</a> and chock-full of goodies to delight bloggers and developers alike. We&#8217;re calling this one &#8220;Elvin&#8221; in honor of <a href="http://en.wikipedia.org/wiki/Elvin_Jones">drummer Elvin Jones</a>, who played with John Coltrane in addition to many others.</p>\n<p>If you&#8217;ve been around WordPress a while, the most dramatic new change you&#8217;ll notice is a completely re-imagined flow for uploading photos and creating galleries. Media has long been a friction point and we&#8217;ve listened hard and given a lot of thought into crafting this new system. 3.5 includes a new default theme, Twenty Twelve, which has a very clean mobile-first responsive design and works fantastic as a base for a CMS site. Finally we&#8217;ve spent a lot of time refreshing the styles of the dashboard, updating everything to be Retina-ready with beautiful high resolution graphics, a new color picker, and streamlining a couple of fewer-used sections of the admin.</p>\n<p>Here&#8217;s a quick video overview of everything you can share with your friends:</p>\n<div id="v-jQDfEbzZ-1" class="video-player"><embed id="v-jQDfEbzZ-1-video" src="http://s0.videopress.com/player.swf?v=1.03&amp;guid=jQDfEbzZ&amp;isDynamicSeeking=true" type="application/x-shockwave-flash" width="692" height="388" title="Introducing WordPress 3.5" wmode="direct" seamlesstabbing="true" allowfullscreen="true" allowscriptaccess="always" overstretch="true"></embed></div>\n<h3>For Developers</h3>\n<p>You can now put your (or anyone&#8217;s) WordPress.org username on the plugins page and see your favorite tagged ones, to make it easy to install them again when setting up a new site. There&#8217;s a new Tumblr importer. New installs no longer show the links manager. Finally for multisite developers <code>switch_to_blog()</code> is way faster and you can now install MS in a sub-directory. The <a href="http://underscorejs.org/">Underscore</a> and <a href="http://backbonejs.org/">Backbone</a> JavaScript libraries are now available. <a href="http://codex.wordpress.org/Version_3.5">The Codex has a pretty good summary of the developer features above and beyond this</a>, and you can always <a href="http://core.trac.wordpress.org/milestone/3.5">grab a warm beverage and explore Trac directly</a>.</p>\n<h3>Percussion Section</h3>\n<p>Behind every great release is great contributors. 3.5 had more people involved than any release before it:</p>\n<p><a href="http://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="http://profiles.wordpress.org/aaronholbrook">aaronholbrook</a>, <a href="http://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="http://profiles.wordpress.org/kawauso">Adam Harley</a>, <a href="http://profiles.wordpress.org/alyssonweb">akbortoli</a>, <a href="http://profiles.wordpress.org/alecrust">alecrust</a>, <a href="http://profiles.wordpress.org/xknown">Alex Concha</a>, <a href="http://profiles.wordpress.org/alexkingorg">Alex King</a>, <a href="http://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="http://profiles.wordpress.org/alexvorn2">alexvorn2</a>, <a href="http://profiles.wordpress.org/ampt">ampt</a>, <a href="http://profiles.wordpress.org/sabreuse">Amy Hendrix (sabreuse)</a>, <a href="http://profiles.wordpress.org/andrear">andrea.r</a>, <a href="http://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="http://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="http://profiles.wordpress.org/andrewryno">Andrew Ryno</a>, <a href="http://profiles.wordpress.org/andrewspittle">Andrew Spittle</a>, <a href="http://profiles.wordpress.org/andy">Andy Skelton</a>, <a href="http://profiles.wordpress.org/apokalyptik">apokalyptik</a>, <a href="http://profiles.wordpress.org/bainternet">Bainternet</a>, <a href="http://profiles.wordpress.org/barrykooij">Barry Kooij</a>, <a href="http://profiles.wordpress.org/bazza">bazza</a>, <a href="http://profiles.wordpress.org/bbrooks">bbrooks</a>, <a href="http://profiles.wordpress.org/casben79">Ben Casey</a>, <a href="http://profiles.wordpress.org/husobj">Ben Huson</a>, <a href="http://profiles.wordpress.org/benkulbertis">Ben Kulbertis</a>, <a href="http://profiles.wordpress.org/bergius">bergius</a>, <a href="http://profiles.wordpress.org/neoxx">Bernhard Riedl</a>, <a href="http://profiles.wordpress.org/betzster">betzster</a>, <a href="http://profiles.wordpress.org/bananastalktome">Billy (bananastalktome)</a>, <a href="http://profiles.wordpress.org/bolo1988">bolo1988</a>, <a href="http://profiles.wordpress.org/bradparbs">bradparbs</a>, <a href="http://profiles.wordpress.org/bradthomas127">bradthomas127</a>, <a href="http://profiles.wordpress.org/bradyvercher">Brady Vercher</a>, <a href="http://profiles.wordpress.org/brandondove">Brandon Dove</a>, <a href="http://profiles.wordpress.org/brianlayman">Brian Layman</a>, <a href="http://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="http://profiles.wordpress.org/sennza">Bronson Quick</a>, <a href="http://profiles.wordpress.org/bpetty">Bryan Petty</a>, <a href="http://profiles.wordpress.org/cannona">cannona</a>, <a href="http://profiles.wordpress.org/sixhours">Caroline Moore</a>, <a href="http://profiles.wordpress.org/caspie">Caspie</a>, <a href="http://profiles.wordpress.org/cdog">cdog</a>, <a href="http://profiles.wordpress.org/thee17">Charles Frees-Melvin</a>, <a href="http://profiles.wordpress.org/chellycat">chellycat</a>, <a href="http://profiles.wordpress.org/chexee">Chelsea Otakan</a>, <a href="http://profiles.wordpress.org/chouby">Chouby</a>, <a href="http://profiles.wordpress.org/c3mdigital">Chris Olbekson</a>, <a href="http://profiles.wordpress.org/cfinke">Christopher Finke</a>, <a href="http://profiles.wordpress.org/chriswallace">Chris Wallace</a>, <a href="http://profiles.wordpress.org/corvannoorloos">Cor van Noorloos</a>, <a href="http://profiles.wordpress.org/scribu">Cristi Burc&#259;</a>, <a href="http://profiles.wordpress.org/mrroundhill">Dan</a>, <a href="http://profiles.wordpress.org/dan-rivera">Dan Rivera</a>, <a href="http://profiles.wordpress.org/koopersmith">Daryl Koopersmith</a>, <a href="http://profiles.wordpress.org/lessbloat">Dave Martin</a>, <a href="http://profiles.wordpress.org/deltafactory">deltafactory</a>, <a href="http://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="http://profiles.wordpress.org/djzone">DjZoNe</a>, <a href="http://profiles.wordpress.org/dllh">dllh</a>, <a href="http://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="http://profiles.wordpress.org/doublesharp">doublesharp</a>, <a href="http://profiles.wordpress.org/drewapicture">Drew Jaynes (DrewAPicture)</a>, <a href="http://profiles.wordpress.org/drewstrojny">Drew Strojny</a>, <a href="http://profiles.wordpress.org/eddiemoya">Eddie Moya</a>, <a href="http://profiles.wordpress.org/elyobo">elyobo</a>, <a href="http://profiles.wordpress.org/emiluzelac">Emil Uzelac</a>, <a href="http://profiles.wordpress.org/empireoflight">Empireoflight</a>, <a href="http://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="http://profiles.wordpress.org/ethitter">Erick Hitter</a>, <a href="http://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="http://profiles.wordpress.org/ericwahlforss">ericwahlforss</a>, <a href="http://profiles.wordpress.org/evansolomon">Evan Solomon</a>, <a href="http://profiles.wordpress.org/fadingdust">fadingdust</a>, <a href="http://profiles.wordpress.org/f-j-kaiser">F J Kaiser</a>, <a href="http://profiles.wordpress.org/foxinni">foxinni</a>, <a href="http://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="http://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="http://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="http://profiles.wordpress.org/geertdd">GeertDD</a>, <a href="http://profiles.wordpress.org/mamaduka">George Mamadashvili</a>, <a href="http://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="http://profiles.wordpress.org/ghosttoast">GhostToast</a>, <a href="http://profiles.wordpress.org/gnarf">gnarf</a>, <a href="http://profiles.wordpress.org/goldenapples">goldenapples</a>, <a href="http://profiles.wordpress.org/webord">Gustavo Bordoni</a>, <a href="http://profiles.wordpress.org/hakre">hakre</a>, <a href="http://profiles.wordpress.org/hanni">hanni</a>, <a href="http://profiles.wordpress.org/hardy101">hardy101</a>, <a href="http://profiles.wordpress.org/hebbet">hebbet</a>, <a href="http://profiles.wordpress.org/helenyhou">Helen Hou-Sandi</a>, <a href="http://profiles.wordpress.org/hugobaeta">Hugo Baeta</a>, <a href="http://profiles.wordpress.org/iamfriendly">iamfriendly</a>, <a href="http://profiles.wordpress.org/iandstewart">Ian Stewart</a>, <a href="http://profiles.wordpress.org/ikailo">ikailo</a>, <a href="http://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="http://profiles.wordpress.org/itworx">itworx</a>, <a href="http://profiles.wordpress.org/j-idris">j-idris</a>, <a href="http://profiles.wordpress.org/jakemgold">Jake Goldman</a>, <a href="http://profiles.wordpress.org/jakubtyrcha">jakub.tyrcha</a>, <a href="http://profiles.wordpress.org/jamescollins">James Collins</a>, <a href="http://profiles.wordpress.org/jammitch">jammitch</a>, <a href="http://profiles.wordpress.org/jane">Jane Wells</a>, <a href="http://profiles.wordpress.org/japh">Japh</a>, <a href="http://profiles.wordpress.org/jarretc">JarretC</a>, <a href="http://profiles.wordpress.org/madtownlems">Jason Lemahieu (MadtownLems)</a>, <a href="http://profiles.wordpress.org/javert03">javert03</a>, <a href="http://profiles.wordpress.org/jbrinley">jbrinley</a>, <a href="http://profiles.wordpress.org/jcakec">jcakec</a>, <a href="http://profiles.wordpress.org/jblz">Jeff Bowen</a>, <a href="http://profiles.wordpress.org/jeffsebring">Jeff Sebring</a>, <a href="http://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="http://profiles.wordpress.org/hd-j">Jeremy Herve</a>, <a href="http://profiles.wordpress.org/jerrysarcastic">Jerry Bates (JerrySarcastic)</a>, <a href="http://profiles.wordpress.org/jayjdk">Jesper Johansen (Jayjdk)</a>, <a href="http://profiles.wordpress.org/jndetlefsen">jndetlefsen</a>, <a href="http://profiles.wordpress.org/joehoyle">Joe Hoyle</a>, <a href="http://profiles.wordpress.org/joelhardi">joelhardi</a>, <a href="http://profiles.wordpress.org/jkudish">Joey Kudish</a>, <a href="http://profiles.wordpress.org/johnbillion">John Blackbourn (johnbillion)</a>, <a href="http://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="http://profiles.wordpress.org/johnpbloch">John P. Bloch</a>, <a href="http://profiles.wordpress.org/jond3r">Jonas Bolinder</a>, <a href="http://profiles.wordpress.org/jondavidjohn">Jonathan D. Johnson</a>, <a href="http://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="http://profiles.wordpress.org/joostdekeijzer">joostdekeijzer</a>, <a href="http://profiles.wordpress.org/koke">Jorge Bernal</a>, <a href="http://profiles.wordpress.org/josephscott">Joseph Scott</a>, <a href="http://profiles.wordpress.org/pottersys">Juan</a>, <a href="http://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="http://profiles.wordpress.org/jtsternberg">Justin Sternberg</a>, <a href="http://profiles.wordpress.org/greenshady">Justin Tadlock</a>, <a href="http://profiles.wordpress.org/trepmal">Kailey Lampert (trepmal)</a>, <a href="http://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="http://profiles.wordpress.org/keruspe">Keruspe</a>, <a href="http://profiles.wordpress.org/kitchin">kitchin</a>, <a href="http://profiles.wordpress.org/knutsp">Knut Sparhell</a>, <a href="http://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="http://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="http://profiles.wordpress.org/kopepasah">Kopepasah</a>, <a href="http://profiles.wordpress.org/klagraff">Kristopher Lagraff</a>, <a href="http://profiles.wordpress.org/kurtpayne">Kurt Payne</a>, <a href="http://profiles.wordpress.org/kyrylo">Kyrylo</a>, <a href="http://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="http://profiles.wordpress.org/larysa">Larysa Mykhas</a>, <a href="http://profiles.wordpress.org/leogermani">leogermani</a>, <a href="http://profiles.wordpress.org/lesteph">lesteph</a>, <a href="http://profiles.wordpress.org/linuxologos">linuxologos</a>, <a href="http://profiles.wordpress.org/ldebrouwer">Luc De Brouwer</a>, <a href="http://profiles.wordpress.org/lgedeon">Luke Gedeon</a>, <a href="http://profiles.wordpress.org/latz">Lutz Schroer</a>, <a href="http://profiles.wordpress.org/mailnew2ster">mailnew2ster</a>, <a href="http://profiles.wordpress.org/targz-1">Manuel Schmalstieg</a>, <a href="http://profiles.wordpress.org/maor">Maor Chasen</a>, <a href="http://profiles.wordpress.org/mimecine">Marco</a>, <a href="http://profiles.wordpress.org/marcuspope">MarcusPope</a>, <a href="http://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="http://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="http://profiles.wordpress.org/martythornley">MartyThornley</a>, <a href="http://profiles.wordpress.org/mattdanner">mattdanner</a>, <a href="http://profiles.wordpress.org/bigdawggi">Matthew Richmond</a>, <a href="http://profiles.wordpress.org/sivel">Matt Martz</a>, <a href="http://profiles.wordpress.org/iammattthomas">Matt Thomas</a>, <a href="http://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="http://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="http://profiles.wordpress.org/maxcutler">Max Cutler</a>, <a href="http://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="http://profiles.wordpress.org/merty">Mert Yazicioglu</a>, <a href="http://profiles.wordpress.org/mdawaffe">Michael Adams (mdawaffe)</a>, <a href="http://profiles.wordpress.org/mfields">Michael Fields</a>, <a href="http://profiles.wordpress.org/mbijon">Mike Bijon</a>, <a href="http://profiles.wordpress.org/mdgl">Mike Glendinning</a>, <a href="http://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="http://profiles.wordpress.org/mikelittle">Mike Little</a>, <a href="http://profiles.wordpress.org/mikeschinkel">Mike Schinkel</a>, <a href="http://profiles.wordpress.org/DH-Shredder">Mike Schroder</a>, <a href="http://profiles.wordpress.org/toppa">Mike Toppa</a>, <a href="http://profiles.wordpress.org/dimadin">Milan Dinic</a>, <a href="http://profiles.wordpress.org/mitchoyoshitaka">mitcho (Michael Yoshitaka Erlewine)</a>, <a href="http://profiles.wordpress.org/batmoo">Mohammad Jangda</a>, <a href="http://profiles.wordpress.org/mohanjith">mohanjith</a>, <a href="http://profiles.wordpress.org/mpvanwinkle77">mpvanwinkle77</a>, <a href="http://profiles.wordpress.org/usermrpapa">Mr Papa</a>, <a href="http://profiles.wordpress.org/murky">murky</a>, <a href="http://profiles.wordpress.org/Nao">Naoko Takano</a>, <a href="http://profiles.wordpress.org/alex-ye">Nashwan Doaqan</a>, <a href="http://profiles.wordpress.org/niallkennedy">Niall Kennedy</a>, <a href="http://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="http://profiles.wordpress.org/ntm">ntm</a>, <a href="http://profiles.wordpress.org/nvartolomei">nvartolomei</a>, <a href="http://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="http://profiles.wordpress.org/pdclark">pdclark</a>, <a href="http://profiles.wordpress.org/petemall">Pete Mall</a>, <a href="http://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="http://profiles.wordpress.org/pas5027">Pete Schuster</a>, <a href="http://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="http://profiles.wordpress.org/phill_brown">Phill Brown</a>, <a href="http://profiles.wordpress.org/picklepete">picklepete</a>, <a href="http://profiles.wordpress.org/picklewagon">Picklewagon</a>, <a href="http://profiles.wordpress.org/nprasath002">Prasath Nadarajah</a>, <a href="http://profiles.wordpress.org/r-a-y">r-a-y</a>, <a href="http://profiles.wordpress.org/ramiy">Rami Yushuvaev</a>, <a href="http://profiles.wordpress.org/moraleidame">Ricardo Moraleida</a>, <a href="http://profiles.wordpress.org/miqrogroove">Robert Chapin (miqrogroove)</a>, <a href="http://profiles.wordpress.org/wet">Robert Wetzlmayr</a>, <a href="http://profiles.wordpress.org/wpmuguru">Ron Rennick</a>, <a href="http://profiles.wordpress.org/rstern">rstern</a>, <a href="http://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="http://profiles.wordpress.org/ryanimel">Ryan Imel</a>, <a href="http://profiles.wordpress.org/ryanjkoehler">Ryan Koehler</a>, <a href="http://profiles.wordpress.org/markel">Ryan Markel</a>, <a href="http://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="http://profiles.wordpress.org/zeo">Safirul Alredha</a>, <a href="http://profiles.wordpress.org/solarissmoke">Samir Shah</a>, <a href="http://profiles.wordpress.org/gluten">Sam Margulies</a>, <a href="http://profiles.wordpress.org/otto42">Samuel Wood (Otto)</a>, <a href="http://profiles.wordpress.org/saracannon">sara cannon</a>, <a href="http://profiles.wordpress.org/gandham">Satish Gandham</a>, <a href="http://profiles.wordpress.org/scottgonzalez">scott.gonzalez</a>, <a href="http://profiles.wordpress.org/sc0ttkclark">Scott Kingsley Clark</a>, <a href="http://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="http://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="http://profiles.wordpress.org/greglone">ScreenfeedFr</a>, <a href="http://profiles.wordpress.org/sergeysbetkenovgaroru">sergey.s.betke</a>, <a href="http://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="http://profiles.wordpress.org/pross">Simon Prosser</a>, <a href="http://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="http://profiles.wordpress.org/sirzooro">sirzooro</a>, <a href="http://profiles.wordpress.org/ssamture">ssamture</a>, <a href="http://profiles.wordpress.org/sterlo">sterlo</a>, <a href="http://profiles.wordpress.org/sumindmitriy">sumindmitriy</a>, <a href="http://profiles.wordpress.org/sushkov">sushkov</a>, <a href="http://profiles.wordpress.org/swekitsune">swekitsune</a>, <a href="http://profiles.wordpress.org/iamtakashi">Takashi Irie</a>, <a href="http://profiles.wordpress.org/taylorde">Taylor Dewey</a>, <a href="http://profiles.wordpress.org/tlovett1">Taylor Lovett</a>, <a href="http://profiles.wordpress.org/saltcod">Terry Sutton</a>, <a href="http://profiles.wordpress.org/griffinjt">Thomas Griffin</a>, <a href="http://profiles.wordpress.org/tott">Thorsten Ott</a>, <a href="http://profiles.wordpress.org/timbeks">timbeks</a>, <a href="http://profiles.wordpress.org/timfs">timfs</a>, <a href="http://profiles.wordpress.org/tmoorewp">Tim Moore</a>, <a href="http://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="http://profiles.wordpress.org/tomasm">TomasM</a>, <a href="http://profiles.wordpress.org/tomauger">Tom Auger</a>, <a href="http://profiles.wordpress.org/tommcfarlin">tommcfarlin</a>, <a href="http://profiles.wordpress.org/willmot">Tom Willmot</a>, <a href="http://profiles.wordpress.org/toscho">toscho</a>, <a href="http://profiles.wordpress.org/wpsmith">Travis Smith</a>, <a href="http://profiles.wordpress.org/vhauri">Vasken Hauri</a>, <a href="http://profiles.wordpress.org/viniciusmassuchetto">Vinicius Massuchetto</a>, <a href="http://profiles.wordpress.org/lightningspirit">Vitor Carvalho</a>, <a href="http://profiles.wordpress.org/waclawjacek">Waclaw</a>, <a href="http://profiles.wordpress.org/waldojaquith">WaldoJaquith</a>, <a href="http://profiles.wordpress.org/wojtekszkutnik">Wojtek Szkutnik</a>, <a href="http://profiles.wordpress.org/xibe">Xavier Borderie</a>, <a href="http://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="http://profiles.wordpress.org/yogi-t">Yogi T</a>, <a href="http://profiles.wordpress.org/tollmanz">Zack Tollman</a>, and <a href="http://profiles.wordpress.org/zamoose">ZaMoose</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:45:"http://wordpress.org/news/2012/12/elvin/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress 3.5 Release Candidate 3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wordpress.org/news/2012/12/wordpress-3-5-release-candidate-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"http://wordpress.org/news/2012/12/wordpress-3-5-release-candidate-3/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 04 Dec 2012 08:37:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wordpress.org/news/2012/12/wordpress-3-5-release-candidate-3/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:339:"The third release candidate for WordPress 3.5 is now available. We&#8217;ve made a number of changes over the last week since RC2 that we can&#8217;t wait to get into your hands. Hope you&#8217;re ready to do some testing! Final UI improvements for the new media manager, based on lots of great feedback. Show more information about [...]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1950:"<p>The third release candidate for WordPress 3.5 is now available. We&#8217;ve made a number of changes over the last week since <a title="WordPress 3.5 Release Candidate 2" href="http://wordpress.org/news/2012/11/wordpress-3-5-release-candidate-2/">RC2</a> that we can&#8217;t wait to get into your hands. Hope you&#8217;re ready to do some testing!</p>\n<ul>\n<li><span style="line-height: 13px">Final UI improvements for the new media manager, based on lots of great feedback.</span></li>\n<li>Show more information about uploading errors when they occur.</li>\n<li>When inserting an image into a post, don&#8217;t forget the alternative text.</li>\n<li>Fixes for the new admin button styles.</li>\n<li>Improvements for mobile devices, Internet Explorer, and right-to-left languages.</li>\n<li>Fix cookies for subdomain installs when multisite is installed in a subdirectory.</li>\n<li>Fix ms-files.php rewriting for very old multisite installs.</li>\n</ul>\n<p>At this point, we only have a <a href="http://core.trac.wordpress.org/report/5">few minor issues</a> left. If all goes well, you will see WordPress 3.5 very soon. If you run into any issues, please post to the <a href="http://wordpress.org/support/forum/alphabeta/">Alpha/Beta area in the support forums</a>.</p>\n<p>If you&#8217;d like to know what to test, visit the About page (<strong><img style="vertical-align: middle" alt="" src="http://wordpress.org/wp-content/themes/twentyten/images/wordpress.png" /> → About</strong> in the toolbar) and check out the list of features. This is still development software, so your boss may get mad if you install this on a live site. To test WordPress 3.5, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="http://wordpress.org/wordpress-3.5-RC3.zip">download the release candidate here (zip)</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wordpress.org/news/2012/12/wordpress-3-5-release-candidate-3/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress 3.5 Release Candidate 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wordpress.org/news/2012/11/wordpress-3-5-release-candidate-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"http://wordpress.org/news/2012/11/wordpress-3-5-release-candidate-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 29 Nov 2012 19:55:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2494";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:339:"The second release candidate for WordPress 3.5 is now available for download and testing. We&#8217;re still working on about a dozen remaining issues, but we hope to deliver WordPress 3.5 to your hands as early as next week. If you&#8217;d like to know what to test, visit the About page ( → About in the toolbar) and check out [...]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1509:"<p>The second release candidate for WordPress 3.5 is now available for download and testing.</p>\n<p>We&#8217;re still working on about a dozen remaining issues, but we hope to deliver WordPress 3.5 to your hands as early as next week. If you&#8217;d like to know what to test, visit the About page (<strong><img alt="" src="http://wordpress.org/wp-content/themes/twentyten/images/wordpress.png" /> → About</strong> in the toolbar) and check out the list of features! As usual, this is still development software and we suggest you do not install this on a live site unless you are adventurous.</p>\n<p><strong>Think you&#8217;ve found a bug?</strong> Please post to the <a href="http://wordpress.org/support/forum/alphabeta/">Alpha/Beta area in the support forums</a>.</p>\n<p><strong>Developers,</strong> please continue to test your plugins and themes, so that if there is a compatibility issue, we can figure it out before the final release. You can find our <a href="http://core.trac.wordpress.org/report/6">list of known issues here</a>.</p>\n<p>To test WordPress 3.5, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="http://wordpress.org/wordpress-3.5-RC2.zip">download the release candidate here (zip)</a>.</p>\n<p><em>&#8211;<br />\n</em><em>We are getting close<br />\n</em><em>Should have asked for haiku help<br />\n</em><em>Please test RC2</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wordpress.org/news/2012/11/wordpress-3-5-release-candidate-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 3.5 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wordpress.org/news/2012/11/wordpress-3-5-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"http://wordpress.org/news/2012/11/wordpress-3-5-release-candidate/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 22 Nov 2012 13:35:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2479";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:341:"The first release candidate for WordPress 3.5 is now available. We hope to ship WordPress 3.5 in two weeks. But to do that, we need your help! If you haven&#8217;t tested 3.5 yet, there&#8217;s no time like the present. (The oft-repeated warning: Please, not on a live site, unless you&#8217;re adventurous.) Think you&#8217;ve found a [...]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1545:"<p>The first release candidate for WordPress 3.5 is now available.</p>\n<p>We hope to ship WordPress 3.5 in <em>two weeks</em>. But to do that, we need your help! If you haven&#8217;t tested 3.5 yet, there&#8217;s no time like the present. (The oft-repeated warning: Please, not on a live site, unless you&#8217;re adventurous.)</p>\n<p><strong>Think you&#8217;ve found a bug?</strong> Please post to the <a href="http://wordpress.org/support/forum/alphabeta/">Alpha/Beta area in the support forums</a>. If any known issues come up, you’ll be able to <a href="http://core.trac.wordpress.org/report/6">find them here</a>. <strong>Developers,</strong> please test your plugins and themes, so that if there is a compatibility issue, we can figure it out before the final release.</p>\n<p>To test WordPress 3.5, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="http://wordpress.org/wordpress-3.5-RC1.zip">download the release candidate here (zip)</a>.</p>\n<p>If you&#8217;d like to know what to <del>break</del> test, visit the About page (<strong><img style="vertical-align: text-top" alt="" src="http://wordpress.org/wp-content/themes/twentyten/images/wordpress.png" /> → About</strong> in the toolbar) and check out the list of features! Trust me, you want to try out media.</p>\n<p><em>Release candidate</em><br />\n<em>Three point five in two weeks time</em><br />\n<em>Please test all the things</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wordpress.org/news/2012/11/wordpress-3-5-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 3.5 Beta 3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2012/11/wordpress-3-5-beta-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2012/11/wordpress-3-5-beta-3/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 13 Nov 2012 04:26:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:7:"Testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2467";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:341:"The third beta release of WordPress 3.5 is now available for download and testing. Hey, developers! We expect to WordPress 3.5 to be ready in just a few short weeks. Please, please test your plugins and themes against beta 3. Media management has been rewritten, and we&#8217;ve taken great pains to ensure most plugins will work the [...]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2677:"<p>The third beta release of WordPress 3.5 is now available for download and testing.</p>\n<p><strong>Hey, developers!</strong> We expect to WordPress 3.5 to be ready in just a few short weeks. <em>Please, please</em> test your plugins and themes against beta 3. Media management has been rewritten, and we&#8217;ve taken great pains to ensure most plugins will work the same as before, but we&#8217;re not perfect. We would like to hear about any incompatibilities we&#8217;ve caused so we can work with you to address them <em>before</em> release, rather than after. I think you&#8217;ll agree it&#8217;s much better that way. <img src=''http://wordpress.org/news/wp-includes/images/smilies/icon_smile.gif'' alt='':-)'' class=''wp-smiley'' /> </p>\n<p>To test WordPress 3.5, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="http://wordpress.org/wordpress-3.5-beta3.zip">download the beta here</a> (zip). For more on 3.5, <a title="WordPress 3.5 Beta 1" href="http://wordpress.org/news/2012/09/wordpress-3-5-beta-1/">check out the extensive Beta 1 blog post</a>, which covers what’s new in version 3.5 and how you can help. We made <a href="http://core.trac.wordpress.org/log/trunk?action=stop_on_copy&amp;mode=stop_on_copy&amp;rev=22557&amp;stop_rev=22224&amp;limit=400">more than 300 changes</a> since <a href="http://wordpress.org/news/2012/10/wordpress-3-5-beta-2/">beta 2</a>. <span style="line-height: 13px">At this point, the Add Media dialog is complete, and we&#8217;re now just working on fixing up inserting images into the editor. We&#8217;ve also u</span>pdated to jQuery UI 1.9.1, SimplePie 1.3.1, and TinyMCE 3.5.7.</p>\n<p>The usual warnings apply: We can see the light at the end of the tunnel, but this is software still in development, so we don’t recommend that you run it on a production site. Set up a test site to play with the new version.</p>\n<p>As always, if you think you’ve found a bug, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a reproducible bug report, <a href="http://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/report/5">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=3.5">everything we’ve fixed</a> so far.</p>\n<p><em>Beta three is out</em><br />\n<em>Soon, a release candidate</em><br />\n<em>Three point five is near</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2012/11/wordpress-3-5-beta-3/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 3.5 Beta 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2012/10/wordpress-3-5-beta-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2012/10/wordpress-3-5-beta-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 13 Oct 2012 00:02:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2458";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:342:"Two weeks after the first beta, WordPress 3.5 Beta 2 is now available for download and testing. This is software still in development, so we don’t recommend that you run it on a production site. Set up a test site to play with the new version. To test WordPress 3.5, try the WordPress Beta Tester plugin (you’ll want “bleeding [...]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1856:"<p>Two weeks after the first beta, WordPress 3.5 Beta 2 is now available for download and testing.</p>\n<p>This is software still in development, so we don’t recommend that you run it on a production site. Set up a test site to play with the new version. To test WordPress 3.5, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="http://wordpress.org/wordpress-3.5-beta2.zip">download the beta here</a> (zip).</p>\n<p>For more, <a title="WordPress 3.5 Beta 1" href="http://wordpress.org/news/2012/09/wordpress-3-5-beta-1/"><strong>check out the extensive Beta 1 blog post</strong></a>, which covers what&#8217;s new in version 3.5 and how you can help. What&#8217;s new since beta 1? I&#8217;m glad you asked:</p>\n<ul>\n<li>New workflow for working with image galleries, including drag-and-drop reordering and quick caption editing.</li>\n<li>New image editing API. (<a title="Ticket 6821" href="http://core.trac.wordpress.org/ticket/6821">#6821</a>)</li>\n<li><del>New user interface for setting static front pages for the Reading Settings screen. (<a title="Ticket 16379" href="http://core.trac.wordpress.org/ticket/16379">#16379</a>)</del></li>\n</ul>\n<p>As always, if you think you’ve found a bug, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a reproducible bug report, <a href="http://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/report/5">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=3.5">everything we’ve fixed</a> so far. Happy testing!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2012/10/wordpress-3-5-beta-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WordPress 3.5 Beta 1 (and a bonus!)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2012/09/wordpress-3-5-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2012/09/wordpress-3-5-beta-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 27 Sep 2012 22:37:49 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2443";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:376:"I&#8217;m excited to announce the availability of WordPress 3.5 Beta 1. This is software still in development and we really don’t recommend that you run it on a production site — set up a test site just to play with the new version. To test WordPress 3.5, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can download [...]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:6696:"<p>I&#8217;m excited to announce the availability of WordPress 3.5 Beta 1.</p>\n<p>This is software still in development and <strong>we <em>really</em> don’t recommend that you run it on a production site</strong> — set up a test site just to play with the new version. To test WordPress 3.5, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="http://wordpress.org/wordpress-3.5-beta-1.zip">download the beta here</a> (zip).</p>\n<p>In just three short months, we&#8217;ve already made a few hundred changes to improve your WordPress experience. The biggest thing we&#8217;ve been working on is overhauling the media experience from the ground up. We&#8217;ve made it all fair game: How you upload photos, arrange galleries, insert images into posts, and more. It&#8217;s still rough around the edges and some pieces are missing — which means now is the <em>perfect</em> time to test it out, report issues, and help shape our headline feature.</p>\n<p>As always, if you think you’ve found a bug, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a reproducible bug report, <a href="http://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/report/5">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=3.5">everything we&#8217;ve fixed</a> so far.</p>\n<p>Here&#8217;s some more of what&#8217;s new:</p>\n<ul>\n<li><strong>Appearance: </strong>A simplified welcome screen. A new color picker. And the all-HiDPI (retina) dashboard.</li>\n<li><strong>Accessibility:</strong> Keyboard navigation and screen reader support have both been improved.</li>\n<li><strong>Plugins: </strong>You can browse and install plugins you&#8217;ve marked as favorites on WordPress.org, directly from your dashboard.</li>\n<li><strong>Mobile: </strong>It&#8217;ll be easier to link up your WordPress install with <a href="http://wordpress.org/extend/mobile/">our mobile apps</a>, as XML-RPC is now enabled by default.</li>\n<li><strong>Links: </strong>We&#8217;ve hidden the Link Manager for new installs. (Don&#8217;t worry, <a href="http://wordpress.org/extend/plugins/link-manager/">there&#8217;s a plugin for that</a>.)</li>\n</ul>\n<p><strong>Developers: </strong>We love you. We do. And one of the things we strive to do with every release is be compatible with all existing plugins and themes. To make sure we don&#8217;t break anything, we need your help. <strong>Please, please test your plugins and themes against 3.5.</strong> If something isn&#8217;t quite right, please let us know. (Chances are, it wasn&#8217;t intentional.) And despite all of the changes to media, we&#8217;re still aiming to be backwards compatible with plugins that make changes to the existing media library. It&#8217;s a tall task, and it means we need your help.</p>\n<p>Here&#8217;s some more things we think developers will enjoy (and should test their plugins and themes against):</p>\n<ul>\n<li><strong>External libraries updated:</strong> TinyMCE  <del>3.5.6</del> 3.5.7. SimplePie <del>1.3</del> 1.3.1. jQuery <del>1.8.2</del> 1.8.3. jQuery UI <del>1.9 (and it&#8217;s not even released yet)</del> 1.9.2. We&#8217;ve also added Backbone 0.9.2 and Underscore <del>1.3.3</del> 1.4.2, and you can use protocol-relative links when enqueueing scripts and styles. (<a href="http://core.trac.wordpress.org/ticket/16560">#16560</a>)</li>\n<li><strong>WP Query:</strong> You can now ask to receive posts in the order specified by <code>post__in</code>. (<a href="http://core.trac.wordpress.org/ticket/13729">#13729</a>)</li>\n<li><strong>XML-RPC:</strong> New user management, profile editing, and post revision methods. We&#8217;ve also removed AtomPub. (<a href="http://core.trac.wordpress.org/ticket/18428">#18428</a>, <a href="http://core.trac.wordpress.org/ticket/21397">#21397</a>, <a href="http://core.trac.wordpress.org/ticket/21866">#21866</a>)</li>\n<li><strong>Multisite: </strong>switch_to_blog() is now used in more places, is faster, and more reliable. Also: You can now use multisite in a subdirectory, and uploaded files no longer go through ms-files (for new installs). (<a href="http://core.trac.wordpress.org/ticket/21434">#21434</a>, <a href="http://core.trac.wordpress.org/ticket/19796">#19796</a>, <a href="http://core.trac.wordpress.org/ticket/19235">#19235</a>)</li>\n<li><strong>TinyMCE: </strong>We&#8217;ve added an experimental API for &#8220;views&#8221; which you can use to offer previews and interaction of elements from the visual editor. (<a href="http://core.trac.wordpress.org/ticket/21812">#21812</a>)</li>\n<li><strong>Posts API: </strong>Major performance improvements when working with hierarchies of pages and post ancestors. Also, you can now &#8220;turn on&#8221; native custom columns for taxonomies on edit post screens. (<a href="http://core.trac.wordpress.org/ticket/11399">#11399</a>, <a href="http://core.trac.wordpress.org/ticket/21309">#21309</a>, <a href="http://core.trac.wordpress.org/ticket/21240">#21240</a>)</li>\n<li><strong>Comments API:</strong> Search for comments of a particular status, or with a meta query (same as with WP_Query). (<a href="http://core.trac.wordpress.org/ticket/21101">#21101</a>, <a href="http://core.trac.wordpress.org/ticket/21003">#21003</a>)</li>\n<li><strong>oEmbed: </strong>We&#8217;ve added support for a few oEmbed providers, and we now handle SSL links. (<a href="http://core.trac.wordpress.org/ticket/15734">#15734</a>, <a href="http://core.trac.wordpress.org/ticket/21635">#21635</a>, <a href="http://core.trac.wordpress.org/ticket/16996">#16996</a>, <a href="http://core.trac.wordpress.org/ticket/20102">#20102</a>)</li>\n</ul>\n<p>We&#8217;re looking forward to your feedback. If you break it (find a bug), please report it, and if you’re a developer, try to help us fix it. We&#8217;ve already had more than 200 contributors to version 3.5 — come join us!</p>\n<h3>And as promised, a bonus:</h3>\n<p>We&#8217;re planning a December 5 release for WordPress 3.5. But, we have a special offering for you, today. The newest default theme for WordPress, <strong>Twenty</strong><strong> Twelve</strong>, is now <a href="http://wordpress.org/extend/themes/twentytwelve">available for download</a> from the WordPress themes directory. It&#8217;s a gorgeous and fully responsive theme, and it works with WordPress 3.4.2. Take it for a spin!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2012/09/wordpress-3-5-beta-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress 3.4.2 Maintenance and Security Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/news/2012/09/wordpress-3-4-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/news/2012/09/wordpress-3-4-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 06 Sep 2012 20:07:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2426";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:355:"WordPress 3.4.2, now available for download, is a maintenance and security release for all previous versions. After nearly 15 million downloads since 3.4 was released not three months ago, we&#8217;ve identified and fixed a number of nagging bugs, including: Fix some issues with older browsers in the administration area. Fix an issue where a theme [...]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1443:"<p>WordPress 3.4.2, now available for download, is a maintenance and security release for all previous versions.</p>\n<p>After nearly 15 million downloads since 3.4 was released not three months ago, we&#8217;ve <a href="http://core.trac.wordpress.org/query?status=closed&amp;resolution=fixed&amp;milestone=3.4.2&amp;group=resolution&amp;order=severity&amp;desc=1">identified and fixed a number of nagging bugs</a>, including:</p>\n<ul>\n<li>Fix some issues with older browsers in the administration area.</li>\n<li>Fix an issue where a theme may not preview correctly, or its screenshot may not be displayed.</li>\n<li>Improve plugin compatibility with the visual editor.</li>\n<li>Address pagination problems with some category permalink structures.</li>\n<li>Avoid errors with both oEmbed providers and trackbacks.</li>\n<li>Prevent improperly sized header images from being uploaded.</li>\n</ul>\n<p>Version 3.4.2 also fixes a few security issues and contains some security hardening. The vulnerabilities included potential privilege escalation and a bug that affects multisite installs with untrusted users. These issues were discovered and fixed by the WordPress security team.</p>\n<p><a href="http://wordpress.org/download/"><strong>Download 3.4.2</strong></a><strong> now or visit Dashboard → Updates in your site admin to update now.</strong></p>\n<p><em>Fixes for some bugs<br />\nBack to work on 3.5<br />\nIt&#8217;s time to update</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2012/09/wordpress-3-4-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:31:"http://wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Mon, 18 Mar 2013 08:59:08 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:10:"x-pingback";s:36:"http://wordpress.org/news/xmlrpc.php";s:13:"last-modified";s:29:"Thu, 07 Mar 2013 14:21:02 GMT";s:4:"x-nc";s:11:"HIT luv 138";}s:5:"build";s:14:"20121202124312";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(144, '_site_transient_timeout_wporg_theme_feature_list', '1363268308', 'yes'),
(145, '_site_transient_wporg_theme_feature_list', 'a:5:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:7:"Columns";a:6:{i:0;s:10:"one-column";i:1;s:11:"two-columns";i:2;s:13:"three-columns";i:3;s:12:"four-columns";i:4;s:12:"left-sidebar";i:5;s:13:"right-sidebar";}s:5:"Width";a:2:{i:0;s:11:"fixed-width";i:1;s:14:"flexible-width";}s:8:"Features";a:19:{i:0;s:8:"blavatar";i:1;s:10:"buddypress";i:2;s:17:"custom-background";i:3;s:13:"custom-colors";i:4;s:13:"custom-header";i:5;s:11:"custom-menu";i:6;s:12:"editor-style";i:7;s:21:"featured-image-header";i:8;s:15:"featured-images";i:9;s:15:"flexible-header";i:10;s:20:"front-page-post-form";i:11;s:19:"full-width-template";i:12;s:12:"microformats";i:13;s:12:"post-formats";i:14;s:20:"rtl-language-support";i:15;s:11:"sticky-post";i:16;s:13:"theme-options";i:17;s:17:"threaded-comments";i:18;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}}', 'yes'),
(160, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1363273460', 'yes'),
(148, 'theme_mods_twentytwelve', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1363257052;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(149, 'current_theme', 'OOCO Beauty', 'yes'),
(150, 'theme_mods_themia-lite', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1363257507;s:4:"data";a:7:{s:19:"wp_inactive_widgets";a:0:{}s:19:"primary-widget-area";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:21:"secondary-widget-area";a:0:{}s:24:"first-footer-widget-area";a:0:{}s:25:"second-footer-widget-area";N;s:24:"third-footer-widget-area";N;s:25:"fourth-footer-widget-area";N;}}}', 'yes'),
(151, 'theme_switched', '', 'yes'),
(154, 'theme_mods_ooco_beauty', 'a:1:{i:0;b:0;}', 'yes'),
(155, 'recently_activated', 'a:4:{s:15:"eshop/eshop.php";i:1363514073;s:21:"catablog/catablog.php";i:1363513578;s:43:"testimonials-widget/testimonials-widget.php";i:1363505288;s:43:"visual-form-builder/visual-form-builder.php";i:1363262650;}', 'yes'),
(161, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"3406";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"2207";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"2091";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"1732";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"1645";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1450";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1165";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1161";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1153";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1119";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1066";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:3:"983";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:3:"892";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:3:"836";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:3:"826";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:3:"767";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:3:"724";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:3:"719";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:3:"665";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"664";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"617";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"613";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"593";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"573";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"524";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"503";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"498";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"496";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"490";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"471";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"466";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"444";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"441";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"432";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"404";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"401";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"399";}s:5:"flash";a:3:{s:4:"name";s:5:"flash";s:4:"slug";s:5:"flash";s:5:"count";s:3:"383";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"382";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"378";}}', 'yes'),
(159, '_transient_plugins_delete_result_1', '1', 'yes'),
(165, 'wpcf7', 'a:1:{s:7:"version";s:5:"3.3.3";}', 'yes'),
(167, 'CF7DBPlugin_NoSaveFields', '_wpcf7,_wpcf7_version,_wpcf7_unit_tag,_wpnonce,_wpcf7_is_ajax_call,_wpcf7_captcha_challenge_captcha', 'yes'),
(168, 'CF7DBPlugin__version', '2.5', 'yes'),
(169, 'CF7DBPlugin__installed', '1', 'yes'),
(173, '_site_transient_timeout_browser_42195b324c48c016f0202ae5b04e937a', '1364102580', 'yes'),
(174, '_site_transient_browser_42195b324c48c016f0202ae5b04e937a', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"25.0.1364.172";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(176, 'seo_company_name', 'OBS Group LLC', 'yes'),
(177, 'seo_company_address', 'Dubai - UAE', 'yes'),
(178, 'seo_company_city', '', 'yes'),
(179, 'seo_company_state', '', 'yes'),
(180, 'seo_company_zip', '88001', 'yes'),
(181, 'seo_company_phone', '+9714 297 12 12', 'yes'),
(182, 'seo_company_alt_phone', '', 'yes'),
(183, 'seo_company_fax', '+971 4 297 11 22', 'yes'),
(184, 'seo_company_email', 'info@obsgroup.com', 'yes'),
(185, 'seo_company_optional_email', '', 'yes'),
(186, 'seo_company_latitude', '', 'yes'),
(187, 'seo_company_longitude', '', 'yes'),
(188, 'seo_company_map_name', '', 'yes'),
(189, 'seo_company_hours_monday', '', 'yes'),
(190, 'seo_company_hours_tuesday', '', 'yes'),
(191, 'seo_company_hours_wednesday', '', 'yes'),
(192, 'seo_company_hours_thursday', '', 'yes'),
(193, 'seo_company_hours_friday', '', 'yes'),
(194, 'seo_company_hours_saturday', '', 'yes'),
(195, 'seo_company_hours_sunday', '', 'yes'),
(196, 'seo_company_payment', '', 'yes'),
(197, 'seo_company_qr', '', 'yes'),
(198, 'seo_company_facebook', '', 'yes'),
(199, 'seo_company_twitter', '', 'yes'),
(200, 'seo_company_youtube', '', 'yes'),
(201, 'seo_company_linkedin', '', 'yes'),
(202, 'seo_company_googleplaces', '', 'yes'),
(203, 'seo_company_googleplus', '', 'yes'),
(204, 'seo_company_yelp', '', 'yes'),
(205, 'seo_company_merchantcircle', '', 'yes'),
(206, 'seo_company_hotfrog', '', 'yes'),
(207, 'seo_company_foursquare', '', 'yes'),
(208, 'seo_company_flickr', '', 'yes'),
(209, 'seo_company_digg', '', 'yes'),
(210, 'seo_company_tumblr', '', 'yes'),
(211, 'seo_company_stumbleupon', '', 'yes'),
(212, 'seo_company_delicious', '', 'yes'),
(221, 'rewrite_rules', 'a:108:{s:12:"ooco_news/?$";s:29:"index.php?post_type=ooco_news";s:42:"ooco_news/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?post_type=ooco_news&feed=$matches[1]";s:37:"ooco_news/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?post_type=ooco_news&feed=$matches[1]";s:29:"ooco_news/page/([0-9]{1,})/?$";s:47:"index.php?post_type=ooco_news&paged=$matches[1]";s:20:"ooco_testimonials/?$";s:37:"index.php?post_type=ooco_testimonials";s:50:"ooco_testimonials/feed/(feed|rdf|rss|rss2|atom)/?$";s:54:"index.php?post_type=ooco_testimonials&feed=$matches[1]";s:45:"ooco_testimonials/(feed|rdf|rss|rss2|atom)/?$";s:54:"index.php?post_type=ooco_testimonials&feed=$matches[1]";s:37:"ooco_testimonials/page/([0-9]{1,})/?$";s:55:"index.php?post_type=ooco_testimonials&paged=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:37:"ooco_news/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"ooco_news/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"ooco_news/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"ooco_news/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"ooco_news/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"ooco_news/([^/]+)/trackback/?$";s:36:"index.php?ooco_news=$matches[1]&tb=1";s:50:"ooco_news/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?ooco_news=$matches[1]&feed=$matches[2]";s:45:"ooco_news/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?ooco_news=$matches[1]&feed=$matches[2]";s:38:"ooco_news/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?ooco_news=$matches[1]&paged=$matches[2]";s:45:"ooco_news/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?ooco_news=$matches[1]&cpage=$matches[2]";s:30:"ooco_news/([^/]+)(/[0-9]+)?/?$";s:48:"index.php?ooco_news=$matches[1]&page=$matches[2]";s:26:"ooco_news/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"ooco_news/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"ooco_news/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"ooco_news/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"ooco_news/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:45:"ooco_testimonials/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"ooco_testimonials/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"ooco_testimonials/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"ooco_testimonials/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"ooco_testimonials/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"ooco_testimonials/([^/]+)/trackback/?$";s:44:"index.php?ooco_testimonials=$matches[1]&tb=1";s:58:"ooco_testimonials/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?ooco_testimonials=$matches[1]&feed=$matches[2]";s:53:"ooco_testimonials/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?ooco_testimonials=$matches[1]&feed=$matches[2]";s:46:"ooco_testimonials/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?ooco_testimonials=$matches[1]&paged=$matches[2]";s:53:"ooco_testimonials/([^/]+)/comment-page-([0-9]{1,})/?$";s:57:"index.php?ooco_testimonials=$matches[1]&cpage=$matches[2]";s:38:"ooco_testimonials/([^/]+)(/[0-9]+)?/?$";s:56:"index.php?ooco_testimonials=$matches[1]&page=$matches[2]";s:34:"ooco_testimonials/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"ooco_testimonials/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"ooco_testimonials/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"ooco_testimonials/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"ooco_testimonials/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:29:"comments/page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(214, 'testimonialswidget', 'a:1:{s:8:"migrated";b:1;}', 'no'),
(215, 'testimonialswidget_settings', 'a:35:{s:10:"char_limit";s:0:"";s:13:"hide_gravatar";i:1;s:10:"hide_email";i:1;s:6:"target";s:0:"";s:11:"bottom_text";s:0:"";s:6:"paging";s:1:"1";s:13:"remove_hentry";i:1;s:8:"category";s:0:"";s:4:"tags";s:0:"";s:3:"ids";s:0:"";s:7:"exclude";s:0:"";s:5:"limit";s:2:"10";s:7:"orderby";s:2:"ID";s:8:"meta_key";s:0:"";s:5:"order";s:4:"DESC";s:5:"title";s:12:"Testimonials";s:10:"title_link";s:0:"";s:10:"min_height";s:0:"";s:10:"max_height";s:0:"";s:16:"refresh_interval";s:1:"5";s:11:"has_archive";s:12:"testimonials";s:12:"rewrite_slug";s:11:"testimonial";s:14:"allow_comments";i:0;s:12:"hide_company";i:0;s:12:"hide_content";i:0;s:10:"hide_image";i:0;s:13:"hide_location";i:0;s:14:"hide_not_found";i:0;s:11:"hide_source";i:0;s:10:"hide_title";i:0;s:8:"hide_url";i:0;s:15:"keep_whitespace";i:0;s:6:"random";i:0;s:8:"tags_all";i:0;s:7:"version";s:5:"2.8.2";}', 'yes'),
(218, 'category_children', 'a:0:{}', 'yes'),
(219, 'catablog-options', 'a:22:{s:7:"version";s:5:"1.6.3";s:15:"thumbnail-width";i:100;s:16:"thumbnail-height";i:100;s:10:"image-size";i:600;s:16:"background-color";s:7:"#ffffff";s:17:"keep-aspect-ratio";b:0;s:16:"lightbox-enabled";b:0;s:19:"lightbox-navigation";b:0;s:15:"lightbox-render";b:0;s:17:"lightbox-selector";s:15:".catablog-image";s:11:"link-target";s:0:"";s:17:"link-relationship";s:0:"";s:18:"filter-description";b:0;s:17:"nl2br-description";b:1;s:14:"excerpt-length";i:55;s:12:"public_posts";b:0;s:16:"public_post_slug";s:14:"catablog-items";s:15:"public_tax_slug";s:14:"catablog-terms";s:14:"nav-prev-label";s:8:"Previous";s:14:"nav-next-label";s:4:"Next";s:12:"nav-location";s:6:"bottom";s:13:"nav-show-meta";b:1;}', 'yes'),
(220, 'eshop_plugin_settings', 'a:68:{s:15:"addtocart_image";s:0:"";s:10:"base_brand";s:0:"";s:14:"base_condition";s:0:"";s:11:"base_expiry";s:0:"";s:12:"base_payment";s:0:"";s:10:"base_ptype";s:0:"";s:8:"business";s:0:"";s:4:"cart";i:36;s:11:"cart_cancel";i:39;s:12:"cart_nostock";s:12:"Out of Stock";s:13:"cart_shipping";i:40;s:12:"cart_success";i:38;s:8:"checkout";i:37;s:7:"credits";s:2:"no";s:10:"cron_email";s:0:"";s:15:"currency_symbol";s:7:"&pound;";s:8:"currency";s:3:"GBP";s:17:"discount_shipping";s:0:"";s:15:"discount_spend1";s:0:"";s:15:"discount_value1";s:0:"";s:15:"discount_spend2";s:0:"";s:15:"discount_value2";s:0:"";s:15:"discount_spend3";s:0:"";s:15:"discount_value3";s:0:"";s:17:"downloads_hideall";s:2:"no";s:13:"downloads_num";s:1:"3";s:14:"downloads_only";s:2:"no";s:4:"etax";a:1:{i:0;s:0:"";}s:10:"first_time";s:2:"no";s:9:"fold_menu";s:2:"no";s:10:"from_email";s:0:"";s:12:"hide_addinfo";s:3:"yes";s:11:"hide_cartco";s:0:"";s:13:"hide_shipping";s:0:"";s:13:"image_in_cart";s:0:"";s:8:"location";s:14:"United Kingdom";s:6:"method";a:1:{i:0;s:6:"paypal";}s:11:"options_num";s:1:"3";s:14:"paypal_noemail";s:0:"";s:7:"records";s:2:"10";s:10:"search_img";s:2:"no";s:16:"set_cacheability";s:2:"no";s:14:"shipping_state";s:2:"AE";s:13:"shipping_zone";s:7:"country";s:8:"shipping";s:1:"1";s:14:"numb_shipzones";s:1:"5";s:9:"shop_page";s:0:"";s:14:"show_allstates";s:1:"0";s:14:"show_downloads";i:41;s:10:"show_forms";s:0:"";s:10:"show_zones";s:2:"no";s:6:"status";s:7:"testing";s:13:"stock_control";s:2:"no";s:5:"style";s:3:"yes";s:9:"sysemails";s:0:"";s:5:"tandc";s:0:"";s:8:"tandc_id";s:0:"";s:9:"tandc_use";s:0:"";s:13:"unknown_state";s:1:"5";s:7:"version";s:5:"6.3.9";s:14:"state_location";s:0:"";s:10:"tax_symbol";s:3:"VAT";s:4:"tax1";s:1:"0";s:4:"tax2";s:1:"0";s:4:"tax3";s:1:"0";s:10:"tax_method";s:1:"1";s:9:"xtra_help";s:0:"";s:12:"xtra_privacy";s:0:"";}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=265 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2, 4, '_edit_last', '1'),
(3, 4, '_wp_page_template', 'default'),
(4, 4, '_edit_lock', '1363261823:1'),
(5, 7, '_form', '<div class="formField">\n  <div class="columns one left">&nbsp;</div>\n  <div class="columns one left label"> Name </div>\n  <div class="clsFloatLeft columns eight left"> [text* name id:name] </div>\n  <div class="clear"></div>\n</div>\n<div class="formField">\n  <div class="columns one left">&nbsp;</div>\n  <div class="columns one left label"> Email </div>\n  <div class="columns eight left"> [email* email id:email] </div>\n  <div class="clear"></div>\n</div>\n<div class="formField">\n  <div class="columns one left">&nbsp;</div>\n  <div class="columns one left label"> Mobile </div>\n  <div class="columns eight left"> [text* mobile id:mobile] </div>\n  <div class="clear"></div>\n</div>\n<div class="formField">\n  <div class="columns one left">&nbsp;</div>\n  <div class="columns one left label"> Message </div>\n  <div class="columns eight left"> [textarea message id:message] </div>\n  <div class="clear"></div>\n</div>\n<div class="formField">\n  <div class="columns one left">&nbsp;</div>\n  <div class="columns one left label">&nbsp;</div>\n  <div class="columns eight left">\n    <p class="clsFloatRight"> [submit id:contactFrmSubBtn "Send"] </p>\n    <div class="clear"></div>\n  </div>\n  <div class="clear"></div>\n</div>'),
(6, 7, '_mail', 'a:7:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:26:"[your-name] <[your-email]>";s:4:"body";s:207:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis mail is sent via contact form on OCOO || The Beauty Drink http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms";s:9:"recipient";s:20:"karthik@hgwmedia.com";s:18:"additional_headers";s:0:"";s:11:"attachments";s:0:"";s:8:"use_html";b:0;}'),
(7, 7, '_mail_2', 'a:8:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:26:"[your-name] <[your-email]>";s:4:"body";s:149:"Message body:\n[your-message]\n\n--\nThis mail is sent via contact form on OCOO || The Beauty Drink http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:0:"";s:11:"attachments";s:0:"";s:8:"use_html";b:0;}'),
(8, 7, '_messages', 'a:13:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:13:"invalid_email";s:28:"Email address seems invalid.";s:16:"invalid_required";s:31:"Please fill the required field.";s:17:"captcha_not_match";s:31:"Your entered code is incorrect.";s:13:"upload_failed";s:22:"Failed to upload file.";s:24:"upload_file_type_invalid";s:30:"This file type is not allowed.";s:21:"upload_file_too_large";s:23:"This file is too large.";s:23:"upload_failed_php_error";s:38:"Failed to upload file. Error occurred.";s:23:"quiz_answer_not_correct";s:27:"Your answer is not correct.";}'),
(9, 7, '_additional_settings', ''),
(10, 8, '_edit_last', '1'),
(11, 8, '_edit_lock', '1363497702:1'),
(12, 8, '_wp_page_template', 'contact.php'),
(16, 14, '_edit_lock', '1363504157:1'),
(15, 14, '_edit_last', '1'),
(17, 14, '_wp_page_template', 'blog_comming_soon.php'),
(18, 20, 'ooco_testimonial_author', ''),
(19, 21, 'ooco_testimonial_author', ''),
(20, 22, 'ooco_testimonial_author', ''),
(21, 23, 'ooco_testimonial_author', ''),
(22, 24, 'ooco_testimonial_author', ''),
(23, 25, 'ooco_testimonial_author', ''),
(24, 26, 'ooco_testimonial_author', 'Salama Al Hoseini'),
(25, 26, '_edit_last', '1'),
(26, 26, '_edit_lock', '1363506805:1'),
(27, 27, 'ooco_testimonial_author', 'Person X'),
(28, 27, '_edit_last', '1'),
(29, 27, '_edit_lock', '1363506801:1'),
(30, 28, 'ooco_testimonial_author', 'Person Y'),
(31, 28, '_edit_last', '1'),
(32, 28, '_edit_lock', '1363506797:1'),
(33, 28, 'ooco_testimonial_author_age', ' 50'),
(34, 27, 'ooco_testimonial_author_age', '34'),
(35, 26, 'ooco_testimonial_author_age', '31'),
(36, 29, 'ooco_testimonial_author', ''),
(37, 29, 'ooco_testimonial_author_age', ''),
(38, 29, '_edit_last', '1'),
(39, 29, '_edit_lock', '1363507685:1'),
(40, 29, '_wp_page_template', 'testimonials_press.php'),
(41, 31, 'ooco_testimonial_author', ''),
(42, 31, 'ooco_testimonial_author_age', ''),
(43, 32, 'ooco_testimonial_author', ''),
(44, 32, 'ooco_testimonial_author_age', ''),
(45, 33, 'ooco_testimonial_author', ''),
(46, 33, 'ooco_testimonial_author_age', ''),
(47, 33, '_edit_last', '1'),
(48, 33, '_edit_lock', '1363509642:1'),
(49, 34, '_wp_attached_file', '2013/03/press_news.png'),
(50, 34, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:501;s:6:"height";i:169;s:4:"file";s:22:"2013/03/press_news.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"press_news-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:22:"press_news-300x101.png";s:5:"width";i:300;s:6:"height";i:101;s:9:"mime-type";s:9:"image/png";}s:14:"post_thumbnail";a:4:{s:4:"file";s:22:"press_news-472x169.png";s:5:"width";i:472;s:6:"height";i:169;s:9:"mime-type";s:9:"image/png";}s:19:"home_post_thumbnail";a:4:{s:4:"file";s:22:"press_news-193x138.png";s:5:"width";i:193;s:6:"height";i:138;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(51, 36, 'ooco_testimonial_author', ''),
(52, 36, 'ooco_testimonial_author_age', ''),
(53, 37, 'ooco_testimonial_author', ''),
(54, 37, 'ooco_testimonial_author_age', ''),
(55, 38, 'ooco_testimonial_author', ''),
(56, 38, 'ooco_testimonial_author_age', ''),
(57, 39, 'ooco_testimonial_author', ''),
(58, 39, 'ooco_testimonial_author_age', ''),
(59, 40, 'ooco_testimonial_author', ''),
(60, 40, 'ooco_testimonial_author_age', ''),
(61, 41, 'ooco_testimonial_author', ''),
(62, 41, 'ooco_testimonial_author_age', ''),
(63, 42, 'ooco_testimonial_author', ''),
(64, 42, 'ooco_testimonial_author_age', ''),
(65, 43, 'ooco_testimonial_author', ''),
(66, 43, 'ooco_testimonial_author_age', ''),
(67, 44, 'ooco_testimonial_author', ''),
(68, 44, 'ooco_testimonial_author_age', ''),
(69, 45, 'ooco_testimonial_author', ''),
(70, 45, 'ooco_testimonial_author_age', ''),
(71, 46, 'ooco_testimonial_author', ''),
(72, 46, 'ooco_testimonial_author_age', ''),
(73, 47, 'ooco_testimonial_author', ''),
(74, 47, 'ooco_testimonial_author_age', ''),
(75, 48, 'ooco_testimonial_author', ''),
(76, 48, 'ooco_testimonial_author_age', ''),
(77, 49, 'ooco_testimonial_author', ''),
(78, 49, 'ooco_testimonial_author_age', ''),
(79, 50, 'ooco_testimonial_author', ''),
(80, 50, 'ooco_testimonial_author_age', ''),
(81, 51, 'ooco_testimonial_author', ''),
(82, 51, 'ooco_testimonial_author_age', ''),
(83, 52, 'ooco_testimonial_author', ''),
(84, 52, 'ooco_testimonial_author_age', ''),
(85, 53, 'ooco_testimonial_author', ''),
(86, 53, 'ooco_testimonial_author_age', ''),
(87, 54, 'ooco_testimonial_author', ''),
(88, 54, 'ooco_testimonial_author_age', ''),
(89, 55, 'ooco_testimonial_author', ''),
(90, 55, 'ooco_testimonial_author_age', ''),
(91, 56, 'ooco_testimonial_author', ''),
(92, 56, 'ooco_testimonial_author_age', ''),
(93, 57, 'ooco_testimonial_author', ''),
(94, 57, 'ooco_testimonial_author_age', ''),
(95, 58, 'ooco_testimonial_author', ''),
(96, 58, 'ooco_testimonial_author_age', ''),
(97, 59, 'ooco_testimonial_author', ''),
(98, 59, 'ooco_testimonial_author_age', ''),
(99, 60, 'ooco_testimonial_author', ''),
(100, 60, 'ooco_testimonial_author_age', ''),
(101, 61, 'ooco_testimonial_author', ''),
(102, 61, 'ooco_testimonial_author_age', ''),
(103, 62, 'ooco_testimonial_author', ''),
(104, 62, 'ooco_testimonial_author_age', ''),
(105, 63, 'ooco_testimonial_author', ''),
(106, 63, 'ooco_testimonial_author_age', ''),
(107, 63, '_edit_last', '1'),
(108, 63, '_edit_lock', '1363516969:1'),
(109, 64, '_wp_attached_file', '2013/03/1bottles.png'),
(110, 64, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:377;s:6:"height";i:356;s:4:"file";s:20:"2013/03/1bottles.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"1bottles-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:20:"1bottles-300x283.png";s:5:"width";i:300;s:6:"height";i:283;s:9:"mime-type";s:9:"image/png";}s:14:"post_thumbnail";a:4:{s:4:"file";s:20:"1bottles-377x280.png";s:5:"width";i:377;s:6:"height";i:280;s:9:"mime-type";s:9:"image/png";}s:19:"home_post_thumbnail";a:4:{s:4:"file";s:20:"1bottles-193x138.png";s:5:"width";i:193;s:6:"height";i:138;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(111, 63, '_thumbnail_id', '64'),
(112, 65, 'ooco_testimonial_author', ''),
(113, 65, 'ooco_testimonial_author_age', ''),
(114, 65, '_edit_last', '1'),
(115, 65, '_edit_lock', '1363516957:1'),
(116, 66, '_wp_attached_file', '2013/03/4bottles.png'),
(117, 66, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:377;s:6:"height";i:356;s:4:"file";s:20:"2013/03/4bottles.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"4bottles-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:20:"4bottles-300x283.png";s:5:"width";i:300;s:6:"height";i:283;s:9:"mime-type";s:9:"image/png";}s:14:"post_thumbnail";a:4:{s:4:"file";s:20:"4bottles-377x280.png";s:5:"width";i:377;s:6:"height";i:280;s:9:"mime-type";s:9:"image/png";}s:19:"home_post_thumbnail";a:4:{s:4:"file";s:20:"4bottles-193x138.png";s:5:"width";i:193;s:6:"height";i:138;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(118, 65, '_thumbnail_id', '66'),
(119, 67, 'ooco_testimonial_author', ''),
(120, 67, 'ooco_testimonial_author_age', ''),
(121, 67, '_edit_last', '1'),
(122, 67, '_edit_lock', '1363516938:1'),
(123, 68, '_wp_attached_file', '2013/03/7bottles.png'),
(124, 68, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:377;s:6:"height";i:356;s:4:"file";s:20:"2013/03/7bottles.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"7bottles-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:20:"7bottles-300x283.png";s:5:"width";i:300;s:6:"height";i:283;s:9:"mime-type";s:9:"image/png";}s:14:"post_thumbnail";a:4:{s:4:"file";s:20:"7bottles-377x280.png";s:5:"width";i:377;s:6:"height";i:280;s:9:"mime-type";s:9:"image/png";}s:19:"home_post_thumbnail";a:4:{s:4:"file";s:20:"7bottles-193x138.png";s:5:"width";i:193;s:6:"height";i:138;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(125, 67, '_thumbnail_id', '68'),
(126, 69, 'ooco_testimonial_author', ''),
(127, 69, 'ooco_testimonial_author_age', ''),
(128, 69, '_edit_last', '1'),
(129, 69, '_edit_lock', '1363516920:1'),
(130, 70, '_wp_attached_file', '2013/03/30bottles.png'),
(131, 70, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:377;s:6:"height";i:356;s:4:"file";s:21:"2013/03/30bottles.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"30bottles-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"30bottles-300x283.png";s:5:"width";i:300;s:6:"height";i:283;s:9:"mime-type";s:9:"image/png";}s:14:"post_thumbnail";a:4:{s:4:"file";s:21:"30bottles-377x280.png";s:5:"width";i:377;s:6:"height";i:280;s:9:"mime-type";s:9:"image/png";}s:19:"home_post_thumbnail";a:4:{s:4:"file";s:21:"30bottles-193x138.png";s:5:"width";i:193;s:6:"height";i:138;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(132, 69, '_thumbnail_id', '70'),
(133, 71, 'ooco_testimonial_author', ''),
(134, 71, 'ooco_testimonial_author_age', ''),
(135, 72, 'ooco_testimonial_author', ''),
(136, 72, 'ooco_testimonial_author_age', ''),
(137, 73, 'ooco_testimonial_author', ''),
(138, 73, 'ooco_testimonial_author_age', ''),
(139, 74, 'ooco_testimonial_author', ''),
(140, 74, 'ooco_testimonial_author_age', ''),
(141, 69, 'ooco_product_detail_qty', '10'),
(143, 69, 'ooco_product_detail_price', '120'),
(142, 69, 'ooco_product_detail_no_bottles', '30'),
(144, 67, 'ooco_product_detail_qty', '10'),
(145, 67, 'ooco_product_detail_price', '120'),
(146, 67, 'ooco_product_detail_no_bottles', '7'),
(147, 65, 'ooco_product_detail_qty', '10'),
(148, 65, 'ooco_product_detail_price', '150'),
(149, 65, 'ooco_product_detail_no_bottles', '4'),
(150, 63, 'ooco_product_detail_qty', '10'),
(151, 63, 'ooco_product_detail_price', '30'),
(152, 63, 'ooco_product_detail_no_bottles', '1'),
(153, 36, '_edit_lock', '1363517117:1'),
(154, 38, '_edit_lock', '1363517130:1'),
(155, 4, '_wp_trash_meta_status', 'publish'),
(156, 4, '_wp_trash_meta_time', '1363517259'),
(157, 4, 'ooco_product_detail_qty', ''),
(158, 4, 'ooco_product_detail_price', ''),
(159, 4, 'ooco_product_detail_no_bottles', ''),
(160, 4, 'ooco_testimonial_author', ''),
(161, 4, 'ooco_testimonial_author_age', ''),
(162, 40, '_wp_trash_meta_status', 'publish'),
(163, 40, '_wp_trash_meta_time', '1363517259'),
(164, 40, 'ooco_product_detail_qty', ''),
(165, 40, 'ooco_product_detail_price', ''),
(166, 40, 'ooco_product_detail_no_bottles', ''),
(167, 36, '_wp_trash_meta_status', 'publish'),
(168, 36, '_wp_trash_meta_time', '1363517259'),
(169, 36, 'ooco_product_detail_qty', ''),
(170, 36, 'ooco_product_detail_price', ''),
(171, 36, 'ooco_product_detail_no_bottles', ''),
(172, 39, '_wp_trash_meta_status', 'publish'),
(173, 39, '_wp_trash_meta_time', '1363517259'),
(174, 39, 'ooco_product_detail_qty', ''),
(175, 39, 'ooco_product_detail_price', ''),
(176, 39, 'ooco_product_detail_no_bottles', ''),
(177, 37, '_wp_trash_meta_status', 'publish'),
(178, 37, '_wp_trash_meta_time', '1363517259'),
(179, 37, 'ooco_product_detail_qty', ''),
(180, 37, 'ooco_product_detail_price', ''),
(181, 37, 'ooco_product_detail_no_bottles', ''),
(182, 38, '_wp_trash_meta_status', 'publish'),
(183, 38, '_wp_trash_meta_time', '1363517259'),
(184, 38, 'ooco_product_detail_qty', ''),
(185, 38, 'ooco_product_detail_price', ''),
(186, 38, 'ooco_product_detail_no_bottles', ''),
(187, 81, 'ooco_product_detail_qty', ''),
(188, 81, 'ooco_product_detail_price', ''),
(189, 81, 'ooco_product_detail_no_bottles', ''),
(190, 81, 'ooco_testimonial_author', ''),
(191, 81, 'ooco_testimonial_author_age', ''),
(192, 81, '_edit_last', '1'),
(193, 81, '_edit_lock', '1363520743:1'),
(194, 81, '_wp_page_template', 'ooco_about_us.php'),
(195, 83, 'ooco_product_detail_qty', ''),
(196, 83, 'ooco_product_detail_price', ''),
(197, 83, 'ooco_product_detail_no_bottles', ''),
(198, 83, 'ooco_testimonial_author', ''),
(199, 83, 'ooco_testimonial_author_age', ''),
(200, 83, '_edit_last', '1'),
(201, 83, '_edit_lock', '1363522786:1'),
(202, 83, '_wp_page_template', 'shop_cart.php'),
(203, 85, 'ooco_product_detail_qty', ''),
(204, 85, 'ooco_product_detail_price', ''),
(205, 85, 'ooco_product_detail_no_bottles', ''),
(206, 85, 'ooco_testimonial_author', ''),
(207, 85, 'ooco_testimonial_author_age', ''),
(208, 86, 'ooco_product_detail_qty', ''),
(209, 86, 'ooco_product_detail_price', ''),
(210, 86, 'ooco_product_detail_no_bottles', ''),
(211, 86, 'ooco_testimonial_author', ''),
(212, 86, 'ooco_testimonial_author_age', ''),
(213, 87, 'ooco_product_detail_qty', ''),
(214, 87, 'ooco_product_detail_price', ''),
(215, 87, 'ooco_product_detail_no_bottles', ''),
(216, 87, 'ooco_testimonial_author', ''),
(217, 87, 'ooco_testimonial_author_age', ''),
(218, 88, 'ooco_product_detail_qty', ''),
(219, 88, 'ooco_product_detail_price', ''),
(220, 88, 'ooco_product_detail_no_bottles', ''),
(221, 88, 'ooco_testimonial_author', ''),
(222, 88, 'ooco_testimonial_author_age', ''),
(223, 88, '_edit_last', '1'),
(224, 88, '_edit_lock', '1363522923:1'),
(225, 88, '_wp_page_template', 'cartLogin.php'),
(226, 90, 'ooco_product_detail_qty', ''),
(227, 90, 'ooco_product_detail_price', ''),
(228, 90, 'ooco_product_detail_no_bottles', ''),
(229, 90, 'ooco_testimonial_author', ''),
(230, 90, 'ooco_testimonial_author_age', ''),
(231, 90, '_edit_last', '1'),
(232, 90, '_edit_lock', '1363522945:1'),
(233, 90, '_wp_page_template', 'cartRegister.php'),
(234, 92, 'ooco_product_detail_qty', ''),
(235, 92, 'ooco_product_detail_price', ''),
(236, 92, 'ooco_product_detail_no_bottles', ''),
(237, 92, 'ooco_testimonial_author', ''),
(238, 92, 'ooco_testimonial_author_age', ''),
(239, 92, '_form', '<div class="formField">\n  <div class="columns one left">&nbsp;</div>\n  <div class="columns one left label">Name</div>\n  <div class="clsFloatLeft columns eight left">\n     [text* your-name] \n  </div>\n  <div class="clear"></div>\n</div>\n<div class="formField">\n  <div class="columns one left">&nbsp;</div>\n  <div class="columns one left label">Email</div>\n  <div class="columns eight left">\n     [email* your-email] \n  </div>\n  <div class="clear"></div>\n</div>\n<div class="formField">\n  <div class="columns one left">&nbsp;</div>\n  <div class="columns one left label">&nbsp;</div>\n  <div class="columns eight left">\n    <p class="clsFloatRight">\n      [submit id:newsLetterSubBtn "SUBSCRIBE"]\n    </p>\n    <div class="clear"></div>\n  </div>\n  <div class="clear"></div>\n</div>'),
(240, 92, '_mail', 'a:7:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:26:"[your-name] <[your-email]>";s:4:"body";s:207:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis mail is sent via contact form on OCOO || The Beauty Drink http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms";s:9:"recipient";s:20:"karthik@hgwmedia.com";s:18:"additional_headers";s:0:"";s:11:"attachments";s:0:"";s:8:"use_html";b:0;}'),
(241, 92, '_mail_2', 'a:8:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:26:"[your-name] <[your-email]>";s:4:"body";s:149:"Message body:\n[your-message]\n\n--\nThis mail is sent via contact form on OCOO || The Beauty Drink http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:0:"";s:11:"attachments";s:0:"";s:8:"use_html";b:0;}'),
(242, 92, '_messages', 'a:13:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:13:"invalid_email";s:28:"Email address seems invalid.";s:16:"invalid_required";s:31:"Please fill the required field.";s:17:"captcha_not_match";s:31:"Your entered code is incorrect.";s:13:"upload_failed";s:22:"Failed to upload file.";s:24:"upload_file_type_invalid";s:30:"This file type is not allowed.";s:21:"upload_file_too_large";s:23:"This file is too large.";s:23:"upload_failed_php_error";s:38:"Failed to upload file. Error occurred.";s:23:"quiz_answer_not_correct";s:27:"Your answer is not correct.";}'),
(243, 92, '_additional_settings', ''),
(244, 93, 'ooco_product_detail_qty', ''),
(245, 93, 'ooco_product_detail_price', ''),
(246, 93, 'ooco_product_detail_no_bottles', ''),
(247, 93, 'ooco_testimonial_author', ''),
(248, 93, 'ooco_testimonial_author_age', ''),
(249, 93, '_edit_last', '1'),
(250, 93, '_edit_lock', '1363528262:1'),
(251, 93, '_wp_page_template', 'ooco_news_letter.php'),
(252, 97, 'ooco_product_detail_qty', ''),
(253, 97, 'ooco_product_detail_price', ''),
(254, 97, 'ooco_product_detail_no_bottles', ''),
(255, 97, 'ooco_testimonial_author', ''),
(256, 97, 'ooco_testimonial_author_age', ''),
(257, 98, 'ooco_product_detail_qty', ''),
(258, 98, 'ooco_product_detail_price', ''),
(259, 98, 'ooco_product_detail_no_bottles', ''),
(260, 98, 'ooco_testimonial_author', ''),
(261, 98, 'ooco_testimonial_author_age', ''),
(262, 98, '_edit_last', '1'),
(263, 98, '_wp_page_template', 'shop_view_cart.php'),
(264, 98, '_edit_lock', '1363614980:1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2013-03-14 09:54:04', '2013-03-14 09:54:04', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2013-03-14 09:54:04', '2013-03-14 09:54:04', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?p=1', 0, 'post', '', 1),
(13, 1, '2013-03-14 12:13:46', '2013-03-14 12:13:46', '[contact-form-7 id="7" title="Contact form"]', 'Contact Us', '', 'inherit', 'open', 'open', '', '8-revision-3', '', '', '2013-03-14 12:13:46', '2013-03-14 12:13:46', '', 8, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?p=13', 0, 'revision', '', 0),
(15, 1, '2013-03-17 07:10:53', '2013-03-17 07:10:53', '', 'Blog', '', 'inherit', 'open', 'open', '', '14-revision', '', '', '2013-03-17 07:10:53', '2013-03-17 07:10:53', '', 14, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/14-revision/', 0, 'revision', '', 0),
(16, 1, '2013-03-17 07:10:59', '2013-03-17 07:10:59', '', 'Blog', '', 'inherit', 'open', 'open', '', '14-revision-2', '', '', '2013-03-17 07:10:59', '2013-03-17 07:10:59', '', 14, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/14-revision-2/', 0, 'revision', '', 0),
(17, 1, '2013-03-17 07:24:11', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 07:24:11', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=testimonials-widget&p=17', 0, 'testimonials-widget', '', 0),
(18, 1, '2013-03-17 07:24:31', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 07:24:31', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=testimonials-widget&p=18', 0, 'testimonials-widget', '', 0),
(3, 1, '2013-03-14 10:29:09', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-14 10:29:09', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?p=3', 0, 'post', '', 0),
(4, 1, '2013-03-14 11:46:42', '2013-03-14 11:46:42', '[vfb id=1]', 'sample_form', '', 'trash', 'open', 'open', '', '4-2', '', '', '2013-03-17 10:47:39', '2013-03-17 10:47:39', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=4', 0, 'page', '', 0),
(5, 1, '2013-03-14 11:49:16', '2013-03-14 11:49:16', '[vfb id=1]', '', '', 'inherit', 'open', 'open', '', '4-autosave', '', '', '2013-03-14 11:49:16', '2013-03-14 11:49:16', '', 4, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?p=5', 0, 'revision', '', 0),
(6, 1, '2013-03-14 11:46:42', '2013-03-14 11:46:42', '[vfb id=1]', '', '', 'inherit', 'open', 'open', '', '4-revision', '', '', '2013-03-14 11:46:42', '2013-03-14 11:46:42', '', 4, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?p=6', 0, 'revision', '', 0),
(7, 1, '2013-03-14 12:04:42', '2013-03-14 12:04:42', '<div class="formField">\r\n  <div class="columns one left">&nbsp;</div>\r\n  <div class="columns one left label"> Name </div>\r\n  <div class="clsFloatLeft columns eight left"> [text* name id:name] </div>\r\n  <div class="clear"></div>\r\n</div>\r\n<div class="formField">\r\n  <div class="columns one left">&nbsp;</div>\r\n  <div class="columns one left label"> Email </div>\r\n  <div class="columns eight left"> [email* email id:email] </div>\r\n  <div class="clear"></div>\r\n</div>\r\n<div class="formField">\r\n  <div class="columns one left">&nbsp;</div>\r\n  <div class="columns one left label"> Mobile </div>\r\n  <div class="columns eight left"> [text* mobile id:mobile] </div>\r\n  <div class="clear"></div>\r\n</div>\r\n<div class="formField">\r\n  <div class="columns one left">&nbsp;</div>\r\n  <div class="columns one left label"> Message </div>\r\n  <div class="columns eight left"> [textarea message id:message] </div>\r\n  <div class="clear"></div>\r\n</div>\r\n<div class="formField">\r\n  <div class="columns one left">&nbsp;</div>\r\n  <div class="columns one left label">&nbsp;</div>\r\n  <div class="columns eight left">\r\n    <p class="clsFloatRight"> [submit id:contactFrmSubBtn "Send"] </p>\r\n    <div class="clear"></div>\r\n  </div>\r\n  <div class="clear"></div>\r\n</div>\n[your-subject]\n[your-name] <[your-email]>\nFrom: [your-name] <[your-email]>\r\nSubject: [your-subject]\r\n\r\nMessage Body:\r\n[your-message]\r\n\r\n--\r\nThis mail is sent via contact form on OCOO || The Beauty Drink http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms\nkarthik@hgwmedia.com\n\n\n\n\n[your-subject]\n[your-name] <[your-email]>\nMessage body:\r\n[your-message]\r\n\r\n--\r\nThis mail is sent via contact form on OCOO || The Beauty Drink http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms\n[your-email]\n\n\n\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nEmail address seems invalid.\nPlease fill the required field.\nYour entered code is incorrect.\nFailed to upload file.\nThis file type is not allowed.\nThis file is too large.\nFailed to upload file. Error occurred.\nYour answer is not correct.', 'Contact form', '', 'publish', 'open', 'open', '', 'contact-form-1', '', '', '2013-03-14 12:12:47', '2013-03-14 12:12:47', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=wpcf7_contact_form&#038;p=7', 0, 'wpcf7_contact_form', '', 0),
(8, 1, '2013-03-14 12:13:28', '2013-03-14 12:13:28', '', 'Contact Us', '', 'publish', 'open', 'open', '', 'contact-us', '', '', '2013-03-17 05:23:23', '2013-03-17 05:23:23', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=8', 0, 'page', '', 0),
(9, 1, '2013-03-14 12:13:24', '2013-03-14 12:13:24', '', 'Contact Us', '', 'inherit', 'open', 'open', '', '8-revision', '', '', '2013-03-14 12:13:24', '2013-03-14 12:13:24', '', 8, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?p=9', 0, 'revision', '', 0),
(14, 1, '2013-03-17 07:10:59', '2013-03-17 07:10:59', '', 'Blog', '', 'publish', 'open', 'open', '', 'blog', '', '', '2013-03-17 07:11:03', '2013-03-17 07:11:03', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=14', 0, 'page', '', 0),
(10, 1, '2013-03-14 12:13:28', '2013-03-14 12:13:28', '[contact-form-7 id="7" title="Contact form"]', 'Contact Us', '', 'inherit', 'open', 'open', '', '8-revision-2', '', '', '2013-03-14 12:13:28', '2013-03-14 12:13:28', '', 8, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?p=10', 0, 'revision', '', 0),
(11, 1, '2013-03-14 12:14:47', '2013-03-14 12:14:47', '[contact-form-7 id="7" title="Contact form"]', 'Contact Us', '', 'inherit', 'open', 'open', '', '8-autosave', '', '', '2013-03-14 12:14:47', '2013-03-14 12:14:47', '', 8, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?p=11', 0, 'revision', '', 0),
(19, 1, '2013-03-17 07:25:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 07:25:53', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=testimonials-widget&p=19', 0, 'testimonials-widget', '', 0),
(20, 1, '2013-03-17 07:41:00', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 07:41:00', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_testimonials&p=20', 0, 'ooco_testimonials', '', 0),
(21, 1, '2013-03-17 07:41:48', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 07:41:48', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_testimonials&p=21', 0, 'ooco_testimonials', '', 0),
(22, 1, '2013-03-17 07:42:14', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 07:42:14', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_testimonials&p=22', 0, 'ooco_testimonials', '', 0),
(23, 1, '2013-03-17 07:43:38', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 07:43:38', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_testimonials&p=23', 0, 'ooco_testimonials', '', 0),
(24, 1, '2013-03-17 07:44:23', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 07:44:23', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_testimonials&p=24', 0, 'ooco_testimonials', '', 0),
(25, 1, '2013-03-17 07:44:28', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 07:44:28', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=25', 0, 'page', '', 0),
(26, 1, '2013-03-17 07:45:03', '2013-03-17 07:45:03', 'Mauris ut sem nisi. Sed venenatis purus vel enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In sed nunc ut nibh suscipit imperdiet. Curabitur faucibus diam sit amet mi eleifend vitae aliquet mauris fermentum.', 'A Bottle a Day', '', 'publish', 'closed', 'closed', '', 'a-bottle-a-day', '', '', '2013-03-17 07:55:07', '2013-03-17 07:55:07', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_testimonials&#038;p=26', 0, 'ooco_testimonials', '', 0),
(27, 1, '2013-03-17 07:51:27', '2013-03-17 07:51:27', 'Mauris ut sem nisi. Sed venenatis purus vel enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primiset mi eleifend vitae aliquet mauris fermentum.', 'Testimonialn 2', '', 'publish', 'closed', 'closed', '', 'testimonialn-2', '', '', '2013-03-17 07:54:55', '2013-03-17 07:54:55', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_testimonials&#038;p=27', 0, 'ooco_testimonials', '', 0),
(28, 1, '2013-03-17 07:51:59', '2013-03-17 07:51:59', 'Mauris ut sem nisi. Sed venenatis purus vel enim euismod ultrices. Sed ac egestas lorem. Vestibulum an faucibus orci luctus et ultrices posuere cubilia Curae; In sed nunc ut nibh suscipit imperdiet. Curabitur faucibus diam sit amet mi eleifend vitae aliquet mauris fermentum.', 'Testimonial 3', '', 'publish', 'closed', 'closed', '', 'testimonial-3', '', '', '2013-03-17 07:54:38', '2013-03-17 07:54:38', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_testimonials&#038;p=28', 0, 'ooco_testimonials', '', 0),
(29, 1, '2013-03-17 08:08:56', '2013-03-17 08:08:56', '', 'feature', '', 'publish', 'open', 'open', '', 'feature', '', '', '2013-03-17 08:08:56', '2013-03-17 08:08:56', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=29', 0, 'page', '', 0),
(30, 1, '2013-03-17 08:08:51', '2013-03-17 08:08:51', '', 'feature', '', 'inherit', 'open', 'open', '', '29-revision', '', '', '2013-03-17 08:08:51', '2013-03-17 08:08:51', '', 29, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/29-revision/', 0, 'revision', '', 0),
(31, 1, '2013-03-17 08:19:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 08:19:53', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_news&p=31', 0, 'ooco_news', '', 0),
(32, 1, '2013-03-17 08:20:07', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 08:20:07', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_news&p=32', 0, 'ooco_news', '', 0),
(33, 1, '2013-03-17 08:22:01', '2013-03-17 08:22:01', 'Mauris ut sem nisi. Sed venenatis purus vel enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In sed nunc ut nibh suscipit imperdiet. Curabitur faucibus diam sit amet mi eleifend vitae aliquet mauris fermentum. Cras ac commodo libero. Maecenas consectetur elit in quam fermentum viverra. Fusce euismod volutpat metus, et faucibus leo elementum eu. Vivamus tempor, mauris non fermentum vestibulum, nunc massa pharetra urna, non condimentum quam libero at velit. Aliquam eros felis, molestie a imperdiet nec, aliquam at purus. Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. Vivamus sollicitudin lacus sed leo volutpat vel feugiat sapien mollis. Vivamus quis laoreet\r\n\r\n<img class="alignnone size-full wp-image-34" alt="press_news" src="http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/wp-content/uploads/2013/03/press_news.png" width="501" height="169" />\r\n\r\nMauris ut sem nisi. Sed venenatis purus vel enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In sed nunc ut nibh suscipit imperdiet. Curabitur faucibus diam sit amet mi eleifend vitae aliquet mauris fermentum. Cras ac commodo libero. Maecenas consectetur elit in quam fermentum viverra. Fusce euismod volutpat metus, et faucibus leo elementum eu. Vivamus tempor, mauris non fermentum vestibulum, nunc massa pharetra urna, non condimentum quam libero at velit. Aliquam eros felis, molestie a imperdiet nec, aliquam at purus. Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. Vivamus sollicitudin lacus sed leo volutpat vel feugiat sapien mollis. Vivamus quis laoreet', 'OCÓO LAUNCHES IN THE GALERIES LAFAYETTE - DUBAI MALL', '', 'publish', 'closed', 'closed', '', 'ocoo-launches-in-the-galeries-lafayette-dubai-mall', '', '', '2013-03-17 08:29:36', '2013-03-17 08:29:36', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_news&#038;p=33', 0, 'ooco_news', '', 0),
(34, 1, '2013-03-17 08:21:34', '2013-03-17 08:21:34', '', 'press_news', '', 'inherit', 'open', 'open', '', 'press_news', '', '', '2013-03-17 08:21:34', '2013-03-17 08:21:34', '', 33, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/wp-content/uploads/2013/03/press_news.png', 0, 'attachment', 'image/png', 0),
(35, 1, '2013-03-17 08:29:04', '2013-03-17 08:29:04', 'Mauris ut sem nisi. Sed venenatis purus vel enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In sed nunc ut nibh suscipit imperdiet. Curabitur faucibus diam sit amet mi eleifend vitae aliquet mauris fermentum. Cras ac commodo libero. Maecenas consectetur elit in quam fermentum viverra. Fusce euismod volutpat metus, et faucibus leo elementum eu. Vivamus tempor, mauris non fermentum vestibulum, nunc massa pharetra urna, non condimentum quam libero at velit. Aliquam eros felis, molestie a imperdiet nec, aliquam at purus. Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. Vivamus sollicitudin lacus sed leo volutpat vel feugiat sapien mollis. Vivamus quis laoreet\n\n<img class="alignnone size-full wp-image-34" alt="press_news" src="http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/wp-content/uploads/2013/03/press_news.png" width="501" height="169" />\n\n&nbsp;\n\nMauris ut sem nisi. Sed venenatis purus vel enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In sed nunc ut nibh suscipit imperdiet. Curabitur faucibus diam sit amet mi eleifend vitae aliquet mauris fermentum. Cras ac commodo libero. Maecenas consectetur elit in quam fermentum viverra. Fusce euismod volutpat metus, et faucibus leo elementum eu. Vivamus tempor, mauris non fermentum vestibulum, nunc massa pharetra urna, non condimentum quam libero at velit. Aliquam eros felis, molestie a imperdiet nec, aliquam at purus. Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. Vivamus sollicitudin lacus sed leo volutpat vel feugiat sapien mollis. Vivamus quis laoreet', 'OCÓO LAUNCHES IN THE GALERIES LAFAYETTE - DUBAI MALL', '', 'inherit', 'open', 'open', '', '33-autosave', '', '', '2013-03-17 08:29:04', '2013-03-17 08:29:04', '', 33, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/33-autosave/', 0, 'revision', '', 0),
(36, 1, '2013-03-17 09:52:21', '2013-03-17 09:52:21', '[eshop_show_cart]', 'Shopping Cart', '', 'trash', 'closed', 'closed', '', 'shopping-cart', '', '', '2013-03-17 10:47:39', '2013-03-17 10:47:39', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/shopping-cart/', 0, 'page', '', 0),
(37, 1, '2013-03-17 09:52:21', '2013-03-17 09:52:21', '[eshop_show_checkout]', 'Checkout', '', 'trash', 'closed', 'closed', '', 'checkout', '', '', '2013-03-17 10:47:39', '2013-03-17 10:47:39', '', 36, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/shopping-cart/checkout/', 0, 'page', '', 0),
(38, 1, '2013-03-17 09:52:21', '2013-03-17 09:52:21', '[eshop_show_success]', 'Thank You for your order', '', 'trash', 'closed', 'closed', '', 'thank-you', '', '', '2013-03-17 10:47:39', '2013-03-17 10:47:39', '', 36, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/shopping-cart/thank-you/', 0, 'page', '', 0),
(39, 1, '2013-03-17 09:52:21', '2013-03-17 09:52:21', '[eshop_show_cancel]', 'Cancelled Order', '', 'trash', 'closed', 'closed', '', 'cancelled-order', '', '', '2013-03-17 10:47:39', '2013-03-17 10:47:39', '', 36, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/shopping-cart/cancelled-order/', 0, 'page', '', 0),
(40, 1, '2013-03-17 09:52:21', '2013-03-17 09:52:21', '[eshop_show_shipping]', 'Shipping Rates', '', 'trash', 'closed', 'closed', '', 'shipping-rates', '', '', '2013-03-17 10:47:39', '2013-03-17 10:47:39', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/shipping-rates/', 0, 'page', '', 0),
(41, 1, '2013-03-17 09:52:21', '2013-03-17 09:52:21', '[eshop_show_downloads]', 'Downloads', '', 'publish', 'closed', 'closed', '', 'downloads', '', '', '2013-03-17 09:52:21', '2013-03-17 09:52:21', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/downloads/', 0, 'page', '', 0),
(42, 1, '2013-03-17 10:02:04', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:02:04', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=42', 0, 'ooco_product', '', 0),
(43, 1, '2013-03-17 10:05:58', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:05:58', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=43', 0, 'ooco_product', '', 0),
(44, 1, '2013-03-17 10:06:17', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:06:17', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=44', 0, 'ooco_product', '', 0),
(45, 1, '2013-03-17 10:06:32', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:06:32', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=45', 0, 'ooco_product', '', 0),
(46, 1, '2013-03-17 10:07:28', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:07:28', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=46', 0, 'ooco_product', '', 0),
(47, 1, '2013-03-17 10:07:40', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:07:40', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=47', 0, 'ooco_product', '', 0),
(48, 1, '2013-03-17 10:09:46', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:09:46', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=48', 0, 'ooco_product', '', 0),
(49, 1, '2013-03-17 10:10:02', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:10:02', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=49', 0, 'ooco_product', '', 0),
(50, 1, '2013-03-17 10:10:39', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:10:39', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=50', 0, 'ooco_product', '', 0),
(51, 1, '2013-03-17 10:11:00', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:11:00', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=51', 0, 'ooco_product', '', 0),
(52, 1, '2013-03-17 10:12:26', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:12:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=52', 0, 'ooco_product', '', 0),
(53, 1, '2013-03-17 10:13:28', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:13:28', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=53', 0, 'ooco_product', '', 0),
(54, 1, '2013-03-17 10:13:42', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:13:42', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=54', 0, 'ooco_product', '', 0),
(55, 1, '2013-03-17 10:15:17', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:15:17', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=55', 0, 'ooco_product', '', 0),
(56, 1, '2013-03-17 10:15:49', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:15:49', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=56', 0, 'ooco_product', '', 0),
(57, 1, '2013-03-17 10:15:54', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:15:54', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=57', 0, 'ooco_product', '', 0),
(58, 1, '2013-03-17 10:16:10', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:16:10', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=58', 0, 'ooco_product', '', 0),
(59, 1, '2013-03-17 10:17:14', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:17:14', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=59', 0, 'ooco_product', '', 0),
(60, 1, '2013-03-17 10:17:51', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:17:51', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=60', 0, 'ooco_product', '', 0),
(61, 1, '2013-03-17 10:24:20', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:24:20', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=61', 0, 'ooco_product', '', 0),
(62, 1, '2013-03-17 10:26:04', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:26:04', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=62', 0, 'ooco_product', '', 0),
(63, 1, '2013-03-17 10:27:31', '2013-03-17 10:27:31', 'Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie.', '1 DAY', '', 'publish', 'closed', 'closed', '', '1-day', '', '', '2013-03-17 10:44:42', '2013-03-17 10:44:42', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&#038;p=63', 0, 'ooco_product', '', 0),
(64, 1, '2013-03-17 10:27:26', '2013-03-17 10:27:26', '', '1bottles', '', 'inherit', 'open', 'open', '', '1bottles', '', '', '2013-03-17 10:27:26', '2013-03-17 10:27:26', '', 63, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/wp-content/uploads/2013/03/1bottles.png', 0, 'attachment', 'image/png', 0),
(65, 1, '2013-03-17 10:28:56', '2013-03-17 10:28:56', 'Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. ', 'Half week', '', 'publish', 'closed', 'closed', '', 'half-week', '', '', '2013-03-17 10:44:30', '2013-03-17 10:44:30', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&#038;p=65', 0, 'ooco_product', '', 0),
(66, 1, '2013-03-17 10:28:51', '2013-03-17 10:28:51', '', '4bottles', '', 'inherit', 'open', 'open', '', '4bottles', '', '', '2013-03-17 10:28:51', '2013-03-17 10:28:51', '', 65, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/wp-content/uploads/2013/03/4bottles.png', 0, 'attachment', 'image/png', 0),
(67, 1, '2013-03-17 10:29:50', '2013-03-17 10:29:50', 'Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie.', '1 WEEK', '', 'publish', 'closed', 'closed', '', '1-week', '', '', '2013-03-17 10:44:11', '2013-03-17 10:44:11', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&#038;p=67', 0, 'ooco_product', '', 0),
(68, 1, '2013-03-17 10:29:46', '2013-03-17 10:29:46', '', '7bottles', '', 'inherit', 'open', 'open', '', '7bottles', '', '', '2013-03-17 10:29:46', '2013-03-17 10:29:46', '', 67, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/wp-content/uploads/2013/03/7bottles.png', 0, 'attachment', 'image/png', 0),
(69, 1, '2013-03-17 10:30:32', '2013-03-17 10:30:32', 'Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie.', '1 MONTH', '', 'publish', 'closed', 'closed', '', '1-month', '', '', '2013-03-17 10:43:53', '2013-03-17 10:43:53', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&#038;p=69', 0, 'ooco_product', '', 0),
(70, 1, '2013-03-17 10:30:40', '2013-03-17 10:30:40', '', '30bottles', '', 'inherit', 'open', 'open', '', '30bottles', '', '', '2013-03-17 10:30:40', '2013-03-17 10:30:40', '', 69, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/wp-content/uploads/2013/03/30bottles.png', 0, 'attachment', 'image/png', 0),
(71, 1, '2013-03-17 10:38:23', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:38:23', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=71', 0, 'ooco_product', '', 0),
(72, 1, '2013-03-17 10:38:28', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:38:28', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=72', 0, 'ooco_product', '', 0),
(73, 1, '2013-03-17 10:39:05', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:39:05', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=73', 0, 'ooco_product', '', 0),
(74, 1, '2013-03-17 10:40:26', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 10:40:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=74', 0, 'ooco_product', '', 0),
(75, 1, '2013-03-14 11:52:14', '2013-03-14 11:52:14', '[vfb id=1]', 'sample_form', '', 'inherit', 'open', 'open', '', '4-revision-2', '', '', '2013-03-14 11:52:14', '2013-03-14 11:52:14', '', 4, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/4-revision-2/', 0, 'revision', '', 0),
(76, 1, '2013-03-17 09:52:21', '2013-03-17 09:52:21', '[eshop_show_shipping]', 'Shipping Rates', '', 'inherit', 'open', 'open', '', '40-revision', '', '', '2013-03-17 09:52:21', '2013-03-17 09:52:21', '', 40, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/40-revision/', 0, 'revision', '', 0),
(77, 1, '2013-03-17 09:52:21', '2013-03-17 09:52:21', '[eshop_show_cart]', 'Shopping Cart', '', 'inherit', 'open', 'open', '', '36-revision', '', '', '2013-03-17 09:52:21', '2013-03-17 09:52:21', '', 36, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/36-revision/', 0, 'revision', '', 0),
(78, 1, '2013-03-17 09:52:21', '2013-03-17 09:52:21', '[eshop_show_cancel]', 'Cancelled Order', '', 'inherit', 'open', 'open', '', '39-revision', '', '', '2013-03-17 09:52:21', '2013-03-17 09:52:21', '', 39, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/39-revision/', 0, 'revision', '', 0),
(79, 1, '2013-03-17 09:52:21', '2013-03-17 09:52:21', '[eshop_show_checkout]', 'Checkout', '', 'inherit', 'open', 'open', '', '37-revision', '', '', '2013-03-17 09:52:21', '2013-03-17 09:52:21', '', 37, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/37-revision/', 0, 'revision', '', 0),
(80, 1, '2013-03-17 09:52:21', '2013-03-17 09:52:21', '[eshop_show_success]', 'Thank You for your order', '', 'inherit', 'open', 'open', '', '38-revision', '', '', '2013-03-17 09:52:21', '2013-03-17 09:52:21', '', 38, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/38-revision/', 0, 'revision', '', 0),
(81, 1, '2013-03-17 10:48:11', '2013-03-17 10:48:11', '', 'About Us', '', 'publish', 'open', 'open', '', 'about', '', '', '2013-03-17 10:48:11', '2013-03-17 10:48:11', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=81', 0, 'page', '', 0),
(82, 1, '2013-03-17 10:47:58', '2013-03-17 10:47:58', '', 'About Us', '', 'inherit', 'open', 'open', '', '81-revision', '', '', '2013-03-17 10:47:58', '2013-03-17 10:47:58', '', 81, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/81-revision/', 0, 'revision', '', 0),
(83, 1, '2013-03-17 12:05:48', '2013-03-17 12:05:48', '', 'shopOrder', '', 'publish', 'open', 'open', '', 'shoporder', '', '', '2013-03-17 12:05:48', '2013-03-17 12:05:48', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=83', 0, 'page', '', 0),
(84, 1, '2013-03-17 12:05:42', '2013-03-17 12:05:42', '', 'shopOrder', '', 'inherit', 'open', 'open', '', '83-revision', '', '', '2013-03-17 12:05:42', '2013-03-17 12:05:42', '', 83, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/83-revision/', 0, 'revision', '', 0),
(85, 1, '2013-03-17 12:21:43', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 12:21:43', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=85', 0, 'page', '', 0),
(86, 1, '2013-03-17 12:22:20', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 12:22:20', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=86', 0, 'page', '', 0),
(87, 1, '2013-03-17 12:22:34', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 12:22:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=87', 0, 'page', '', 0),
(88, 1, '2013-03-17 12:23:25', '2013-03-17 12:23:25', '', 'shop login', '', 'publish', 'open', 'open', '', 'shop-login', '', '', '2013-03-17 12:23:25', '2013-03-17 12:23:25', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=88', 0, 'page', '', 0),
(89, 1, '2013-03-17 12:23:23', '2013-03-17 12:23:23', '', 'shop login', '', 'inherit', 'open', 'open', '', '88-revision', '', '', '2013-03-17 12:23:23', '2013-03-17 12:23:23', '', 88, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/88-revision/', 0, 'revision', '', 0),
(90, 1, '2013-03-17 12:24:13', '2013-03-17 12:24:13', '', 'shop register', '', 'publish', 'open', 'open', '', 'shop-register', '', '', '2013-03-17 12:24:13', '2013-03-17 12:24:13', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=90', 0, 'page', '', 0),
(91, 1, '2013-03-17 12:24:08', '2013-03-17 12:24:08', '', 'shop register', '', 'inherit', 'open', 'open', '', '90-revision', '', '', '2013-03-17 12:24:08', '2013-03-17 12:24:08', '', 90, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/90-revision/', 0, 'revision', '', 0),
(92, 1, '2013-03-17 13:19:37', '2013-03-17 13:19:37', '<div class="formField">\r\n  <div class="columns one left">&nbsp;</div>\r\n  <div class="columns one left label">Name</div>\r\n  <div class="clsFloatLeft columns eight left">\r\n     [text* your-name] \r\n  </div>\r\n  <div class="clear"></div>\r\n</div>\r\n<div class="formField">\r\n  <div class="columns one left">&nbsp;</div>\r\n  <div class="columns one left label">Email</div>\r\n  <div class="columns eight left">\r\n     [email* your-email] \r\n  </div>\r\n  <div class="clear"></div>\r\n</div>\r\n<div class="formField">\r\n  <div class="columns one left">&nbsp;</div>\r\n  <div class="columns one left label">&nbsp;</div>\r\n  <div class="columns eight left">\r\n    <p class="clsFloatRight">\r\n      [submit id:newsLetterSubBtn "SUBSCRIBE"]\r\n    </p>\r\n    <div class="clear"></div>\r\n  </div>\r\n  <div class="clear"></div>\r\n</div>\n[your-subject]\n[your-name] <[your-email]>\nFrom: [your-name] <[your-email]>\r\nSubject: [your-subject]\r\n\r\nMessage Body:\r\n[your-message]\r\n\r\n--\r\nThis mail is sent via contact form on OCOO || The Beauty Drink http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms\nkarthik@hgwmedia.com\n\n\n\n\n[your-subject]\n[your-name] <[your-email]>\nMessage body:\r\n[your-message]\r\n\r\n--\r\nThis mail is sent via contact form on OCOO || The Beauty Drink http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms\n[your-email]\n\n\n\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nEmail address seems invalid.\nPlease fill the required field.\nYour entered code is incorrect.\nFailed to upload file.\nThis file type is not allowed.\nThis file is too large.\nFailed to upload file. Error occurred.\nYour answer is not correct.', 'OCOO NEWSLETTER', '', 'publish', 'open', 'open', '', 'ocoo-newsletter', '', '', '2013-03-17 13:21:40', '2013-03-17 13:21:40', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=wpcf7_contact_form&#038;p=92', 0, 'wpcf7_contact_form', '', 0),
(93, 1, '2013-03-17 13:20:39', '2013-03-17 13:20:39', '[contact-form-7 id="92" title="OCOO NEWSLETTER"]', 'THE OCÓO NEWSLETTER', '', 'publish', 'open', 'open', '', 'the-ocoo-newsletter', '', '', '2013-03-17 13:26:26', '2013-03-17 13:26:26', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=93', 0, 'page', '', 0),
(94, 1, '2013-03-17 13:20:03', '2013-03-17 13:20:03', '[contact-form-7 id="92" title="OCOO NEWSLETTER"]', 'newsletter', '', 'inherit', 'open', 'open', '', '93-revision', '', '', '2013-03-17 13:20:03', '2013-03-17 13:20:03', '', 93, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/93-revision/', 0, 'revision', '', 0),
(95, 1, '2013-03-17 13:20:39', '2013-03-17 13:20:39', '[contact-form-7 id="92" title="OCOO NEWSLETTER"]', 'THE OCÓO NEWSLETTER', '', 'inherit', 'open', 'open', '', '93-revision-2', '', '', '2013-03-17 13:20:39', '2013-03-17 13:20:39', '', 93, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/93-revision-2/', 0, 'revision', '', 0),
(96, 1, '2013-03-17 13:28:21', '2013-03-17 13:28:21', '[contact-form-7 id="92" title="OCOO NEWSLETTER"]', 'THE OCÓO NEWSLETTER', '', 'inherit', 'open', 'open', '', '93-autosave', '', '', '2013-03-17 13:28:21', '2013-03-17 13:28:21', '', 93, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/93-autosave/', 0, 'revision', '', 0),
(97, 1, '2013-03-17 15:00:51', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-03-17 15:00:51', '0000-00-00 00:00:00', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?post_type=ooco_product&p=97', 0, 'ooco_product', '', 0),
(98, 1, '2013-03-18 16:56:25', '2013-03-18 12:56:25', '', 'view-shop-cart', '', 'publish', 'open', 'open', '', 'view-shop-cart', '', '', '2013-03-18 16:56:32', '2013-03-18 12:56:32', '', 0, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/?page_id=98', 0, 'page', '', 0),
(99, 1, '2013-03-18 16:56:25', '2013-03-18 12:56:25', '', 'view-shop-cart', '', 'inherit', 'open', 'open', '', '98-revision', '', '', '2013-03-18 16:56:25', '2013-03-18 12:56:25', '', 98, 'http://localhost/karthi_code/ocoo_beauty/web/OOCO/cms/98-revision/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_temp_cart`
--

CREATE TABLE IF NOT EXISTS `wp_temp_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refUserId` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(100) NOT NULL,
  `address_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `wp_temp_cart`
--

INSERT INTO `wp_temp_cart` (`id`, `refUserId`, `product_id`, `quantity`, `price`, `address_id`, `status`, `date_time`) VALUES
(1, 3, 65, 1, '', 0, 1, '2013-03-18 16:42:20'),
(2, 3, 67, 1, '', 0, 1, '2013-03-18 16:42:31'),
(3, 3, 67, 1, '', 0, 1, '2013-03-18 16:42:31'),
(4, 3, 67, 1, '', 0, 1, '2013-03-18 16:42:31'),
(5, 3, 63, 1, '', 0, 1, '2013-03-18 16:51:58');

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Uncategorized', 'uncategorized-2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'catablog-terms', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_useraddress`
--

CREATE TABLE IF NOT EXISTS `wp_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refUserId` int(11) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `emirate` int(100) NOT NULL,
  `location` int(100) NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `po_box` varchar(50) NOT NULL,
  `country` int(100) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `emirate` (`emirate`),
  KEY `location` (`location`),
  KEY `refUserId` (`refUserId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_useraddress`
--

INSERT INTO `wp_useraddress` (`id`, `refUserId`, `mobile`, `emirate`, `location`, `address_1`, `address_2`, `po_box`, `country`, `status`, `date`) VALUES
(2, 3, '0554192493', 2, 1, 'Street 2A', '', '502106', 1, 1, '2013-03-18 09:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', ''),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'admin'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media'),
(13, 1, 'show_welcome_panel', '0'),
(14, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(15, 1, 'closedpostboxes_dashboard', 'a:0:{}'),
(16, 1, 'metaboxhidden_dashboard', 'a:8:{i:0;s:19:"dashboard_right_now";i:1;s:25:"dashboard_recent_comments";i:2;s:24:"dashboard_incoming_links";i:3;s:17:"dashboard_plugins";i:4;s:21:"dashboard_quick_press";i:5;s:23:"dashboard_recent_drafts";i:6;s:17:"dashboard_primary";i:7;s:19:"dashboard_secondary";}'),
(17, 1, 'meta-box-order_dashboard', 'a:4:{s:6:"normal";s:88:"dashboard_right_now,dashboard_recent_comments,dashboard_incoming_links,dashboard_plugins";s:4:"side";s:83:"dashboard_quick_press,dashboard_recent_drafts,dashboard_primary,dashboard_secondary";s:7:"column3";s:0:"";s:7:"column4";s:0:"";}'),
(18, 1, 'screen_layout_dashboard', '1'),
(20, 1, 'wp_user-settings', 'editor=tinymce&libraryContent=browse&urlbutton=none&imgsize=full'),
(21, 1, 'wp_user-settings-time', '1363526434'),
(22, 1, 'closedpostboxes_testimonials-widget', 'a:0:{}'),
(23, 1, 'metaboxhidden_testimonials-widget', 'a:5:{i:0;s:11:"categorydiv";i:1;s:16:"tagsdiv-post_tag";i:2;s:12:"postimagediv";i:3;s:7:"slugdiv";i:4;s:9:"authordiv";}'),
(24, 1, 'catablog_screen_settings', 'a:3:{s:7:"library";a:2:{s:5:"limit";i:20;s:12:"hide-columns";a:0:{}}s:7:"add-new";a:1:{s:12:"hide-columns";a:0:{}}s:7:"gallery";a:2:{s:5:"limit";i:20;s:12:"hide-columns";a:0:{}}}'),
(25, 1, 'meta-box-order_ooco_product', 'a:3:{s:4:"side";s:9:"submitdiv";s:6:"normal";s:7:"slugdiv";s:8:"advanced";s:29:"ooco_product_attribut_metabox";}'),
(26, 1, 'screen_layout_ooco_product', '2'),
(27, 1, 'closedpostboxes_ooco_product', 'a:0:{}'),
(28, 1, 'metaboxhidden_ooco_product', 'a:1:{i:0;s:7:"slugdiv";}'),
(51, 3, 'wp_user_level', '0'),
(50, 3, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(49, 3, 'show_admin_bar_front', 'true'),
(48, 3, 'use_ssl', '0'),
(47, 3, 'admin_color', 'fresh'),
(46, 3, 'comment_shortcuts', 'false'),
(45, 3, 'rich_editing', 'true'),
(44, 3, 'description', ''),
(41, 3, 'first_name', ''),
(42, 3, 'last_name', ''),
(43, 3, 'nickname', 'karthi.intel2004@gmail.com'),
(52, 3, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media'),
(53, 3, 'aim', ''),
(54, 3, 'yim', ''),
(55, 3, 'jabber', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BIKiYhkE1rzvnzGaKiL1QweMNSvcex.', 'admin', 'karthik@hgwmedia.com', '', '2013-03-14 09:54:04', '', 0, 'admin'),
(3, 'karthi.intel2004@gmail.com', '$P$BBj5yP0A2O.OszrsVi5VT0F8cmWG3a/', 'karthi', 'karthi.intel2004@gmail.com', '', '2013-03-18 09:56:56', '', 0, 'karthi');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
