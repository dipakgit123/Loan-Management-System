# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     bank_application
# Server version:               5.1.73-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2024-05-27 10:17:14
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for bank_application
CREATE DATABASE IF NOT EXISTS `bank_application` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bank_application`;


# Dumping structure for table bank_application.acc_details
CREATE TABLE IF NOT EXISTS `acc_details` (
  `accno` text,
  `uname` text,
  `acc_type` text,
  `details` text,
  `bank_id` text,
  `Status` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table bank_application.acc_details: 5 rows
/*!40000 ALTER TABLE `acc_details` DISABLE KEYS */;
INSERT INTO `acc_details` (`accno`, `uname`, `acc_type`, `details`, `bank_id`, `Status`) VALUES ('6877497', 'om', 'SAVING', 'dkjfgksl', '1', NULL), ('5478985', 'jitu', 'SAVING', 'jdksf', '2', NULL), ('6000858', 'abcd', 'SAVING', '10000', '2', 'Accept'), ('9765426', 'deepak', 'SAVING', '10000', '1', 'Accept'), ('4777789', 'Nilesh', 'SAVING', 'student', '1', 'Accept');
/*!40000 ALTER TABLE `acc_details` ENABLE KEYS */;


# Dumping structure for table bank_application.bank_details
CREATE TABLE IF NOT EXISTS `bank_details` (
  `bank_Id` int(11) NOT NULL AUTO_INCREMENT,
  `bname` text,
  `bpass` text,
  `sec_question` text,
  `answer` text,
  `address` text,
  `email` text,
  `mobile` text,
  PRIMARY KEY (`bank_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

# Dumping data for table bank_application.bank_details: 2 rows
/*!40000 ALTER TABLE `bank_details` DISABLE KEYS */;
INSERT INTO `bank_details` (`bank_Id`, `bname`, `bpass`, `sec_question`, `answer`, `address`, `email`, `mobile`) VALUES (1, 'sbi', 'Aa123@', 'Your First School Name', 'infest', 's', 'sbi@gmail.com', '8888888888'), (2, 'ICICI', 'Aa123@', 'Your First School Name', 'a', 'pune', 'icici@gmail.com', '8888888888');
/*!40000 ALTER TABLE `bank_details` ENABLE KEYS */;


