CREATE TABLE IF NOT EXISTS `borsa` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Label` varchar(50) NOT NULL,
  `Attuale` double DEFAULT NULL,
  `Min` double NOT NULL,
  `Max` double NOT NULL,
  `Med` double unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`)
)
