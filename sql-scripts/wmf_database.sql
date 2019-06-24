-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP DATABASE IF EXISTS mydb ;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

CREATE DATABASE mydb;
use mydb;
-- -----------------------------------------------------
-- Table mydb.Client
-- -----------------------------------------------------
drop table if exists mydb.Client;

create table mydb.Client(
  ClientID INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Name varchar(45) NOT NULL,
  Password varchar(45),
  Email varchar(45)
);

-- -----------------------------------------------------
-- Table mydb.Groups
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.Groups;

CREATE TABLE mydb.Groups(
  GroupsID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Name varchar(45) NOT NULL
  );

-- -----------------------------------------------------
-- Table mydb.BetweenTableClientGroups
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.BetweenTableClientGroups ;

CREATE TABLE  mydb.BetweenTableClientGroups (
  ClientID INT NOT NULL,
  GroupsID INT NOT NULL,
  PRIMARY KEY (ClientID, GroupsID),
  INDEX fk_Groupsid_idx (GroupsID ASC),
  CONSTRAINT fk_ClientID
    FOREIGN KEY (ClientID) REFERENCES mydb.Client(ClientID),
  CONSTRAINT fk_GroupsID
    FOREIGN KEY (GroupsID) REFERENCES mydb.Groups(GroupsID)
    );


-- -----------------------------------------------------
-- Table mydb.Expenses
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.Expenses ;

CREATE TABLE  mydb.Expenses (
  ExpensesID INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Name varchar(110) NOT NULL,
  Amount FLOAT NULL,
  ClientID INT  NOT NULL,
  GroupsID INT  NOT NULL,
  Date DATE NULL,
  PayedWhole TINYINT NOT NULL,
  CONSTRAINT fk_Expenses_Client1
    FOREIGN KEY (ClientID) REFERENCES mydb.Client(ClientID),
  CONSTRAINT fk_Expenses_Groups1
    FOREIGN KEY (GroupsID) REFERENCES mydb.Groups(GroupsID)
);


-- -----------------------------------------------------
-- Table mydb.Owed
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.Owed ;

CREATE TABLE mydb.Owed (
  Expenses_ExpensesID INT NOT NULL,
  Client_ClientID INT  NOT NULL,
  Amount FLOAT NOT NULL,
  PRIMARY KEY (Expenses_ExpensesID, Client_ClientID),
  INDEX fk_Owed_Expenses1_idx (Expenses_ExpensesID ASC),
  INDEX fk_Owed_Client1_idx (Client_ClientID ASC),
  CONSTRAINT fk_Owed_Expenses1
    FOREIGN KEY (Expenses_ExpensesID) REFERENCES mydb.Expenses (ExpensesID) ,
  CONSTRAINT fk_Owed_Client1
    FOREIGN KEY (Client_ClientID) REFERENCES mydb.Client (ClientID)
);


-- -----------------------------------------------------
-- Table mydb.debt_pvp
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.debt_pvp ;

CREATE TABLE mydb.debt_pvp (
  peepee1 INT NOT NULL,
  peepee2 INT NOT NULL,
  Amount FLOAT NULL,
  PRIMARY KEY (peepee1, peepee2)
  );


