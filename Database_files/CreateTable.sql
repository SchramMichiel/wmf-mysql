USE `mydb`

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `UserID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Group` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Group` (
  `GroupID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`GroupID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BetweenTableUserGroup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`BetweenTableUserGroup` ;

CREATE TABLE IF NOT EXISTS `mydb`.`BetweenTableUserGroup` (
  `UserID` INT NOT NULL,
  `GroupID` INT NOT NULL,
  PRIMARY KEY (`UserID`, `GroupID`),
  INDEX `fk_Groupid_idx` (`GroupID` ASC),
  CONSTRAINT `fk_UserID`
    FOREIGN KEY (`UserID`)
    REFERENCES `mydb`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GroupID`
    FOREIGN KEY (`GroupID`)
    REFERENCES `mydb`.`Group` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Expenses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Expenses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Expenses` (
  `ExpensesID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(110) NOT NULL,
  `Amount` FLOAT NULL,
  `UserID` INT UNSIGNED NOT NULL,
  `GroupID` INT UNSIGNED NOT NULL,
  `Date` DATE NULL,
  `PayedWhole` TINYINT NOT NULL,
  PRIMARY KEY (`ExpensesID`),
  INDEX `fk_Expenses_User1_idx` (`UserID` ASC),
  INDEX `fk_Expenses_Group1_idx` (`GroupID` ASC),
  CONSTRAINT `fk_Expenses_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `mydb`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Expenses_Group1`
    FOREIGN KEY (`GroupID`)
    REFERENCES `mydb`.`Group` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Owed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Owed` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Owed` (
  `Expenses_ExpensesID` INT UNSIGNED NOT NULL,
  `User_UserID` INT UNSIGNED NOT NULL,
  `Amount` FLOAT NOT NULL,
  PRIMARY KEY (`Expenses_ExpensesID`, `User_UserID`),
  INDEX `fk_Owed_Expenses1_idx` (`Expenses_ExpensesID` ASC),
  INDEX `fk_Owed_User1_idx` (`User_UserID` ASC),
  CONSTRAINT `fk_Owed_Expenses1`
    FOREIGN KEY (`Expenses_ExpensesID`)
    REFERENCES `mydb`.`Expenses` (`ExpensesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Owed_User1`
    FOREIGN KEY (`User_UserID`)
    REFERENCES `mydb`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`debt_pvp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`debt_pvp` ;

CREATE TABLE IF NOT EXISTS `mydb`.`debt_pvp` (
  `peepee1` INT NOT NULL,
  `peepee2` INT NOT NULL,
  `Amount` FLOAT NULL,
  PRIMARY KEY (`peepee1`, `peepee2`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
