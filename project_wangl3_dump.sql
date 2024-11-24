-- MySQL dump 10.11
--
-- Host: localhost    Database: project_gardunom_wangl3
-- ------------------------------------------------------
-- Server version	5.0.95

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `AccountNumber` varchar(20) NOT NULL,
  `CurrentBalance` decimal(10,2) default NULL,
  `PaymentTerm` varchar(20) default NULL,
  `CreditLimit` decimal(10,2) default NULL,
  `AccountStatus` varchar(20) default NULL,
  `LastPaymentAmount` decimal(10,2) default NULL,
  `LastPaymentDate` date default NULL,
  `ClientID` int(11) default NULL,
  PRIMARY KEY  (`AccountNumber`),
  KEY `ClientID` (`ClientID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES ('ACC10001','2500.00','Net 30','5000.00','Active','500.00','2024-09-30',1),('ACC10002','1500.00','Net 15','3000.00','Active','300.00','2024-09-25',2),('ACC10003','3200.00','Net 45','7000.00','Active','700.00','2024-09-20',3),('ACC10004','800.00','Net 30','2000.00','Active','150.00','2024-09-28',4),('ACC10005','4500.00','Net 15','10000.00','Active','1000.00','2024-09-18',5),('ACC10006','1200.00','Net 30','2500.00','Active','250.00','2024-09-22',6),('ACC10007','3900.00','Net 45','8000.00','Active','850.00','2024-09-29',7),('ACC10008','1700.00','Net 15','3500.00','Active','400.00','2024-09-21',8),('ACC10009','600.00','Net 30','1500.00','Active','200.00','2024-09-26',9),('ACC10010','2200.00','Net 45','6000.00','Active','550.00','2024-09-27',10),('ACC10011','3300.00','Net 30','7500.00','Active','600.00','2024-09-19',11),('ACC10012','1300.00','Net 15','3000.00','Active','300.00','2024-09-23',12),('ACC10013','4000.00','Net 45','9000.00','Active','750.00','2024-09-24',13),('ACC10014','500.00','Net 30','1500.00','Active','150.00','2024-09-30',14),('ACC10015','2500.00','Net 15','5500.00','Active','500.00','2024-09-25',15);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Business`
--

DROP TABLE IF EXISTS `Business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Business` (
  `TaxID` varchar(20) NOT NULL,
  `BusinessName` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `BusinessType` varchar(50) default NULL,
  `ContactFirstName` varchar(50) default NULL,
  `ContactLastName` varchar(50) default NULL,
  PRIMARY KEY  (`TaxID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Business`
--

LOCK TABLES `Business` WRITE;
/*!40000 ALTER TABLE `Business` DISABLE KEYS */;
INSERT INTO `Business` VALUES ('123456789','Sweet Treats Bakery','123 Baker St, San Antonio, TX','Bakery distributor','Alice','Martinez'),('987654321','Taco Fiesta Truck','456 Food Park, Austin, TX','Taco truck','Carlos','Lopez'),('111222333','La Cocina Mexicana','789 Fiesta Ave, San Antonio, TX','Mexican restaurant','Maria','Gonzalez'),('444555666','Taste of Mexico','1010 Spice Rd, New Braunfels, TX','Mexican restaurant','Miguel','Ramirez'),('777888999','Rolling Tacos','202 Truck Stop, San Antonio, TX','Taco truck','Juan','Sanchez'),('555666777','Don Pancho\'s Bakery','303 Dough St, San Antonio, TX','Bakery distributor','Sofia','Perez'),('888999111','Taco Town','404 Food Court, Dallas, TX','Taco truck','Luis','Vargas'),('666777888','Casa Deliciosa','505 Fiesta Blvd, San Marcos, TX','Mexican restaurant','Ana','Ortiz'),('999111222','The Burrito Palace','606 Market St, San Antonio, TX','Restaurant','David','Hernandez'),('222333444','Queso Kings','707 Taco Lane, Austin, TX','Restaurant chain','Isabel','Flores'),('333444555','Panaderia Delights','808 Sweet Ave, San Antonio, TX','Bakery distributor','Oscar','Garcia'),('444555777','El Pueblo Tacos','909 Snack St, Dallas, TX','Taco truck','Pedro','Rodriguez'),('111333555','La Familia Mexican Grill','1011 Family Blvd, San Antonio, TX','Mexican restaurant','Rosa','Martinez'),('333555777','Sunshine Bakery','1212 Sunrise Ave, Laredo, TX','Bakery distributor','Eva','Fernandez'),('222444666','Fiesta Flavors','1414 Salsa Rd, San Antonio, TX','Restaurant chain','Carlos','Morales');
/*!40000 ALTER TABLE `Business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `ClientID` int(11) NOT NULL,
  `BusinessName` varchar(100) default NULL,
  `BusinessType` varchar(50) default NULL,
  `ContactFirstName` varchar(50) default NULL,
  `ContactLastName` varchar(50) default NULL,
  `AccountStatus` varchar(20) default NULL,
  `ClientFirstName` varchar(50) default NULL,
  `ClientLastName` varchar(50) default NULL,
  `AccountNumber` varchar(20) default NULL,
  `PaymentType` varchar(20) default NULL,
  `LastOrderDate` date default NULL,
  `PhoneNumber` varchar(20) default NULL,
  `TaxID` varchar(20) default NULL,
  `Address` varchar(200) default NULL,
  PRIMARY KEY  (`ClientID`),
  KEY `TaxID` (`TaxID`),
  KEY `AccountNumber` (`AccountNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'Sweet Treats Bakery','Bakery distributor','Alice','Martinez','Active','Alice','Martinez','ACC10001','Credit Card','2024-10-01','555-1234','123456789','123 Baker St, San Antonio, TX'),(2,'Taco Fiesta Truck','Taco truck','Carlos','Lopez','Active','Carlos','Lopez','ACC10002','Cash','2024-10-02','555-2345','987654321','456 Food Park, Austin, TX'),(3,'La Cocina Mexicana','Mexican restaurant','Maria','Gonzalez','Active','Maria','Gonzalez','ACC10003','Credit Card','2024-10-03','555-3456','111222333','789 Fiesta Ave, San Antonio, TX'),(4,'Taste of Mexico','Mexican restaurant','Miguel','Ramirez','Active','Miguel','Ramirez','ACC10004','Credit Card','2024-10-04','555-4567','444555666','1010 Spice Rd, New Braunfels, TX'),(5,'Rolling Tacos','Taco truck','Juan','Sanchez','Active','Juan','Sanchez','ACC10005','Debit Card','2024-10-05','555-5678','777888999','202 Truck Stop, San Antonio, TX'),(6,'Don Pancho\'s Bakery','Bakery distributor','Sofia','Perez','Active','Sofia','Perez','ACC10006','Cash','2024-10-06','555-6789','555666777','303 Dough St, San Antonio, TX'),(7,'Taco Town','Taco truck','Luis','Vargas','Active','Luis','Vargas','ACC10007','Credit Card','2024-10-07','555-7890','888999111','404 Food Court, Dallas, TX'),(8,'Casa Deliciosa','Mexican restaurant','Ana','Ortiz','Active','Ana','Ortiz','ACC10008','Cash','2024-10-08','555-8901','666777888','505 Fiesta Blvd, San Marcos, TX'),(9,'The Burrito Palace','Restaurant','David','Hernandez','Active','David','Hernandez','ACC10009','Credit Card','2024-10-09','555-9012','999111222','606 Market St, San Antonio, TX'),(10,'Queso Kings','Restaurant chain','Isabel','Flores','Active','Isabel','Flores','ACC10010','Credit Card','2024-10-10','555-0123','222333444','707 Taco Lane, Austin, TX'),(11,'Panaderia Delights','Bakery distributor','Oscar','Garcia','Active','Oscar','Garcia','ACC10011','Credit Card','2024-10-11','555-1235','333444555','808 Sweet Ave, San Antonio, TX'),(12,'El Pueblo Tacos','Taco truck','Pedro','Rodriguez','Active','Pedro','Rodriguez','ACC10012','Cash','2024-10-12','555-2346','444555777','909 Snack St, Dallas, TX'),(13,'La Familia Mexican Grill','Mexican restaurant','Rosa','Martinez','Active','Rosa','Martinez','ACC10013','Credit Card','2024-10-13','555-3457','111333555','1011 Family Blvd, San Antonio, TX'),(14,'Sunshine Bakery','Bakery distributor','Eva','Fernandez','Active','Eva','Fernandez','ACC10014','Debit Card','2024-10-14','555-4568','333555777','1212 Sunrise Ave, Laredo, TX'),(15,'Fiesta Flavors','Restaurant chain','Carlos','Morales','Active','Carlos','Morales','ACC10015','Credit Card','2024-10-15','555-5679','222444666','1414 Salsa Rd, San Antonio, TX');
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomOrder`
--

DROP TABLE IF EXISTS `CustomOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomOrder` (
  `CustomOrderNumber` int(11) NOT NULL,
  `OrderID` int(11) default NULL,
  `MeatType` varchar(50) default NULL,
  `CutSpecifications` varchar(200) default NULL,
  `Weight` decimal(10,2) default NULL,
  `ProcessingInstructions` varchar(200) default NULL,
  `ProcessingDate` date default NULL,
  `CompletionStatus` varchar(20) default NULL,
  `QualityCheck` varchar(20) default NULL,
  `EmployeeID` int(11) default NULL,
  PRIMARY KEY  (`CustomOrderNumber`),
  KEY `OrderID` (`OrderID`),
  KEY `EmployeeID` (`EmployeeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomOrder`
--

LOCK TABLES `CustomOrder` WRITE;
/*!40000 ALTER TABLE `CustomOrder` DISABLE KEYS */;
INSERT INTO `CustomOrder` VALUES (1,1,'Beef','Steak Cut','2.50','Trim fat','2024-11-07','In Progress','Pass',3),(2,2,'Chicken','Breast Cut','1.20','No skin','2024-11-07','In Progress','Pending',4),(3,3,'Pork','Rib Cut','3.00','Extra marinade','2024-11-07','Scheduled','Pass',6),(4,4,'Lamb','Chop Cut','1.75','French trimmed','2024-11-07','In Progress','Pending',8),(5,5,'Beef','Ground','5.00','Lean','2024-11-08','Scheduled','Pass',10),(6,6,'Chicken','Whole','2.20','Free-range','2024-11-08','Processing','Pass',12),(7,7,'Duck','Breast','1.50','Boneless','2024-11-08','In Progress','Pending',40),(8,8,'Turkey','Leg Cut','4.50','No skin','2024-11-08','Completed','Pass',50);
/*!40000 ALTER TABLE `CustomOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `HireDate` date NOT NULL,
  `WeeklyHours` decimal(5,2) default NULL,
  `HourlyRate` decimal(10,2) default NULL,
  `PartTimeOffBalance` decimal(5,2) default NULL,
  PRIMARY KEY  (`EmployeeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Jorge','Villareal Jimenez','2019-12-01','40.00','10.00','0.00'),(2,'Jorge','Villareal Garcia','2006-05-12','40.00','36.45','0.00'),(3,'Bin','Sacc','2000-06-01','25.50','15.00','0.00'),(4,'Gordon','Goroway','2011-09-11','34.12','28.50','4.00'),(5,'Nedal','Amaso','2016-11-06','40.00','1500.21','0.00'),(6,'Caseoh','Wellington','2022-02-12','12.22','6.90','2.00'),(7,'BronLe','Yordon','2024-11-06','40.00','42.02','0.00'),(8,'Donmasuka','Ascii','2023-10-12','37.00','61.00','0.00'),(9,'Satoshi','Nakamoto','2020-05-11','40.00','76.23','0.00'),(10,'Gokal','Yakovenko','2017-04-25','12.12','16.70','0.00'),(11,'Vitalik','Buterin','2024-05-23','40.00','24.11','0.00'),(12,'Anduril','Gondor Palantir','2024-07-13','40.00','16.00','0.00'),(18,'James','Li','2022-01-10','40.00','20.00','5.00'),(25,'Carlos','Martinez','2021-04-22','40.00','22.50','0.00'),(32,'Ahmed','Hassan','2020-08-14','35.00','19.00','0.00'),(40,'Sophia','Zhang','2023-03-05','20.00','18.00','0.00'),(21,'David','Johnson','2022-10-17','40.00','21.50','0.00'),(27,'Fatima','Al-Mansouri','2019-11-12','40.00','23.00','0.00'),(35,'John','Smith','2021-07-28','40.00','24.00','0.00'),(19,'Linda','Yang','2022-05-15','20.00','17.50','0.00'),(42,'Daniel','Garcia','2020-09-30','40.00','20.50','0.00'),(50,'Mohammed','Ali','2023-01-20','15.00','16.00','0.00'),(23,'Henry','Perez','2021-06-25','40.00','25.00','8.50');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeRole`
--

DROP TABLE IF EXISTS `EmployeeRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmployeeRole` (
  `EmployeeID` int(11) NOT NULL default '0',
  `Role` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`EmployeeID`,`Role`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeRole`
--

LOCK TABLES `EmployeeRole` WRITE;
/*!40000 ALTER TABLE `EmployeeRole` DISABLE KEYS */;
INSERT INTO `EmployeeRole` VALUES (1,'Director'),(2,'Secretary'),(3,'Driver'),(4,'Driver'),(5,'Manager of Goods'),(6,'Driver'),(7,'Manager of Personnel'),(8,'Driver'),(9,'Warehouse Worker (Unloading)'),(10,'Driver'),(12,'Driver'),(18,'Salesman'),(19,'Butcher'),(19,'Janitor'),(21,'Account Manager'),(23,'Mechanic'),(25,'Salesman'),(27,'Seasonal Office Employee'),(32,'Butcher'),(35,'Secretary'),(40,'Driver'),(42,'Salesman'),(50,'Driver');
/*!40000 ALTER TABLE `EmployeeRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item` (
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(100) default NULL,
  `CategoryType` varchar(50) default NULL,
  `MinimumStock` int(11) default NULL,
  `WholesalePrice` decimal(10,2) default NULL,
  `StorageType` varchar(50) default NULL,
  `RetailPrice` decimal(10,2) default NULL,
  `PerUnitPrice` decimal(5,2) NOT NULL,
  PRIMARY KEY  (`ItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES (100,'GROUND BF','BEEF OFFALS',10,'35.90','FROZEN','45.99','3.59'),(130,'TRIPAS XL','BEEF OFFALS',30,'35.70','FROZEN','49.99','1.19'),(132,'NACIONAL TRIPAS','BEEF OFFALS',30,'50.70','FROZEN','65.99','1.69'),(131,'TRIPAS SWIFT','BEEF OFFALS',30,'38.70','FROZEN','52.99','1.29'),(119,'STX TRIPA','BEEF OFFALS',30,'47.70','FROZEN','62.99','1.59'),(112,'CHEEK MEAT','BEEF OFFALS',30,'125.70','FROZEN','159.99','4.19'),(109,'CHEEK MEAT 86E XL','BEEF OFFALS',60,'233.40','FROZEN','289.99','3.89'),(1001,'CHEEK MEAT XL K','BEEF OFFALS',60,'215.40','FROZEN','269.99','3.59'),(111,'SWIFT CHEEK MEAT 969G','BEEF OFFALS',60,'215.40','FROZEN','269.99','3.59'),(105,'COW CHEEK MEAT','BEEF OFFALS',60,'215.40','FROZEN','269.99','3.59'),(114,'BF TONNGUES/LENGUA','BEEF OFFALS',10,'67.90','FROZEN','89.99','6.79'),(121,'MENUDO','BEEF OFFALS',60,'113.40','FROZEN','149.99','1.89'),(123,'HONEY COMB SWIFT','BEEF OFFALS',15,'68.85','FROZEN','89.99','4.59'),(125,'EXCEL HONEY COMB','BEEF OFFALS',10,'40.90','FROZEN','55.99','4.09'),(126,'HONEYCOMB CAN CARG','BEEF OFFALS',10,'35.90','FROZEN','47.99','3.59'),(122,'IBP HONEYCOMB','BEEF OFFALS',10,'35.90','FROZEN','47.99','3.59'),(116,'LABIO/LIPS','BEEF OFFALS',60,'275.40','FROZEN','349.99','4.59'),(108,'COW LIPS','BEEF OFFALS',60,'239.40','FROZEN','299.99','3.99'),(115,'TONGUE TIP','BEEF OFFALS',10,'36.90','FROZEN','47.99','3.69'),(1100,'FAJITA FROZZEN','BEEF OFFALS',10,'59.90','FROZEN','77.99','5.99'),(197,'CHAM FJ MAR DELGADA','BEEF OFFALS',10,'55.90','FROZEN','72.99','5.59'),(196,'FLAP MEAT FROZEN','BEEF OFFALS',10,'59.90','FROZEN','77.99','5.99'),(213,'RYC BEEF FOR FAJITA','BEEF OFFALS',10,'55.90','FROZEN','72.99','5.59'),(127,'TUETANO','BEEF OFFALS',10,'39.90','FROZEN','51.99','3.99'),(96,'FRENCH FRIES 3/8','PROCESSED',15,'35.00','FROZEN','45.99','35.00'),(98,'SEASONED FRIES','PROCESSED',15,'68.00','FROZEN','85.99','68.00'),(97,'HASHBROWNS','PROCESSED',15,'48.00','FROZEN','62.99','48.00'),(99,'CRINKLES FRIES','PROCESSED',15,'40.00','FROZEN','52.99','40.00'),(86,'RIB STEAK 8oz','PROCESSED',15,'104.85','FROZEN','129.99','6.99'),(93,'T-BONE STK 8OZ','PROCESSED',15,'85.35','FROZEN','109.99','5.69'),(74,'SHORTRIB','PROCESSED',10,'59.90','FROZEN','79.99','5.99'),(67,'MEXIC SOUP BONE','PROCESSED',10,'39.90','FROZEN','51.99','3.99'),(75,'SOUP BONE','PROCESSED',14,'54.46','FROZEN','69.99','3.89'),(95,'MENUDO REG CUT','PROCESSED',10,'25.90','FROZEN','34.99','2.59'),(124,'HONEY COMB CUT','PROCESSED',10,'47.90','FROZEN','61.99','4.79'),(76,'STEW MEAT FREEZE','PROCESSED',10,'46.90','FROZEN','60.99','4.69'),(72,'BARBACOA CORTADA','PROCESSED',60,'251.40','FROZEN','319.99','4.19'),(78,'BF FEET CUT','PROCESSED',15,'40.35','FROZEN','52.99','2.69'),(84,'PORK FEET CUT','PROCESSED',15,'35.85','FROZEN','46.99','2.39'),(83,'PORK CHOP C/C','PROCESSED',10,'25.90','FROZEN','34.99','2.59'),(85,'CARNE PASTOR','PROCESSED',20,'59.80','FROZEN','77.99','2.99'),(91,'HAMB PATTIES 3/1','PROCESSED',10,'28.90','FROZEN','37.99','2.89'),(222,'TRIPA PRECOOK','PROCESSED',30,'240.00','FROZEN','299.99','8.00'),(46,'PUERCO FRESCO BON','FRESH USA',10,'18.90','REFRIGERATED','25.99','1.89'),(202,'LIFTER IBP','FRESH USA',10,'46.90','REFRIGERATED','59.99','4.69'),(230,'B/LCHUCK ROLL USA','FRESH USA',10,'56.90','REFRIGERATED','72.99','5.69'),(250,'PEELED KNUCKELS','FRESH USA',10,'42.90','REFRIGERATED','55.99','4.29'),(211,'INSIDE SKIRT/FAJITA','FRESH USA',10,'66.90','REFRIGERATED','85.99','6.69'),(280,'CHUCK TENDER','FRESH USA',10,'46.90','REFRIGERATED','60.99','4.69'),(220,'INSIDE ROUND XT','FRESH USA',10,'38.90','REFRIGERATED','50.99','3.89'),(321,'SHOULDER CLOD XT','FRESH USA',10,'37.90','REFRIGERATED','49.99','3.79'),(270,'LOIN TAIL AMERICA','FRESH USA',10,'39.90','REFRIGERATED','51.99','3.99'),(330,'TOP SIRLOIN','FRESH USA',10,'54.90','REFRIGERATED','70.99','5.49'),(332,'BRISKET','FRESH USA',10,'39.90','REFRIGERATED','51.99','3.99'),(50,'CK THIGH MEAT','POULTRY',40,'91.60','FROZEN','119.99','2.29'),(55,'CK LEG QRTER','POULTRY',40,'39.60','FROZEN','52.99','0.99'),(60,'CK BREAST FROZEN','POULTRY',40,'79.60','FROZEN','99.99','1.99'),(65,'POLLO DE 8 PIEZAS','POULTRY',10,'15.90','FROZEN','20.99','1.59'),(64,'CK NUGGETS','POULTRY',5,'20.00','FROZEN','26.99','4.00'),(745,'CHIKEN TENDER','POULTRY',5,'21.00','FROZEN','27.99','4.20'),(51,'RYC CHICKEN BREAST','POULTRY',10,'29.90','FROZEN','38.99','2.99'),(66,'3/UP WOGS/pllo ent','POULTRY',10,'18.90','FROZEN','23.99','1.89'),(550,'CABRITO ENTERO','LAMB PRODUCTS',10,'125.00','FROZEN','159.99','12.50'),(664,'MACHITOS','LAMB PRODUCTS',10,'34.90','FROZEN','45.99','3.49'),(551,'LAMB SHOULDER','LAMB PRODUCTS',10,'109.90','FROZEN','139.99','10.99'),(40,'PRK STMACH/BUCHE','PORK',30,'74.70','FROZEN','97.99','2.49'),(35,'PORK JOWLS S/OFF','PORK',10,'19.90','FROZEN','25.99','1.99'),(37,'PORK BUTT BONE','PORK',10,'14.90','FROZEN','19.99','1.49'),(45,'PORK MED RIBS','PORK',10,'25.90','FROZEN','33.99','2.59'),(41,'PORK BELLIE SKIN ON','PORK',10,'28.90','FROZEN','37.99','2.89'),(70,'CHILES RELLENOS 1/30','PORK',30,'78.00','FROZEN','99.99','2.60'),(401,'BACON INDIANA','BACON/SAUSAGE/CHORIZO',30,'107.70','REFRIGERATED','139.99','3.59'),(400,'BACON SMITHFIELD','BACON/SAUSAGE/CHORIZO',25,'89.75','REFRIGERATED','116.99','3.59'),(422,'CHORIZO CHAMPION','BACON/SAUSAGE/CHORIZO',15,'35.00','REFRIGERATED','45.99','2.33'),(411,'KENNEDY SAUS','BACON/SAUSAGE/CHORIZO',8,'36.72','REFRIGERATED','47.99','4.59'),(412,'SAUSAGE PRECOOK','BACON/SAUSAGE/CHORIZO',12,'55.08','REFRIGERATED','71.99','4.59'),(430,'CH. PRENSADO ROJO','BACON/SAUSAGE/CHORIZO',20,'80.00','REFRIGERATED','104.99','4.00'),(431,'CH. PRENSADO ZAZA','BACON/SAUSAGE/CHORIZO',20,'139.80','REFRIGERATED','164.79','6.99'),(406,'BACON WAGGON','BACON/SAUSAGE/CHORIZO',10,'27.90','REFRIGERATED','36.99','2.79'),(407,'SAN LUIS','BACON/SAUSAGE/CHORIZO',18,'50.00','REFRIGERATED','65.99','2.78'),(432,'CHORIZO SAN MANUEL','BACON/SAUSAGE/CHORIZO',16,'64.00','REFRIGERATED','83.99','4.00'),(759,'SHR 16-20 HLSO CAJA CHICA','SEAFOOD-CAMARON-CASCARA',4,'27.96','FROZEN','35.99','6.99'),(758,'SHR 16-20 HLSO CAJA GRANDE','SEAFOOD-CAMARON-CASCARA',4,'27.96','FROZEN','35.99','6.99'),(751,'SHR 26-30 HLSO CAJA CHICA','SEAFOOD-CAMARON-CASCARA',4,'23.96','FROZEN','30.99','5.99'),(750,'SHR 26-30 HLSO CAJA GRANDE','SEAFOOD-CAMARON-CASCARA',4,'23.96','FROZEN','30.99','5.99'),(755,'SHR 41-50 HLSO CJA CHICA','SEAFOOD-CAMARON-CASCARA',4,'19.96','FROZEN','25.99','4.99'),(754,'SHR 41-50 HLSO CJA GRANDE','SEAFOOD-CAMARON-CASCARA',4,'19.96','FROZEN','25.99','4.99'),(756,'FRIED SHR EMPANIZO','SEAFOOD-CAMARON-PELADO-COLA',3,'57.00','FROZEN','72.99','19.00'),(753,'16-20 P&D NO COLA','SEAFOOD-CAMARON-PELADO-NO-COLA',10,'79.90','FROZEN','99.99','7.99'),(735,'21-25 P&D NO COLA','SEAFOOD-CAMARON-PELADO-NO-COLA',20,'139.80','FROZEN','179.99','6.99'),(766,'41-50 PELADO NO COLA','SEAFOOD-CAMARON-PELADO-NO-COLA',10,'59.90','FROZEN','77.99','5.99'),(734,'POLLOCK FILET 4-6','SEAFOOD-FILETES',40,'80.00','FROZEN','119.99','2.00'),(762,'FILETE TILAPIA 3-5','SEAFOOD-FILETES',10,'35.00','FROZEN','59.99','3.50'),(760,'FILETE TILAPIA 5-7','SEAFOOD-FILETES',10,'35.00','FROZEN','59.99','3.50'),(761,'FILETE TILAPIA 7-9','SEAFOOD-FILETES',10,'35.00','FROZEN','59.99','3.50'),(765,'SWAI 7-9','SEAFOOD-FILETES',15,'52.50','FROZEN','79.99','3.50'),(775,'SWAI 5-7','SEAFOOD-FILETES',15,'45.00','FROZEN','69.99','3.00'),(763,'WHOLE TILAPIA 550/750','SEAFOOD-PESCADOS',40,'120.00','FROZEN','169.99','3.00'),(780,'SEAFOOD MIX CJA','SEAFOOD-PESCADOS',24,'66.00','FROZEN','99.99','2.75'),(768,'FRIED FISH','SEAFOOD-PESCADOS',10,'69.00','FROZEN','99.99','6.90'),(352,'CHEDDAR BLK','DELI/HAM/CHEESE',1,'2.59','REFRIGERATED','4.99','2.59'),(350,'CHEDD SHRED 5#','DELI/HAM/CHEESE',20,'64.00','REFRIGERATED','89.99','3.20'),(351,'CHEDD FANCY 5#','DELI/HAM/CHEESE',20,'64.00','REFRIGERATED','89.99','3.20'),(362,'MONTERREY BLK','DELI/HAM/CHEESE',1,'2.59','REFRIGERATED','4.99','2.59'),(360,'MONT JK SHD 5#','DELI/HAM/CHEESE',20,'64.00','REFRIGERATED','89.99','3.20'),(361,'MONT FANCY 5#','DELI/HAM/CHEESE',20,'64.00','REFRIGERATED','89.99','3.20'),(353,'EZ MELT','DELI/HAM/CHEESE',30,'110.70','REFRIGERATED','149.99','3.69'),(367,'QUESO FRESCO','DELI/HAM/CHEESE',5,'19.95','REFRIGERATED','29.99','3.99'),(365,'MOZARRELLA','DELI/HAM/CHEESE',20,'64.00','REFRIGERATED','89.99','3.20'),(375,'DELI HAM','DELI/HAM/CHEESE',14,'40.46','REFRIGERATED','59.99','2.89'),(380,'MANTEQUILLA','DELI/HAM/CHEESE',1,'48.00','REFRIGERATED','69.99','48.00'),(381,'1 LB BUTTER','DELI/HAM/CHEESE',1,'3.99','REFRIGERATED','6.99','3.99'),(390,'SOUR CREAM BOTE','DELI/HAM/CHEESE',1,'10.99','REFRIGERATED','16.99','10.99'),(385,'COFFEE CREAM 400ct','DELI/HAM/CHEESE',400,'12.50','COLD','18.75','0.03'),(386,'HALF & HALF 400ct','DELI/HAM/CHEESE',400,'23.00','COLD','34.50','0.06'),(585,'MANTECA VEGETAL ROJA','DELI/HAM/CHEESE',35,'65.00','COLD','97.50','1.86'),(586,'MANTECA DE PUERCO','DELI/HAM/CHEESE',35,'72.00','COLD','108.00','2.06'),(580,'CLEAR LQD OIL 35#','DELI/HAM/CHEESE',35,'29.00','ROOM','43.50','0.83'),(395,'CHICHARRON 10#','DELI/HAM/CHEESE',10,'54.99','ROOM','82.49','5.50'),(388,'PACKETS SOUR CREAM','DELI/HAM/CHEESE',200,'16.00','COLD','24.00','0.08'),(371,'QUESO PANELA FUD 4#','DELI/HAM/CHEESE',4,'4.49','COLD','6.74','1.12'),(366,'REQUESON','DELI/HAM/CHEESE',10,'39.00','COLD','58.50','3.90'),(359,'QUESO COTIJA','DELI/HAM/CHEESE',5,'4.70','COLD','7.05','0.94'),(800,'COMINO MOLIDO','SPICES',5,'20.00','DRY','29.99','4.00'),(801,'FAJITA BLANCA','SPICES',5,'16.00','DRY','24.99','3.20'),(802,'FAJITA ROJA','SPICES',5,'16.00','DRY','24.99','3.20'),(803,'PAPRIKA','SPICES',5,'19.00','DRY','27.99','3.80'),(804,'PIMIENTA','SPICES',5,'35.00','DRY','49.99','7.00'),(805,'AJO MOLIDO','SPICES',5,'19.00','DRY','27.99','3.80'),(806,'CHILI POWDER','SPICES',5,'24.00','DRY','34.99','4.80'),(807,'HOJA DE LAUREL','SPICES',1,'7.00','DRY','11.99','7.00'),(808,'OREGANO','SPICES',1,'7.00','DRY','11.99','7.00'),(824,'CH. GUAJILLO','SPICES',15,'50.00','DRY','69.99','3.33'),(817,'CHILE ARBOL','SPICES',15,'50.00','DRY','69.99','3.33'),(570,'PINTO BEANS','DRY GOODS AND FLOUR',50,'37.00','DRY','49.99','0.74'),(553,'RICE ADOLPHUS','DRY GOODS AND FLOUR',50,'31.00','DRY','44.99','0.62'),(555,'SUGAR','DRY GOODS AND FLOUR',50,'39.00','DRY','54.99','0.78'),(560,'SALT','DRY GOODS AND FLOUR',25,'7.99','DRY','12.99','0.32'),(440,'FLOUR H&R 50lbs','DRY GOODS AND FLOUR',50,'18.50','DRY','27.99','0.37'),(441,'FLOUR H&R 25#','DRY GOODS AND FLOUR',25,'9.50','DRY','15.99','0.38'),(445,'UNICA FLOUR','DRY GOODS AND FLOUR',50,'19.99','DRY','29.99','0.40'),(447,'FLOUR WING 25#','DRY GOODS AND FLOUR',25,'30.00','DRY','45.00','1.20'),(442,'FLOUR ROSITA MIX 25#','DRY GOODS AND FLOUR',25,'27.99','DRY','41.99','1.12'),(444,'MASECA CAFE 50#','DRY GOODS AND FLOUR',50,'33.99','DRY','50.99','0.68'),(569,'NEGRA MASECA','DRY GOODS AND FLOUR',50,'39.99','DRY','59.99','0.80'),(451,'MORRISON PREMIX 12/2','DRY GOODS AND FLOUR',24,'42.00','DRY','63.00','1.75'),(449,'BLANCA MASECA','DRY GOODS AND FLOUR',50,'34.99','DRY','52.49','0.70'),(443,'PANCAKE MIX 10#','DRY GOODS AND FLOUR',10,'14.00','DRY','21.00','1.40'),(450,'CONTIGO FLOUR MIX','DRY GOODS AND FLOUR',25,'27.99','DRY','41.99','1.12'),(998,'PETER PAN FLOUR','DRY GOODS AND FLOUR',25,'13.99','DRY','20.99','0.56'),(453,'HARINA SUNNY TEXAS','DRY GOODS AND FLOUR',25,'24.00','DRY','36.00','0.96'),(470,'KETCHUP 1/1000','GROCERIES',1,'28.00','DRY','39.99','28.00'),(482,'KNORR AMARILLO','GROCERIES',1,'7.00','DRY','11.99','7.00'),(473,'TOMATE KNORR','GROCERIES',1,'8.00','DRY','12.99','8.00'),(520,'MIX JELLY','GROCERIES',1,'24.00','DRY','34.99','24.00'),(521,'STRAWBERRY JELLY','GROCERIES',1,'29.99','DRY','39.99','29.99'),(526,'SYRUP .5 GAL','GROCERIES',1,'8.99','DRY','14.99','8.99'),(501,'MAYONESA 1GAL','GROCERIES',1,'17.00','DRY','24.99','17.00'),(500,'MAYONESA PKTS 1/200','GROCERIES',1,'13.99','DRY','19.99','13.99'),(505,'MOSTAZA PKTS 1/200','GROCERIES',200,'12.99','DRY','19.49','0.06'),(506,'MOSTAZA GALON','GROCERIES',1,'7.00','DRY','10.50','7.00'),(510,'RANCH PKTS','GROCERIES',200,'27.00','DRY','40.50','0.14'),(527,'SYRUP PKTS','GROCERIES',200,'24.00','DRY','36.00','0.12'),(496,'WHITE GRAVY','GROCERIES',1,'24.99','DRY','37.49','24.99'),(502,'TARATAR SAUCE 1 gal','GROCERIES',1,'19.00','COLD','28.50','19.00'),(503,'TARTAR SAUCE PK','GROCERIES',200,'28.00','DRY','42.00','0.14'),(484,'RANCH 1GAL','GROCERIES',1,'19.99','COLD','29.99','19.99'),(492,'SOY SAUCE .5 GAL','GROCERIES',1,'9.99','DRY','14.99','9.99'),(530,'HUICHOL','GROCERIES',1,'20.00','DRY','30.00','20.00'),(536,'VINAGRE 2GAL','GROCERIES',2,'8.00','DRY','12.00','4.00'),(535,'VAINILLA 1 GALLON','GROCERIES',1,'25.00','DRY','37.50','25.00'),(519,'SPLENDA','GROCERIES',1000,'24.00','DRY','36.00','0.02'),(557,'SWEET N LOW','GROCERIES',1000,'17.00','DRY','25.50','0.02'),(556,'SUGAR PACKETS','GROCERIES',1000,'24.00','DRY','36.00','0.02'),(565,'PEPPER PKS 1000CT','GROCERIES',1000,'5.50','DRY','8.25','0.01'),(561,'SALT PKS 1200CT','GROCERIES',1200,'5.50','DRY','8.25','0.01'),(481,'MOLE 10# 25#','GROCERIES',25,'75.00','DRY','112.50','3.00'),(382,'PAN &GRILL 1 GAL','GROCERIES',1,'60.00','DRY','90.00','60.00'),(524,'MERMELADA FRESA TUBO','GROCERIES',1,'7.00','DRY','10.50','7.00'),(71,'CARNE MEX MINI TACOS','ASADAS',25,'3.95','FROZEN','5.93','0.16'),(77,'BEEF FOR TACOS FRESH','ASADAS',25,'4.99','COLD','7.49','0.20'),(94,'SLICE ASADA FREEZE','ASADAS',25,'5.29','FROZEN','7.94','0.21'),(1901,'CEBOLLA AMARILLA','PRODUCE',50,'24.99','COLD','37.49','0.50'),(1902,'CEBOLLA BLANCA','PRODUCE',50,'26.99','COLD','40.49','0.54'),(1903,'PAPA','PRODUCE',50,'29.99','COLD','44.99','0.60'),(649,'DISPENCER NAPKIN 1/10000','PAPER PRODUCTS',10000,'32.00','DRY','48.00','0.00'),(648,'QUIK-NAP 11905 1/6000','PAPER PRODUCTS',6000,'32.00','DRY','48.00','0.01'),(645,'BEVERAGE NAPKINS 1/4000','PAPER PRODUCTS',4000,'24.00','DRY','36.00','0.01'),(615,'SQUAT 4OZ 4J6','SQUATS',100,'40.00','DRY','60.00','0.40'),(620,'6JL LID','SQUATS',100,'40.00','DRY','60.00','0.40'),(651,'SQUAT 8 OZ 8j20','SQUATS',100,'57.00','DRY','85.50','0.57'),(691,'GUEST CKS 6000 c/copia/pas','ATRAS',6000,'45.00','DRY','67.50','0.01'),(692,'GUEST CKS 7000','ATRAS',7000,'45.00','DRY','67.50','0.01'),(690,'GUEST CKS 3632 N/copia','ATRAS',3632,'45.00','DRY','67.50','0.01'),(850,'COCACOLA MEX 16oz','BEVERAGE',24,'34.00','COLD','51.00','1.42'),(852,'FANTA ORANGE 16 oz','BEVERAGE',24,'34.00','COLD','51.00','1.42'),(851,'SPRITE MEX 16oz','BEVERAGE',24,'34.00','COLD','51.00','1.42'),(714,'FIBRA GRIS 12CT','QUIMICOS',12,'12.00','DRY','18.00','1.00'),(715,'GRILL BRICKS 12CT','QUIMICOS',12,'29.00','DRY','43.50','2.42'),(700,'OVEN & GRILL(TORO)GAL','QUIMICOS',1,'14.00','DRY','21.00','14.00'),(720,'CLEAR GLOVE L VINIL','QUIMICOS',100,'35.00','DRY','52.50','0.35'),(6992,'SALSA COMBO 1oz','COMBOS',100,'35.00','DRY','52.50','0.35'),(6112,'SALSA COMBO 0.75oz','COMBOS',100,'35.00','DRY','52.50','0.35'),(6902,'COMBO DRINKS 32onz','COMBOS',50,'50.00','DRY','75.00','1.00'),(6900,'COFFEE COMBO 16onz','COMBOS',50,'100.00','DRY','150.00','2.00'),(652,'SOUP SQUAT 8OZ','SOUP CUPS',100,'45.00','DRY','67.50','0.45'),(653,'SOUP SQUAT 16OZ','SOUP CUPS',100,'60.00','DRY','90.00','0.60'),(654,'SOUP SQUAT 32OZ','SOUP CUPS',100,'65.00','DRY','97.50','0.65'),(6812,'CUP 1.5 OZ','PALENQUES',100,'27.00','DRY','40.50','0.27'),(6823,'LID 1.5 OZ','PALENQUES',100,'27.00','DRY','40.50','0.27'),(867,'HORCHATA 1/8','SPECIALTY BEVERAGES',8,'90.00','DRY','135.00','11.25'),(876,'LA LECHERA 1/6','SPECIALTY BEVERAGES',6,'14.99','DRY','22.49','2.50'),(528,'LIME JUICE','SPECIALTY BEVERAGES',1,'9.00','DRY','13.50','9.00'),(460,'WHOLE TOMATOES 1/6','CANNED GOODS',6,'25.00','DRY','37.50','4.17'),(486,'WHITE HOMINY 1/6','CANNED GOODS',6,'40.99','DRY','61.49','6.83'),(489,'CACTUS 1/6','CANNED GOODS',6,'36.99','DRY','55.49','6.17');
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maintenance`
--

DROP TABLE IF EXISTS `Maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Maintenance` (
  `MaintenanceID` int(11) NOT NULL,
  `LicensePlate` varchar(20) default NULL,
  `ServiceDate` date default NULL,
  `EmployeeID` int(11) default NULL,
  `Description` varchar(200) default NULL,
  `Cost` decimal(10,2) default NULL,
  `PartsUsed` varchar(200) default NULL,
  `LaborHours` decimal(5,2) default NULL,
  `MaintenanceType` varchar(20) default NULL,
  PRIMARY KEY  (`MaintenanceID`),
  KEY `LicensePlate` (`LicensePlate`),
  KEY `EmployeeID` (`EmployeeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maintenance`
--

LOCK TABLES `Maintenance` WRITE;
/*!40000 ALTER TABLE `Maintenance` DISABLE KEYS */;
INSERT INTO `Maintenance` VALUES (1,'JKL3456','2024-10-01',NULL,'Transmission replacement','1500.00','Transmission, Fluids','10.50','Repair'),(2,'MNO7890','2024-10-15',NULL,'Brake system overhaul','800.00','Brake pads, Rotors','6.00','Repair'),(3,'ABC1234','2024-11-02',NULL,'Routine engine tune-up','250.00','Spark plugs, Oil','3.00','Routine'),(4,'DEF5678','2024-11-05',NULL,'Tire replacement and alignment','400.00','Tires, Alignment kit','4.50','Repair'),(5,'GHI9012','2024-11-10',NULL,'Oil change and filter replacement','75.00','Oil, Filter','1.50','Routine'),(6,'PQR2345','2024-11-12',NULL,'Battery replacement','120.00','Battery','1.00','Repair'),(7,'EMP1001','2024-09-15',3,'Brake pad replacement','150.00','Brake pads','2.50','Repair'),(8,'EMP1002','2024-09-18',4,'Engine diagnostics and tune-up','300.00','Diagnostics, Spark plugs','4.00','Routine'),(9,'EMP1003','2024-09-20',6,'Battery replacement','100.00','Battery','1.00','Repair'),(10,'EMP1004','2024-09-22',8,'Transmission fluid change','200.00','Transmission fluid','2.00','Routine'),(11,'EMP1005','2024-09-25',10,'Tire rotation','50.00','Labor only','1.00','Routine'),(12,'EMP1006','2024-10-01',12,'Exhaust system repair','450.00','Exhaust pipe','3.50','Repair'),(13,'EMP1007','2024-10-05',40,'Windshield replacement','250.00','Windshield','2.00','Repair'),(14,'EMP1008','2024-10-10',50,'Air conditioning repair','300.00','Coolant, Compressor','3.00','Repair'),(15,'EMP1009','2024-10-15',19,'Headlight replacement','80.00','Headlights','0.50','Repair'),(16,'EMP1010','2024-10-20',21,'Radiator flush','120.00','Coolant','1.50','Routine');
/*!40000 ALTER TABLE `Maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItem`
--

DROP TABLE IF EXISTS `OrderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderItem` (
  `OrderItemID` int(11) NOT NULL,
  `OrderID` int(11) default NULL,
  `ItemID` int(11) default NULL,
  `Quantity` int(11) default NULL,
  `WholesalePrice` decimal(10,2) default NULL,
  `RetailPrice` decimal(10,2) default NULL,
  `TotalAmount` decimal(10,2) default NULL,
  PRIMARY KEY  (`OrderItemID`),
  KEY `OrderID` (`OrderID`),
  KEY `ItemID` (`ItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItem`
--

LOCK TABLES `OrderItem` WRITE;
/*!40000 ALTER TABLE `OrderItem` DISABLE KEYS */;
INSERT INTO `OrderItem` VALUES (1,1,100,5,'35.90','45.99','179.50'),(2,2,131,3,'39.70','52.99','119.10'),(3,3,97,8,'48.00','62.99','384.00'),(4,4,74,10,'59.90','79.99','599.00'),(5,5,122,2,'47.90','61.99','95.80'),(6,6,570,4,'37.00','49.99','148.00'),(7,7,440,6,'18.50','27.99','111.00'),(8,8,553,7,'31.00','44.99','217.00'),(9,1,555,9,'39.00','54.99','351.00'),(10,2,78,12,'40.35','52.99','484.20');
/*!40000 ALTER TABLE `OrderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderTable`
--

DROP TABLE IF EXISTS `OrderTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderTable` (
  `OrderID` int(11) NOT NULL,
  `ClientID` int(11) default NULL,
  `OrderDate` date default NULL,
  `DeliveryDate` date default NULL,
  `OrderVehicleStatus` varchar(20) default NULL,
  `OrderStatus` varchar(20) default NULL,
  `TotalAmount` decimal(10,2) default NULL,
  `PaymentStatus` varchar(20) default NULL,
  `EmployeeID` int(11) default NULL,
  `RouteID` int(11) default NULL,
  PRIMARY KEY  (`OrderID`),
  KEY `ClientID` (`ClientID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `RouteID` (`RouteID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderTable`
--

LOCK TABLES `OrderTable` WRITE;
/*!40000 ALTER TABLE `OrderTable` DISABLE KEYS */;
INSERT INTO `OrderTable` VALUES (1,1,'2024-11-07','2024-11-08','Operational','Processing','500.00','Pending',3,1),(2,2,'2024-11-07','2024-11-09','Operational','Processing','350.00','Paid',4,2),(3,3,'2024-11-07','2024-11-10','Operational','Scheduled','275.00','Pending',6,3),(4,4,'2024-11-07','2024-11-10','Operational','In Progress','625.00','Paid',8,4),(5,5,'2024-11-08','2024-11-11','Operational','Scheduled','450.00','Pending',10,5),(6,6,'2024-11-08','2024-11-11','Operational','Processing','300.00','Paid',12,6),(7,7,'2024-11-08','2024-11-12','Operational','In Progress','520.00','Pending',40,7),(8,8,'2024-11-08','2024-11-12','Operational','Completed','415.00','Paid',50,8);
/*!40000 ALTER TABLE `OrderTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paycheck`
--

DROP TABLE IF EXISTS `Paycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paycheck` (
  `PaycheckID` int(11) NOT NULL,
  `PaymentDate` date default NULL,
  `NetPay` decimal(10,2) default NULL,
  `PayPeriodStart` date default NULL,
  `PayPeriodEnd` date default NULL,
  `PaymentMethod` varchar(20) default NULL,
  `RegularHours` decimal(5,2) default NULL,
  `OvertimeHours` decimal(5,2) default NULL,
  `GrossPay` decimal(10,2) default NULL,
  `Deductions` decimal(10,2) default NULL,
  `EmployeeID` int(11) default NULL,
  PRIMARY KEY  (`PaycheckID`),
  KEY `EmployeeID` (`EmployeeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paycheck`
--

LOCK TABLES `Paycheck` WRITE;
/*!40000 ALTER TABLE `Paycheck` DISABLE KEYS */;
INSERT INTO `Paycheck` VALUES (1,'2024-10-31','1650.00','2024-10-01','2024-10-31','Direct Deposit','160.00','10.00','1750.00','100.00',1),(2,'2024-10-31','6063.38','2024-10-01','2024-10-31','Check','160.00','5.00','6105.38','42.00',2),(3,'2024-10-31','1672.50','2024-10-01','2024-10-31','Direct Deposit','102.00','8.00','1710.00','37.50',3),(4,'2024-10-31','4280.93','2024-10-01','2024-10-31','Check','136.48','15.00','4530.93','250.00',4),(5,'2024-10-31','239733.60','2024-10-01','2024-10-31','Direct Deposit','160.00','0.00','240033.60','300.00',5),(6,'2024-10-31','287.27','2024-10-01','2024-10-31','Check','48.88','0.00','337.27','50.00',6),(7,'2024-10-31','6969.15','2024-10-01','2024-10-31','Direct Deposit','160.00','5.00','7038.35','69.20',7),(8,'2024-10-31','9941.00','2024-10-01','2024-10-31','Direct Deposit','148.00','12.00','10126.00','185.00',8),(9,'2024-10-31','13149.45','2024-10-01','2024-10-31','Check','160.00','10.00','13340.25','190.80',9),(10,'2024-10-31','889.82','2024-10-01','2024-10-31','Direct Deposit','48.48','4.00','909.82','20.00',10),(11,'2024-10-31','3757.60','2024-10-01','2024-10-31','Check','160.00','0.00','3857.60','100.00',11),(12,'2024-10-31','2400.00','2024-10-01','2024-10-31','Direct Deposit','160.00','0.00','2560.00','160.00',12),(13,'2024-10-31','3350.00','2024-10-01','2024-10-31','Direct Deposit','160.00','5.00','3350.00','0.00',18),(14,'2024-10-31','3668.75','2024-10-01','2024-10-31','Direct Deposit','160.00','5.00','3768.75','100.00',25),(15,'2024-10-31','2795.00','2024-10-01','2024-10-31','Check','140.00','10.00','2945.00','150.00',32),(16,'2024-10-31','1410.00','2024-10-01','2024-10-31','Direct Deposit','80.00','0.00','1440.00','30.00',40),(17,'2024-10-31','3461.25','2024-10-01','2024-10-31','Direct Deposit','160.00','5.00','3601.25','140.00',21),(18,'2024-10-31','3672.50','2024-10-01','2024-10-31','Check','160.00','5.00','3852.50','180.00',27),(19,'2024-10-31','3830.00','2024-10-01','2024-10-31','Direct Deposit','160.00','5.00','4020.00','190.00',35),(20,'2024-10-31','1370.00','2024-10-01','2024-10-31','Direct Deposit','80.00','0.00','1400.00','30.00',19),(21,'2024-10-31','3200.00','2024-10-01','2024-10-31','Direct Deposit','160.00','0.00','3280.00','80.00',42),(22,'2024-10-31','950.00','2024-10-01','2024-10-31','Check','60.00','0.00','960.00','10.00',50),(23,'2024-10-31','3800.00','2024-10-01','2024-10-31','Direct Deposit','160.00','0.00','4000.00','200.00',23);
/*!40000 ALTER TABLE `Paycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Route`
--

DROP TABLE IF EXISTS `Route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Route` (
  `RouteID` int(11) NOT NULL,
  `EmployeeID` int(11) default NULL,
  `LicensePlate` varchar(15) default NULL,
  `RouteDate` date default NULL,
  `RouteVehicleStatus` varchar(20) default NULL,
  `StartTime` time default NULL,
  `EndTime` time default NULL,
  `TotalStops` int(11) default NULL,
  `EstimatedMileage` decimal(5,2) default NULL,
  `RouteStatus` varchar(20) default NULL,
  PRIMARY KEY  (`RouteID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `LicensePlate` (`LicensePlate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Route`
--

LOCK TABLES `Route` WRITE;
/*!40000 ALTER TABLE `Route` DISABLE KEYS */;
INSERT INTO `Route` VALUES (1,3,'ABC1234','2024-11-07','Operational','11:00:00','15:00:00',5,'60.50','Completed'),(2,4,'DEF5678','2024-11-07','Operational','12:00:00','16:30:00',4,'52.30','Completed'),(3,6,'GHI9012','2024-11-07','Operational','13:30:00','17:45:00',6,'72.10','In Progress'),(4,8,'PQR2345','2024-11-07','Operational','14:00:00','18:30:00',3,'45.00','Scheduled'),(5,10,'ABC1234','2024-11-08','Operational','11:15:00','15:45:00',5,'58.60','Scheduled'),(6,12,'DEF5678','2024-11-08','Operational','12:30:00','17:00:00',4,'53.80','Scheduled'),(7,40,'GHI9012','2024-11-08','Operational','13:45:00','18:00:00',6,'74.20','In Progress'),(8,50,'PQR2345','2024-11-08','Operational','11:15:00','15:30:00',5,'65.70','Completed');
/*!40000 ALTER TABLE `Route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockChange`
--

DROP TABLE IF EXISTS `StockChange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockChange` (
  `StockChangeID` int(11) NOT NULL,
  `ItemID` int(11) default NULL,
  `StockChangeDate` date default NULL,
  `QuantityChange` int(11) default NULL,
  `Reason` varchar(200) default NULL,
  `ClientID` int(11) default NULL,
  PRIMARY KEY  (`StockChangeID`),
  KEY `ItemID` (`ItemID`),
  KEY `ClientID` (`ClientID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockChange`
--

LOCK TABLES `StockChange` WRITE;
/*!40000 ALTER TABLE `StockChange` DISABLE KEYS */;
INSERT INTO `StockChange` VALUES (1,100,'2020-03-15',20,'Damaged items',5),(2,131,'2021-07-22',15,'Damaged items',8),(3,97,'2022-11-05',10,'Dissatisfied',3),(4,74,'2020-01-12',5,'Expired',10),(5,122,'2023-06-30',30,'Damaged items',1),(6,570,'2021-09-19',10,'Dissatisfied',7),(7,440,'2022-02-14',25,'Packaging defect',4),(8,553,'2023-08-25',20,'Damaged items',9),(9,555,'2024-04-18',15,'Dissatisfied',2),(10,78,'2020-12-07',5,'Quality issue',6);
/*!40000 ALTER TABLE `StockChange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier` (
  `SupplierID` int(11) NOT NULL,
  `CompanyName` varchar(50) default NULL,
  `CompanyPerson` varchar(30) default NULL,
  `ContactInfo` varchar(50) default NULL,
  `ActiveStatus` varchar(10) default NULL,
  `ProductCategories` varchar(100) default NULL,
  `PreferredDeliveryDays` varchar(50) default NULL,
  `PaymentTerm` varchar(25) default NULL,
  PRIMARY KEY  (`SupplierID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (1,'Cargill','Emily Carter','emily.carter@cargill.com','Active','Meat, Grain','Monday, Wednesday','Net 30'),(2,'Excel Fresh Meats','Robert Lewis','robert.lewis@excelmeats.com','Active','Beef, Pork','Tuesday, Thursday','Net 15'),(3,'Swift','Alice Thompson','alice.thompson@swift.com','Active','Poultry, Beef','Wednesday, Friday','Net 30'),(4,'Sukarne','Javier Delgado','javier.delgado@sukarne.com','Active','Beef, Lamb','Monday, Thursday','Net 45'),(5,'Sam\'s Club','Bin Sacc','bin.sacc@example.com','Active','General Grocery, Meat','Friday','Cash on Delivery'),(6,'Sysco','Karen Baker','karen.baker@sysco.com','Active','Fresh Produce, Meat','Tuesday, Thursday','Net 30'),(7,'US Foods','Tom Gray','tom.gray@usfoods.com','Active','Frozen Foods, Meat','Monday, Friday','Net 30'),(8,'Performance Food Group','Laura Black','laura.black@pfg.com','Active','Meat, Seafood','Wednesday','Net 15');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SupplierItem`
--

DROP TABLE IF EXISTS `SupplierItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SupplierItem` (
  `SupplierID` int(11) NOT NULL default '0',
  `ItemID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`SupplierID`,`ItemID`),
  KEY `ItemID` (`ItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SupplierItem`
--

LOCK TABLES `SupplierItem` WRITE;
/*!40000 ALTER TABLE `SupplierItem` DISABLE KEYS */;
INSERT INTO `SupplierItem` VALUES (1,100),(1,105),(1,108),(1,109),(1,111),(1,112),(1,114),(1,115),(1,116),(1,119),(1,121),(1,122),(1,123),(1,125),(1,126),(1,127),(1,130),(1,131),(1,132),(1,196),(1,197),(1,213),(1,440),(1,441),(1,442),(1,443),(1,444),(1,445),(1,447),(1,449),(1,450),(1,451),(1,453),(1,553),(1,555),(1,560),(1,569),(1,570),(1,998),(1,1001),(1,1100),(2,35),(2,37),(2,40),(2,41),(2,45),(2,67),(2,70),(2,72),(2,74),(2,75),(2,76),(2,78),(2,83),(2,84),(2,85),(2,86),(2,91),(2,93),(2,95),(2,96),(2,97),(2,98),(2,99),(2,124),(2,125),(2,222),(2,400),(2,401),(2,406),(2,407),(2,411),(2,412),(2,422),(2,430),(2,431),(2,432),(3,50),(3,51),(3,55),(3,60),(3,64),(3,65),(3,66),(3,100),(3,105),(3,108),(3,109),(3,111),(3,112),(3,114),(3,115),(3,116),(3,119),(3,121),(3,122),(3,123),(3,125),(3,126),(3,127),(3,130),(3,131),(3,132),(3,196),(3,197),(3,213),(3,745),(3,1001),(3,1100),(4,46),(4,196),(4,197),(4,202),(4,211),(4,213),(4,220),(4,230),(4,250),(4,270),(4,280),(4,321),(4,330),(4,332),(4,550),(4,551),(4,664),(4,1100),(5,350),(5,351),(5,352),(5,353),(5,359),(5,360),(5,361),(5,362),(5,365),(5,366),(5,367),(5,371),(5,375),(5,380),(5,381),(5,382),(5,385),(5,386),(5,388),(5,390),(5,395),(5,460),(5,470),(5,473),(5,481),(5,482),(5,484),(5,486),(5,489),(5,492),(5,496),(5,500),(5,501),(5,502),(5,503),(5,505),(5,506),(5,510),(5,519),(5,520),(5,521),(5,524),(5,526),(5,527),(5,530),(5,535),(5,536),(5,556),(5,557),(5,561),(5,565),(5,580),(5,585),(5,586),(5,800),(5,801),(5,802),(5,803),(5,804),(5,805),(5,806),(5,807),(5,808),(5,817),(5,824),(6,615),(6,620),(6,645),(6,648),(6,649),(6,651),(6,652),(6,653),(6,654),(6,1901),(6,1902),(6,1903),(6,6812),(6,6823),(7,35),(7,37),(7,40),(7,41),(7,45),(7,50),(7,51),(7,55),(7,60),(7,64),(7,65),(7,66),(7,67),(7,70),(7,71),(7,72),(7,74),(7,75),(7,76),(7,78),(7,83),(7,84),(7,85),(7,86),(7,91),(7,93),(7,94),(7,95),(7,96),(7,97),(7,98),(7,99),(7,100),(7,105),(7,108),(7,109),(7,111),(7,112),(7,114),(7,115),(7,116),(7,119),(7,121),(7,122),(7,123),(7,124),(7,125),(7,126),(7,127),(7,130),(7,131),(7,132),(7,196),(7,197),(7,213),(7,222),(7,528),(7,550),(7,551),(7,664),(7,734),(7,735),(7,745),(7,750),(7,751),(7,753),(7,754),(7,755),(7,756),(7,758),(7,759),(7,760),(7,761),(7,762),(7,763),(7,765),(7,766),(7,768),(7,775),(7,780),(7,850),(7,851),(7,852),(7,867),(7,876),(7,1001),(7,1100),(8,71),(8,77),(8,94),(8,690),(8,691),(8,692),(8,700),(8,714),(8,715),(8,720),(8,734),(8,735),(8,750),(8,751),(8,753),(8,754),(8,755),(8,756),(8,758),(8,759),(8,760),(8,761),(8,762),(8,763),(8,765),(8,766),(8,768),(8,775),(8,780),(8,6112),(8,6900),(8,6902),(8,6992);
/*!40000 ALTER TABLE `SupplierItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehicle` (
  `LicensePlate` varchar(20) NOT NULL,
  `VehicleType` varchar(20) NOT NULL,
  `LastMaintenanceDate` date default NULL,
  `OperationStatus` varchar(20) NOT NULL,
  `Capacity` int(11) default NULL,
  `InsurancePolicyNumber` varchar(50) default NULL,
  `PurchaseDate` date NOT NULL,
  PRIMARY KEY  (`LicensePlate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
INSERT INTO `Vehicle` VALUES ('ABC1234','Box Truck','2023-06-15','Operational',2000,'POL123456789','2020-05-10'),('DEF5678','Box Truck','2023-04-20','Operational',2200,'POL987654321','2019-08-14'),('GHI9012','Box Truck','2023-07-12','Operational',2100,'POL543216789','2021-03-25'),('JKL3456','Box Truck','2023-03-01','Broken Down',2300,'POL222333444','2021-04-11'),('MNO7890','Box Truck','2023-02-15','Broken Down',2500,'POL333444555','2018-09-05'),('PQR2345','Van','2023-06-10','Operational',1000,'POL111222333','2022-01-17');
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-08  0:49:57
