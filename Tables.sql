
CREATE TABLE Users(
  userID NUMBER PRIMARY KEY,
  name VARCHAR2(40) NOT NULL,
  email VARCHAR2(50) NOT NULL UNIQUE,
  dob TIMESTAMP NOT NULL,
  lastLogin TIMESTAMP
);
CREATE SEQUENCE UsersSEQ
  START WITH 1
  INCREMENT BY 1
  CACHE 100;

  CREATE OR REPLACE TRIGGER UserIDTrig
    BEFORE INSERT ON Users
    FOR EACH ROW
  BEGIN
    :new.userID := UsersSEQ.nextval;
  END;


CREATE TABLE Friendships(
  userID1 NUMBER,
  userID2 NUMBER,
  confirmed BOOLEAN,
  PRIMARY KEY (userID1,userID2),
  FOREIGN KEY(userID1) references Users(userID),
  FOREIGN KEY(userID2) references Users(userID)
);
CREATE TABLE Groups(
  name VARCHAR2(30) PRIMARY KEY,
  description VARCHAR2(100),
  maxMems NUMBER NOT NULL,
  members VARCHAR2(3000) NOT NULL -- Not sure if this is the best way to store this
);
CREATE Table Messages(
  msgID NUMBER PRIMARY KEY,
  recID NUMBER NOT NULL,
  senID NUMBER NOT NULL,
  subj VARCHAR2(30),
  msgTxt VARCHAR2(100) NOT NULL,
  dateSent TIMESTAMP NOT NULL,
  FOREIGN KEY(recID) references Users(userID),
  FOREIGN KEY(senID) references Users(userID)
);

