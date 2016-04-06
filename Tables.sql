
CREATE TABLE Users(
  userID NUMBER PRIMARY KEY,
  name VARCHAR2(40) NOT NULL,
  email VARCHAR2(50) NOT NULL UNIQUE,
  dob TIMESTAMP NOT NULL,
  lastLogin TIMESTAMP
);

INSERT INTO Users VALUES(0,'Brian Martin', 'BrianMartin@gmail.com', TIMESTAMP '2016-04-07 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(1,'Donald White', 'DonaldWhite@gmail.com', TIMESTAMP '2016-04-08 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(2,'Robert Moore', 'RobertMoore@gmail.com', TIMESTAMP '2016-04-09 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(3,'Richard Davis', 'RichardDavis@gmail.com', TIMESTAMP '2016-04-10 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(4,'Paul Robinson', 'PaulRobinson@gmail.com', TIMESTAMP '2016-04-11 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(5,'Christopher Anderson', 'ChristopherAnderson@gmail.com', TIMESTAMP '2016-04-12 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(6,'Donald Harris', 'DonaldHarris@gmail.com', TIMESTAMP '2016-04-13 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(7,'Thomas Harris', 'ThomasHarris@gmail.com', TIMESTAMP '2016-04-14 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(8,'John Thompson', 'JohnThompson@gmail.com', TIMESTAMP '2016-04-15 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(9,'Thomas Williams', 'ThomasWilliams@gmail.com', TIMESTAMP '2016-04-16 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(10,'Robert Thomas', 'RobertThomas@gmail.com', TIMESTAMP '2016-04-17 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(11,'James Thompson', 'JamesThompson@gmail.com', TIMESTAMP '2016-04-18 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(12,'George White', 'GeorgeWhite@gmail.com', TIMESTAMP '2016-04-19 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(13,'Kenneth Taylor', 'KennethTaylor@gmail.com', TIMESTAMP '2016-04-20 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(14,'Mark Brown', 'MarkBrown@gmail.com', TIMESTAMP '2016-04-21 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(15,'John Brown', 'JohnBrown@gmail.com', TIMESTAMP '2016-04-22 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(16,'David Jackson', 'DavidJackson@gmail.com', TIMESTAMP '2016-04-23 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(17,'George Thomas', 'GeorgeThomas@gmail.com', TIMESTAMP '2016-04-24 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(18,'Mark White', 'MarkWhite@gmail.com', TIMESTAMP '2016-04-25 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(19,'Mark Smith', 'MarkSmith@gmail.com', TIMESTAMP '2016-04-26 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(20,'Charles Miller', 'CharlesMiller@gmail.com', TIMESTAMP '2016-04-27 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(21,'Paul Jackson', 'PaulJackson@gmail.com', TIMESTAMP '2016-04-28 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(22,'John Miller', 'JohnMiller@gmail.com', TIMESTAMP '2016-04-29 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(23,'Kenneth Brown', 'KennethBrown@gmail.com', TIMESTAMP '2016-04-30 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(24,'John Jones', 'JohnJones@gmail.com', TIMESTAMP '2016-05-01 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(25,'Mark Davis', 'MarkDavis@gmail.com', TIMESTAMP '2016-05-02 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(26,'Brian Smith', 'BrianSmith@gmail.com', TIMESTAMP '2016-05-03 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(27,'Christopher Taylor', 'ChristopherTaylor@gmail.com', TIMESTAMP '2016-05-04 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(28,'Charles White', 'CharlesWhite@gmail.com', TIMESTAMP '2016-05-05 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(29,'Kenneth Smith', 'KennethSmith@gmail.com', TIMESTAMP '2016-05-06 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(30,'William Garcia', 'WilliamGarcia@gmail.com', TIMESTAMP '2016-05-07 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(31,'John Davis', 'JohnDavis@gmail.com', TIMESTAMP '2016-05-08 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(32,'William Davis', 'WilliamDavis@gmail.com', TIMESTAMP '2016-05-09 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(33,'Joseph Wilson', 'JosephWilson@gmail.com', TIMESTAMP '2016-05-10 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(34,'Thomas Moore', 'ThomasMoore@gmail.com', TIMESTAMP '2016-05-11 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(35,'Donald Davis', 'DonaldDavis@gmail.com', TIMESTAMP '2016-05-12 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(36,'Brian Johnson', 'BrianJohnson@gmail.com', TIMESTAMP '2016-05-13 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(37,'Charles Harris', 'CharlesHarris@gmail.com', TIMESTAMP '2016-05-14 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(38,'Edward White', 'EdwardWhite@gmail.com', TIMESTAMP '2016-05-15 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(39,'Charles Davis', 'CharlesDavis@gmail.com', TIMESTAMP '2016-05-16 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(40,'George Martinez', 'GeorgeMartinez@gmail.com', TIMESTAMP '2016-05-17 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(41,'Brian Jones', 'BrianJones@gmail.com', TIMESTAMP '2016-05-18 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(42,'Mark Williams', 'MarkWilliams@gmail.com', TIMESTAMP '2016-05-19 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(43,'Michael Jones', 'MichaelJones@gmail.com', TIMESTAMP '2016-05-20 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(44,'Steven Jones', 'StevenJones@gmail.com', TIMESTAMP '2016-05-21 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(45,'Charles Moore', 'CharlesMoore@gmail.com', TIMESTAMP '2016-05-22 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(46,'Mark Smith', 'MarkSmith@gmail.com', TIMESTAMP '2016-05-23 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(47,'Charles Moore', 'CharlesMoore@gmail.com', TIMESTAMP '2016-05-24 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(48,'Thomas Jones', 'ThomasJones@gmail.com', TIMESTAMP '2016-05-25 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(49,'James Davis', 'JamesDavis@gmail.com', TIMESTAMP '2016-05-26 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(50,'Paul Martinez', 'PaulMartinez@gmail.com', TIMESTAMP '2016-05-27 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(51,'David Smith', 'DavidSmith@gmail.com', TIMESTAMP '2016-05-28 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(52,'James Wilson', 'JamesWilson@gmail.com', TIMESTAMP '2016-05-29 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(53,'Christopher Garcia', 'ChristopherGarcia@gmail.com', TIMESTAMP '2016-05-30 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(54,'Charles Johnson', 'CharlesJohnson@gmail.com', TIMESTAMP '2016-05-31 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(55,'David Taylor', 'DavidTaylor@gmail.com', TIMESTAMP '2016-06-01 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(56,'Edward Taylor', 'EdwardTaylor@gmail.com', TIMESTAMP '2016-06-02 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(57,'Brian Taylor', 'BrianTaylor@gmail.com', TIMESTAMP '2016-06-03 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(58,'Richard Miller', 'RichardMiller@gmail.com', TIMESTAMP '2016-06-04 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(59,'Thomas Davis', 'ThomasDavis@gmail.com', TIMESTAMP '2016-06-05 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(60,'Thomas Harris', 'ThomasHarris@gmail.com', TIMESTAMP '2016-06-06 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(61,'James White', 'JamesWhite@gmail.com', TIMESTAMP '2016-06-07 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(62,'Brian White', 'BrianWhite@gmail.com', TIMESTAMP '2016-06-08 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(63,'Charles Thomas', 'CharlesThomas@gmail.com', TIMESTAMP '2016-06-09 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(64,'Daniel Garcia', 'DanielGarcia@gmail.com', TIMESTAMP '2016-06-10 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(65,'Thomas Thompson', 'ThomasThompson@gmail.com', TIMESTAMP '2016-06-11 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(66,'Edward Wilson', 'EdwardWilson@gmail.com', TIMESTAMP '2016-06-12 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(67,'Daniel Taylor', 'DanielTaylor@gmail.com', TIMESTAMP '2016-06-13 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(68,'Edward Thompson', 'EdwardThompson@gmail.com', TIMESTAMP '2016-06-14 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(69,'Michael Jackson', 'MichaelJackson@gmail.com', TIMESTAMP '2016-06-15 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(70,'Brian Thompson', 'BrianThompson@gmail.com', TIMESTAMP '2016-06-16 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(71,'Michael White', 'MichaelWhite@gmail.com', TIMESTAMP '2016-06-17 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(72,'Charles Garcia', 'CharlesGarcia@gmail.com', TIMESTAMP '2016-06-18 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(73,'Thomas Wilson', 'ThomasWilson@gmail.com', TIMESTAMP '2016-06-19 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(74,'Kenneth Miller', 'KennethMiller@gmail.com', TIMESTAMP '2016-06-20 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(75,'William Martin', 'WilliamMartin@gmail.com', TIMESTAMP '2016-06-21 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(76,'Steven Martin', 'StevenMartin@gmail.com', TIMESTAMP '2016-06-22 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(77,'John Thomas', 'JohnThomas@gmail.com', TIMESTAMP '2016-06-23 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(78,'Christopher Brown', 'ChristopherBrown@gmail.com', TIMESTAMP '2016-06-24 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(79,'Brian Smith', 'BrianSmith@gmail.com', TIMESTAMP '2016-06-25 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(80,'James Jackson', 'JamesJackson@gmail.com', TIMESTAMP '2016-06-26 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(81,'John Williams', 'JohnWilliams@gmail.com', TIMESTAMP '2016-06-27 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(82,'Thomas Wilson', 'ThomasWilson@gmail.com', TIMESTAMP '2016-06-28 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(83,'Charles Taylor', 'CharlesTaylor@gmail.com', TIMESTAMP '2016-06-29 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(84,'Joseph Garcia', 'JosephGarcia@gmail.com', TIMESTAMP '2016-06-30 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(85,'James Taylor', 'JamesTaylor@gmail.com', TIMESTAMP '2016-07-01 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(86,'Christopher Brown', 'ChristopherBrown@gmail.com', TIMESTAMP '2016-07-02 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(87,'George Brown', 'GeorgeBrown@gmail.com', TIMESTAMP '2016-07-03 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(88,'Steven Harris', 'StevenHarris@gmail.com', TIMESTAMP '2016-07-04 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(89,'William Taylor', 'WilliamTaylor@gmail.com', TIMESTAMP '2016-07-05 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(90,'Richard Jones', 'RichardJones@gmail.com', TIMESTAMP '2016-07-06 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(91,'Brian White', 'BrianWhite@gmail.com', TIMESTAMP '2016-07-07 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(92,'Daniel Garcia', 'DanielGarcia@gmail.com', TIMESTAMP '2016-07-08 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(93,'James Garcia', 'JamesGarcia@gmail.com', TIMESTAMP '2016-07-09 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(94,'Christopher Johnson', 'ChristopherJohnson@gmail.com', TIMESTAMP '2016-07-10 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(95,'John Miller', 'JohnMiller@gmail.com', TIMESTAMP '2016-07-11 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(96,'Steven Thomas', 'StevenThomas@gmail.com', TIMESTAMP '2016-07-12 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(97,'John Davis', 'JohnDavis@gmail.com', TIMESTAMP '2016-07-13 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(98,'Edward Martinez', 'EdwardMartinez@gmail.com', TIMESTAMP '2016-07-14 11:39:22',TIMESTAMP '2016-04-06 11:39:22');
INSERT INTO Users VALUES(99,'Donald Martin', 'DonaldMartin@gmail.com', TIMESTAMP '2016-07-15 11:39:22',TIMESTAMP '2016-04-06 11:39:22');