# Dumping structure for table bank_application.newaccount
CREATE TABLE IF NOT EXISTS `newaccount` (
  `accountno` int(10) DEFAULT NULL,
  `USERNAME` text,
  `PASSWORD` text,
  `REPASSWORD` text,
  `AMOUNT` text,
  `ADDRESS` text,
  `PHONE` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table bank_application.newaccount: 0 rows
/*!40000 ALTER TABLE `newaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `newaccount` ENABLE KEYS */;


# Dumping structure for table bank_application.otpcodetble
CREATE TABLE IF NOT EXISTS `otpcodetble` (
  `email` text,
  `otpcode` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table bank_application.otpcodetble: 3 rows
/*!40000 ALTER TABLE `otpcodetble` DISABLE KEYS */;
INSERT INTO `otpcodetble` (`email`, `otpcode`) VALUES ('abcd@gmail.com', '0'), ('deepak@gmail.com', '0'), ('nilesh@gmail.com', '0');
/*!40000 ALTER TABLE `otpcodetble` ENABLE KEYS */;


# Dumping structure for table bank_application.tblaccountbank
CREATE TABLE IF NOT EXISTS `tblaccountbank` (
  `bid` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` text,
  `BankName` text,
  `AccountType` text,
  `AccountDetails` text,
  `Accountno` text,
  `bank_id` text NOT NULL,
  `Amount_Account` text NOT NULL,
  `Status` text NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

# Dumping data for table bank_application.tblaccountbank: 5 rows
/*!40000 ALTER TABLE `tblaccountbank` DISABLE KEYS */;
INSERT INTO `tblaccountbank` (`bid`, `UserName`, `BankName`, `AccountType`, `AccountDetails`, `Accountno`, `bank_id`, `Amount_Account`, `Status`) VALUES (2, 'om', 'sbi@gmail.com', 'SAVING', 'dkjfgksl', '6877497', '1', '5500', ''), (3, 'jitu', 'icici@gmail.com', 'SAVING', 'jdksf', '5478985', '2', '1000', ''), (4, 'abcd', 'icici@gmail.com', 'SAVING', '10000', '6000858', '2', '2', '0'), (5, 'deepak', 'sbi@gmail.com', 'SAVING', '10000', '9765426', '1', '0', '0'), (6, 'Nilesh', 'sbi@gmail.com', 'SAVING', 'student', '4777789', '1', '6500', '0');
/*!40000 ALTER TABLE `tblaccountbank` ENABLE KEYS */;


# Dumping structure for table bank_application.tbl_loan_process
CREATE TABLE IF NOT EXISTS `tbl_loan_process` (
  `Lid` int(10) NOT NULL AUTO_INCREMENT,
  `User_Name` text,
  `Email_ID` longtext,
  `Mobile_No` longtext,
  `Company_Name` longtext,
  `Company_Address` longtext,
  `Applicant_Income` longtext,
  `CoApplicant_Income` longtext,
  `Loan_Amount` longtext,
  `Loan_Amount_Term` longtext,
  `Date_Application` longtext,
  `Bank_Email_ID` longtext,
  `Status_Loan` longtext,
  `Credit_score` longtext,
  `Types_Loans` longtext,
  `Intrest_per` longtext,
  PRIMARY KEY (`Lid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

# Dumping data for table bank_application.tbl_loan_process: 1 rows
/*!40000 ALTER TABLE `tbl_loan_process` DISABLE KEYS */;
INSERT INTO `tbl_loan_process` (`Lid`, `User_Name`, `Email_ID`, `Mobile_No`, `Company_Name`, `Company_Address`, `Applicant_Income`, `CoApplicant_Income`, `Loan_Amount`, `Loan_Amount_Term`, `Date_Application`, `Bank_Email_ID`, `Status_Loan`, `Credit_score`, `Types_Loans`, `Intrest_per`) VALUES (1, 'Nilesh', 'nilesh@gmail.com', '9874563210', 'abc', 'jhfj', '100', '100', '200', '30', 'Mon May 20 11:07:57 IST 2024', 'sbi@gmail.com', 'Accept', '700', 'Home_Loan', '9.35');
/*!40000 ALTER TABLE `tbl_loan_process` ENABLE KEYS */;


# Dumping structure for table bank_application.transferotpcode
CREATE TABLE IF NOT EXISTS `transferotpcode` (
  `email` text,
  `otpcode` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table bank_application.transferotpcode: 3 rows
/*!40000 ALTER TABLE `transferotpcode` DISABLE KEYS */;
INSERT INTO `transferotpcode` (`email`, `otpcode`) VALUES ('jitusunsofttech@gmail.com', 'NYWRC'), ('abcd@gmail.com', 'URKJQ'), ('nilesh@gmail.com', 'GQFWR');
/*!40000 ALTER TABLE `transferotpcode` ENABLE KEYS */;


# Dumping structure for table bank_application.tx_details
CREATE TABLE IF NOT EXISTS `tx_details` (
  `tx_id` int(10) NOT NULL AUTO_INCREMENT,
  `uname` text,
  `acc_no` text,
  `operation` text,
  `amt` text,
  `balance` text,
  `time1` text,
  `isnew` text,
  `Destination` text,
  `T_ID` text,
  PRIMARY KEY (`tx_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

# Dumping data for table bank_application.tx_details: 20 rows
/*!40000 ALTER TABLE `tx_details` DISABLE KEYS */;
INSERT INTO `tx_details` (`tx_id`, `uname`, `acc_no`, `operation`, `amt`, `balance`, `time1`, `isnew`, `Destination`, `T_ID`) VALUES (1, 'om', '5179801', 'DEPOSITE', '1000', '2500', 'Wed Feb 12 17:41:16 IST 2020', 'NO', 'self', '196808'), (2, 'om', '5179801', 'DEPOSITE', '1500', '2650', 'Wed Feb 12 17:46:46 IST 2020', 'NO', 'self', '137645'), (3, 'om', '5179801', 'DEPOSITE', '150', '2655', 'Wed Feb 12 17:47:56 IST 2020', 'NO', 'self', '161436'), (4, 'om', '5179801', 'DEPOSITE', '5', '2655', 'Wed Feb 12 17:49:10 IST 2020', 'YES', 'self', '161436'), (8, 'om', '5179801', 'WITHDRAW', '5', '2650', 'Wed Feb 12 18:13:30 IST 2020', 'YES', NULL, NULL), (9, 'om', '5179801', 'WITHDRAW', '15', '2635', 'Wed Feb 12 18:15:37 IST 2020', 'YES', 'self', '164136'), (10, 'om', '5179801', 'WITHDRAW', '50', '2585', 'Wed Feb 12 18:16:49 IST 2020', 'YES', 'self', '194617'), (11, 'om', '5179801', 'WITHDRAW', '55', '1429', 'Wed Feb 12 18:17:30 IST 2020', 'YES', 'self', '112154'), (15, 'om', '5179801', 'TRANSFER', '1429', '1500', 'Wed Feb 12 18:34:56 IST 2020', 'YES', '5478985', '174568'), (16, 'om', '5179801', 'TRANSFER', '500', '1000', 'Wed Feb 12 18:37:21 IST 2020', 'YES', '5478985', '151767'), (17, 'jitu', '5478985', 'DEPOSITE', '150', '651', 'Wed Feb 12 18:41:22 IST 2020', 'NO', 'self', '142520'), (18, 'jitu', '5478985', 'DEPOSITE', '1', '2600', 'Wed Feb 12 18:42:51 IST 2020', 'NO', 'self', '118555'), (19, 'jitu', '5478985', 'DEPOSITE', '20', '2600', 'Wed Feb 12 18:44:25 IST 2020', 'YES', 'self', '118555'), (20, 'jitu', '5478985', 'WITHDRAW', '1000', '1600', 'Fri Feb 14 18:42:00 IST 2020', 'YES', 'self', '141430'), (21, 'jitu', '5478985', 'TRANSFER', '600', '1000', 'Sat Feb 15 10:55:56 IST 2020', 'YES', '6877497', '123247'), (22, 'abcd', '6000858', 'DEPOSITE', '1', '3', 'Thu Nov 09 16:19:08 IST 2023', 'NO', 'self', '151502'), (23, 'abcd', '6000858', 'DEPOSITE', '2', '3', 'Thu Nov 09 16:20:44 IST 2023', 'YES', 'self', '151502'), (24, 'abcd', '6000858', 'TRANSFER', '1', '2', 'Thu Nov 09 16:21:38 IST 2023', 'YES', '6877497', '173599'), (25, 'Nilesh', '4777789', 'DEPOSITE', '12000', '12000', 'Thu Jan 11 12:55:12 IST 2024', 'YES', 'self', '128670'), (26, 'Nilesh', '4777789', 'TRANSFER', '5500', '6500', 'Thu Jan 11 12:56:06 IST 2024', 'YES', '6877497', '153597');
/*!40000 ALTER TABLE `tx_details` ENABLE KEYS */;


# Dumping structure for table bank_application.user_details
CREATE TABLE IF NOT EXISTS `user_details` (
  `uname` text,
  `upass` text,
  `sec_question` text,
  `answer` text,
  `address` text,
  `email` text,
  `mobile` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table bank_application.user_details: 6 rows
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` (`uname`, `upass`, `sec_question`, `answer`, `address`, `email`, `mobile`) VALUES ('jitu', 'Aa123@', 'Your Car Number', 'Mh12ps8888', 'pune', 'jitusunsofttech@gmail.com', '8605067524'), ('om', 'Aa123@', 'Your Mothers Name', 'hjgj', 'pune', 'om@gmail.com', '8605067524'), ('a', 'Aa123@', 'null', 'a', 'p', 'admin@gmail.com', '8888888881'), ('abcd', 'A@a123', 'Your First School Name', 'aa', 'pune', 'abcd@gmail.com', '9876543210'), ('deepak', 'Dp@123', 'Your First School Name', 'aa', 'pune', 'deepak@gmail.com', '9874563210'), ('Nilesh', 'Ni@123', 'Your First School Name', 'nilu', 'pune', 'nilesh@gmail.com', '9874563210');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;


# Dumping structure for table bank_application.withdrawotpcode
CREATE TABLE IF NOT EXISTS `withdrawotpcode` (
  `email` text,
  `otpcode` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table bank_application.withdrawotpcode: 1 rows
/*!40000 ALTER TABLE `withdrawotpcode` DISABLE KEYS */;
INSERT INTO `withdrawotpcode` (`email`, `otpcode`) VALUES ('jitusunsofttech@gmail.com', 'NAOHQ');
/*!40000 ALTER TABLE `withdrawotpcode` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