INSERT INTO Users VALUES(0,'Mark Robinson', 'MarkRobinson@gmail.com', TIMESTAMP '2016-04-07 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(1,'Christopher Jones', 'ChristopherJones@gmail.com', TIMESTAMP '2016-04-08 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(2,'Robert Davis', 'RobertDavis@gmail.com', TIMESTAMP '2016-04-09 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(3,'Brian Davis', 'BrianDavis@gmail.com', TIMESTAMP '2016-04-10 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(4,'Robert Johnson', 'RobertJohnson@gmail.com', TIMESTAMP '2016-04-11 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(5,'Richard Martinez', 'RichardMartinez@gmail.com', TIMESTAMP '2016-04-12 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(6,'Steven Brown', 'StevenBrown@gmail.com', TIMESTAMP '2016-04-13 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(7,'Mark Brown', 'MarkBrown@gmail.com', TIMESTAMP '2016-04-14 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(8,'Paul Thomas', 'PaulThomas@gmail.com', TIMESTAMP '2016-04-15 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(9,'Edward Johnson', 'EdwardJohnson@gmail.com', TIMESTAMP '2016-04-16 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(10,'Michael Brown', 'MichaelBrown@gmail.com', TIMESTAMP '2016-04-17 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(11,'Joseph Smith', 'JosephSmith@gmail.com', TIMESTAMP '2016-04-18 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(12,'Brian Miller', 'BrianMiller@gmail.com', TIMESTAMP '2016-04-19 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(13,'Richard Brown', 'RichardBrown@gmail.com', TIMESTAMP '2016-04-20 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(14,'Edward Martinez', 'EdwardMartinez@gmail.com', TIMESTAMP '2016-04-21 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(15,'David Martinez', 'DavidMartinez@gmail.com', TIMESTAMP '2016-04-22 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(16,'George Robinson', 'GeorgeRobinson@gmail.com', TIMESTAMP '2016-04-23 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(17,'Robert White', 'RobertWhite@gmail.com', TIMESTAMP '2016-04-24 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(18,'Donald Miller', 'DonaldMiller@gmail.com', TIMESTAMP '2016-04-25 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(19,'Edward Wilson', 'EdwardWilson@gmail.com', TIMESTAMP '2016-04-26 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(20,'Steven Taylor', 'StevenTaylor@gmail.com', TIMESTAMP '2016-04-27 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(21,'David Moore', 'DavidMoore@gmail.com', TIMESTAMP '2016-04-28 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(22,'Steven Johnson', 'StevenJohnson@gmail.com', TIMESTAMP '2016-04-29 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(23,'Thomas Garcia', 'ThomasGarcia@gmail.com', TIMESTAMP '2016-04-30 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(24,'Daniel Miller', 'DanielMiller@gmail.com', TIMESTAMP '2016-05-01 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(25,'Donald Moore', 'DonaldMoore@gmail.com', TIMESTAMP '2016-05-02 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(26,'Richard Martin', 'RichardMartin@gmail.com', TIMESTAMP '2016-05-03 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(27,'John Jackson', 'JohnJackson@gmail.com', TIMESTAMP '2016-05-04 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(28,'Michael Martin', 'MichaelMartin@gmail.com', TIMESTAMP '2016-05-05 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(29,'John Moore', 'JohnMoore@gmail.com', TIMESTAMP '2016-05-06 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(30,'William Anderson', 'WilliamAnderson@gmail.com', TIMESTAMP '2016-05-07 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(31,'Mark Thomas', 'MarkThomas@gmail.com', TIMESTAMP '2016-05-08 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(32,'Kenneth Taylor', 'KennethTaylor@gmail.com', TIMESTAMP '2016-05-09 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(33,'John Wilson', 'JohnWilson@gmail.com', TIMESTAMP '2016-05-10 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(34,'James Wilson', 'JamesWilson@gmail.com', TIMESTAMP '2016-05-11 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(35,'Charles Thomas', 'CharlesThomas@gmail.com', TIMESTAMP '2016-05-12 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(36,'Paul Jackson', 'PaulJackson@gmail.com', TIMESTAMP '2016-05-13 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(37,'Edward Harris', 'EdwardHarris@gmail.com', TIMESTAMP '2016-05-14 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(38,'John Davis', 'JohnDavis@gmail.com', TIMESTAMP '2016-05-15 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(39,'James Williams', 'JamesWilliams@gmail.com', TIMESTAMP '2016-05-16 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(40,'Robert Smith', 'RobertSmith@gmail.com', TIMESTAMP '2016-05-17 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(41,'Brian White', 'BrianWhite@gmail.com', TIMESTAMP '2016-05-18 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(42,'John Garcia', 'JohnGarcia@gmail.com', TIMESTAMP '2016-05-19 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(43,'Edward Jones', 'EdwardJones@gmail.com', TIMESTAMP '2016-05-20 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(44,'Daniel Martin', 'DanielMartin@gmail.com', TIMESTAMP '2016-05-21 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(45,'Joseph Wilson', 'JosephWilson@gmail.com', TIMESTAMP '2016-05-22 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(46,'Charles Johnson', 'CharlesJohnson@gmail.com', TIMESTAMP '2016-05-23 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(47,'George Williams', 'GeorgeWilliams@gmail.com', TIMESTAMP '2016-05-24 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(48,'Brian Brown', 'BrianBrown@gmail.com', TIMESTAMP '2016-05-25 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(49,'Richard Garcia', 'RichardGarcia@gmail.com', TIMESTAMP '2016-05-26 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(50,'Richard Wilson', 'RichardWilson@gmail.com', TIMESTAMP '2016-05-27 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(51,'Mark Taylor', 'MarkTaylor@gmail.com', TIMESTAMP '2016-05-28 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(52,'Joseph Williams', 'JosephWilliams@gmail.com', TIMESTAMP '2016-05-29 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(53,'Daniel Brown', 'DanielBrown@gmail.com', TIMESTAMP '2016-05-30 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(54,'David Harris', 'DavidHarris@gmail.com', TIMESTAMP '2016-05-31 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(55,'William Thompson', 'WilliamThompson@gmail.com', TIMESTAMP '2016-06-01 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(56,'Edward Miller', 'EdwardMiller@gmail.com', TIMESTAMP '2016-06-02 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(57,'Brian Garcia', 'BrianGarcia@gmail.com', TIMESTAMP '2016-06-03 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(58,'George White', 'GeorgeWhite@gmail.com', TIMESTAMP '2016-06-04 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(59,'Steven Thompson', 'StevenThompson@gmail.com', TIMESTAMP '2016-06-05 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(60,'Richard Davis', 'RichardDavis@gmail.com', TIMESTAMP '2016-06-06 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(61,'Daniel White', 'DanielWhite@gmail.com', TIMESTAMP '2016-06-07 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(62,'Thomas Thomas', 'ThomasThomas@gmail.com', TIMESTAMP '2016-06-08 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(63,'William Thomas', 'WilliamThomas@gmail.com', TIMESTAMP '2016-06-09 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(64,'Charles Davis', 'CharlesDavis@gmail.com', TIMESTAMP '2016-06-10 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(65,'Joseph Anderson', 'JosephAnderson@gmail.com', TIMESTAMP '2016-06-11 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(66,'Charles Wilson', 'CharlesWilson@gmail.com', TIMESTAMP '2016-06-12 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(67,'George Thomas', 'GeorgeThomas@gmail.com', TIMESTAMP '2016-06-13 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(68,'Steven Smith', 'StevenSmith@gmail.com', TIMESTAMP '2016-06-14 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(69,'Edward Anderson', 'EdwardAnderson@gmail.com', TIMESTAMP '2016-06-15 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(70,'Michael Miller', 'MichaelMiller@gmail.com', TIMESTAMP '2016-06-16 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(71,'Robert Thompson', 'RobertThompson@gmail.com', TIMESTAMP '2016-06-17 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(72,'Thomas Wilson', 'ThomasWilson@gmail.com', TIMESTAMP '2016-06-18 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(73,'James Thomas', 'JamesThomas@gmail.com', TIMESTAMP '2016-06-19 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(74,'Steven Miller', 'StevenMiller@gmail.com', TIMESTAMP '2016-06-20 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(75,'Brian Robinson', 'BrianRobinson@gmail.com', TIMESTAMP '2016-06-21 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(76,'Paul Martin', 'PaulMartin@gmail.com', TIMESTAMP '2016-06-22 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(77,'James Jackson', 'JamesJackson@gmail.com', TIMESTAMP '2016-06-23 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(78,'Thomas Johnson', 'ThomasJohnson@gmail.com', TIMESTAMP '2016-06-24 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(79,'Paul Martinez', 'PaulMartinez@gmail.com', TIMESTAMP '2016-06-25 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(80,'James Brown', 'JamesBrown@gmail.com', TIMESTAMP '2016-06-26 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(81,'Joseph Robinson', 'JosephRobinson@gmail.com', TIMESTAMP '2016-06-27 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(82,'Richard Moore', 'RichardMoore@gmail.com', TIMESTAMP '2016-06-28 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(83,'Michael Harris', 'MichaelHarris@gmail.com', TIMESTAMP '2016-06-29 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(84,'Michael Johnson', 'MichaelJohnson@gmail.com', TIMESTAMP '2016-06-30 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(85,'Donald Thompson', 'DonaldThompson@gmail.com', TIMESTAMP '2016-07-01 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(86,'Paul Moore', 'PaulMoore@gmail.com', TIMESTAMP '2016-07-02 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(87,'Kenneth Jones', 'KennethJones@gmail.com', TIMESTAMP '2016-07-03 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(88,'Daniel Jackson', 'DanielJackson@gmail.com', TIMESTAMP '2016-07-04 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(89,'Edward Thomas', 'EdwardThomas@gmail.com', TIMESTAMP '2016-07-05 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(90,'Mark Miller', 'MarkMiller@gmail.com', TIMESTAMP '2016-07-06 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(91,'Robert Jackson', 'RobertJackson@gmail.com', TIMESTAMP '2016-07-07 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(92,'Kenneth Miller', 'KennethMiller@gmail.com', TIMESTAMP '2016-07-08 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(93,'John Brown', 'JohnBrown@gmail.com', TIMESTAMP '2016-07-09 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(94,'Kenneth White', 'KennethWhite@gmail.com', TIMESTAMP '2016-07-10 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(95,'Kenneth Harris', 'KennethHarris@gmail.com', TIMESTAMP '2016-07-11 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(96,'Daniel Smith', 'DanielSmith@gmail.com', TIMESTAMP '2016-07-12 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(97,'Paul Taylor', 'PaulTaylor@gmail.com', TIMESTAMP '2016-07-13 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(98,'Donald Wilson', 'DonaldWilson@gmail.com', TIMESTAMP '2016-07-14 11:54:39',TIMESTAMP '2016-04-06 11:54:39');
INSERT INTO Users VALUES(99,'Daniel Jones', 'DanielJones@gmail.com', TIMESTAMP '2016-07-15 11:54:39',TIMESTAMP '2016-04-06 11:54:39');

INSERT INTO Friendships VALUES( 91, 39, true );
INSERT INTO Friendships VALUES( 36, 26, true );
INSERT INTO Friendships VALUES( 40, 97, true );
INSERT INTO Friendships VALUES( 2, 21, true );
INSERT INTO Friendships VALUES( 4, 43, true );
INSERT INTO Friendships VALUES( 97, 52, false );
INSERT INTO Friendships VALUES( 95, 44, true );
INSERT INTO Friendships VALUES( 6, 34, true );
INSERT INTO Friendships VALUES( 10, 53, false );
INSERT INTO Friendships VALUES( 2, 28, true );
INSERT INTO Friendships VALUES( 53, 27, false );
INSERT INTO Friendships VALUES( 46, 24, true );
INSERT INTO Friendships VALUES( 76, 14, true );
INSERT INTO Friendships VALUES( 80, 41, true );
INSERT INTO Friendships VALUES( 53, 67, false );
INSERT INTO Friendships VALUES( 50, 93, false );
INSERT INTO Friendships VALUES( 79, 5, false );
INSERT INTO Friendships VALUES( 91, 8, true );
INSERT INTO Friendships VALUES( 82, 96, true );
INSERT INTO Friendships VALUES( 71, 93, true );
INSERT INTO Friendships VALUES( 99, 2, false );
INSERT INTO Friendships VALUES( 45, 64, true );
INSERT INTO Friendships VALUES( 36, 73, false );
INSERT INTO Friendships VALUES( 80, 84, true );
INSERT INTO Friendships VALUES( 68, 48, false );
INSERT INTO Friendships VALUES( 68, 71, true );
INSERT INTO Friendships VALUES( 63, 73, true );
INSERT INTO Friendships VALUES( 78, 62, true );
INSERT INTO Friendships VALUES( 27, 1, false );
INSERT INTO Friendships VALUES( 72, 44, false );
INSERT INTO Friendships VALUES( 12, 51, true );
INSERT INTO Friendships VALUES( 13, 42, true );
INSERT INTO Friendships VALUES( 94, 24, true );
INSERT INTO Friendships VALUES( 61, 99, true );
INSERT INTO Friendships VALUES( 25, 2, true );
INSERT INTO Friendships VALUES( 70, 83, false );
INSERT INTO Friendships VALUES( 92, 1, true );
INSERT INTO Friendships VALUES( 37, 86, false );
INSERT INTO Friendships VALUES( 52, 60, true );
INSERT INTO Friendships VALUES( 74, 20, false );
INSERT INTO Friendships VALUES( 45, 77, false );
INSERT INTO Friendships VALUES( 72, 47, false );
INSERT INTO Friendships VALUES( 86, 98, true );
INSERT INTO Friendships VALUES( 63, 18, true );
INSERT INTO Friendships VALUES( 53, 36, false );
INSERT INTO Friendships VALUES( 85, 74, false );
INSERT INTO Friendships VALUES( 86, 79, true );
INSERT INTO Friendships VALUES( 28, 56, false );
INSERT INTO Friendships VALUES( 20, 90, true );
INSERT INTO Friendships VALUES( 35, 46, true );
INSERT INTO Friendships VALUES( 73, 19, true );
INSERT INTO Friendships VALUES( 77, 8, false );
INSERT INTO Friendships VALUES( 68, 51, true );
INSERT INTO Friendships VALUES( 2, 6, true );
INSERT INTO Friendships VALUES( 65, 38, false );
INSERT INTO Friendships VALUES( 88, 79, true );
INSERT INTO Friendships VALUES( 99, 48, false );
INSERT INTO Friendships VALUES( 87, 7, false );
INSERT INTO Friendships VALUES( 7, 64, true );
INSERT INTO Friendships VALUES( 64, 24, false );
INSERT INTO Friendships VALUES( 99, 8, false );
INSERT INTO Friendships VALUES( 61, 46, true );
INSERT INTO Friendships VALUES( 26, 67, false );
INSERT INTO Friendships VALUES( 71, 59, false );
INSERT INTO Friendships VALUES( 59, 86, false );
INSERT INTO Friendships VALUES( 99, 24, false );
INSERT INTO Friendships VALUES( 10, 92, true );
INSERT INTO Friendships VALUES( 16, 36, true );
INSERT INTO Friendships VALUES( 31, 1, true );
INSERT INTO Friendships VALUES( 49, 40, false );
INSERT INTO Friendships VALUES( 73, 12, true );
INSERT INTO Friendships VALUES( 75, 99, false );
INSERT INTO Friendships VALUES( 55, 42, true );
INSERT INTO Friendships VALUES( 92, 18, false );
INSERT INTO Friendships VALUES( 27, 66, false );
INSERT INTO Friendships VALUES( 80, 74, false );
INSERT INTO Friendships VALUES( 84, 54, false );
INSERT INTO Friendships VALUES( 53, 41, false );
INSERT INTO Friendships VALUES( 78, 13, false );
INSERT INTO Friendships VALUES( 22, 53, false );
INSERT INTO Friendships VALUES( 75, 70, true );
INSERT INTO Friendships VALUES( 24, 59, false );
INSERT INTO Friendships VALUES( 93, 57, false );
INSERT INTO Friendships VALUES( 78, 53, true );
INSERT INTO Friendships VALUES( 36, 61, true );
INSERT INTO Friendships VALUES( 78, 18, false );
INSERT INTO Friendships VALUES( 85, 42, false );
INSERT INTO Friendships VALUES( 81, 51, true );
INSERT INTO Friendships VALUES( 42, 36, false );
INSERT INTO Friendships VALUES( 19, 75, true );
INSERT INTO Friendships VALUES( 99, 84, true );
INSERT INTO Friendships VALUES( 97, 57, true );
INSERT INTO Friendships VALUES( 91, 89, false );
INSERT INTO Friendships VALUES( 25, 43, false );
INSERT INTO Friendships VALUES( 1, 0, true );
INSERT INTO Friendships VALUES( 35, 29, true );
INSERT INTO Friendships VALUES( 23, 35, true );
INSERT INTO Friendships VALUES( 21, 62, true );
INSERT INTO Friendships VALUES( 66, 65, true );
INSERT INTO Friendships VALUES( 6, 35, false );
INSERT INTO Friendships VALUES( 21, 95, false );
INSERT INTO Friendships VALUES( 70, 46, true );
INSERT INTO Friendships VALUES( 23, 9, false );
INSERT INTO Friendships VALUES( 31, 22, false );
INSERT INTO Friendships VALUES( 92, 13, true );
INSERT INTO Friendships VALUES( 3, 76, false );
INSERT INTO Friendships VALUES( 40, 16, false );
INSERT INTO Friendships VALUES( 68, 90, true );
INSERT INTO Friendships VALUES( 94, 77, false );
INSERT INTO Friendships VALUES( 9, 35, true );
INSERT INTO Friendships VALUES( 35, 3, true );
INSERT INTO Friendships VALUES( 79, 93, false );
INSERT INTO Friendships VALUES( 76, 1, true );
INSERT INTO Friendships VALUES( 43, 22, false );
INSERT INTO Friendships VALUES( 76, 86, true );
INSERT INTO Friendships VALUES( 63, 84, true );
INSERT INTO Friendships VALUES( 50, 63, false );
INSERT INTO Friendships VALUES( 31, 51, false );
INSERT INTO Friendships VALUES( 13, 52, true );
INSERT INTO Friendships VALUES( 78, 54, false );
INSERT INTO Friendships VALUES( 52, 68, true );
INSERT INTO Friendships VALUES( 5, 10, true );
INSERT INTO Friendships VALUES( 89, 92, true );
INSERT INTO Friendships VALUES( 58, 49, false );
INSERT INTO Friendships VALUES( 10, 67, true );
INSERT INTO Friendships VALUES( 7, 39, false );
INSERT INTO Friendships VALUES( 48, 92, false );
INSERT INTO Friendships VALUES( 85, 1, false );
INSERT INTO Friendships VALUES( 86, 8, false );
INSERT INTO Friendships VALUES( 74, 23, true );
INSERT INTO Friendships VALUES( 53, 97, false );
INSERT INTO Friendships VALUES( 50, 36, false );
INSERT INTO Friendships VALUES( 85, 11, false );
INSERT INTO Friendships VALUES( 83, 26, false );
INSERT INTO Friendships VALUES( 39, 32, false );
INSERT INTO Friendships VALUES( 73, 0, true );
INSERT INTO Friendships VALUES( 36, 45, false );
INSERT INTO Friendships VALUES( 57, 72, true );
INSERT INTO Friendships VALUES( 96, 12, true );
INSERT INTO Friendships VALUES( 18, 8, true );
INSERT INTO Friendships VALUES( 37, 99, true );
INSERT INTO Friendships VALUES( 89, 53, false );
INSERT INTO Friendships VALUES( 79, 3, false );
INSERT INTO Friendships VALUES( 8, 70, true );
INSERT INTO Friendships VALUES( 44, 65, true );
INSERT INTO Friendships VALUES( 51, 99, true );
INSERT INTO Friendships VALUES( 21, 78, true );
INSERT INTO Friendships VALUES( 99, 31, true );
INSERT INTO Friendships VALUES( 23, 77, false );
INSERT INTO Friendships VALUES( 98, 44, true );
INSERT INTO Friendships VALUES( 88, 14, false );
INSERT INTO Friendships VALUES( 9, 46, false );
INSERT INTO Friendships VALUES( 52, 26, false );
INSERT INTO Friendships VALUES( 77, 12, false );
INSERT INTO Friendships VALUES( 53, 84, false );
INSERT INTO Friendships VALUES( 66, 44, true );
INSERT INTO Friendships VALUES( 92, 62, false );
INSERT INTO Friendships VALUES( 75, 33, false );
INSERT INTO Friendships VALUES( 54, 29, false );
INSERT INTO Friendships VALUES( 67, 68, false );
INSERT INTO Friendships VALUES( 34, 68, true );
INSERT INTO Friendships VALUES( 27, 34, true );
INSERT INTO Friendships VALUES( 76, 73, true );
INSERT INTO Friendships VALUES( 62, 79, true );
INSERT INTO Friendships VALUES( 8, 73, false );
INSERT INTO Friendships VALUES( 54, 47, true );
INSERT INTO Friendships VALUES( 70, 26, true );
INSERT INTO Friendships VALUES( 32, 42, true );
INSERT INTO Friendships VALUES( 22, 75, true );
INSERT INTO Friendships VALUES( 95, 45, false );
INSERT INTO Friendships VALUES( 93, 97, false );
INSERT INTO Friendships VALUES( 74, 0, true );
INSERT INTO Friendships VALUES( 0, 58, true );
INSERT INTO Friendships VALUES( 75, 66, true );
INSERT INTO Friendships VALUES( 18, 85, false );
INSERT INTO Friendships VALUES( 70, 84, true );
INSERT INTO Friendships VALUES( 82, 35, true );
INSERT INTO Friendships VALUES( 98, 28, false );
INSERT INTO Friendships VALUES( 76, 70, true );
INSERT INTO Friendships VALUES( 91, 77, true );
INSERT INTO Friendships VALUES( 62, 98, false );
INSERT INTO Friendships VALUES( 43, 8, true );
INSERT INTO Friendships VALUES( 6, 29, true );
INSERT INTO Friendships VALUES( 60, 12, true );
INSERT INTO Friendships VALUES( 69, 4, false );
INSERT INTO Friendships VALUES( 27, 3, true );
INSERT INTO Friendships VALUES( 54, 74, true );
INSERT INTO Friendships VALUES( 97, 26, true );
INSERT INTO Friendships VALUES( 62, 72, false );
INSERT INTO Friendships VALUES( 48, 19, false );
INSERT INTO Friendships VALUES( 3, 19, true );
INSERT INTO Friendships VALUES( 1, 77, true );
INSERT INTO Friendships VALUES( 91, 74, true );
INSERT INTO Friendships VALUES( 89, 35, false );
INSERT INTO Friendships VALUES( 32, 34, false );
INSERT INTO Friendships VALUES( 46, 63, false );
INSERT INTO Friendships VALUES( 3, 71, true );
INSERT INTO Friendships VALUES( 42, 43, true );
INSERT INTO Friendships VALUES( 10, 16, false );
INSERT INTO Friendships VALUES( 67, 73, true );
