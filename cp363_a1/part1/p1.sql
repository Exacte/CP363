CREATE TABLE `cp363_a1`.`suppliers` (
    `sid` INT NOT NULL,
    `sname` VARCHAR(45),
    `address` VARCHAR(45),
    PRIMARY KEY (`sid`)
);

CREATE TABLE `cp363_a1`.`parts` (
    `pid` INT NOT NULL,
    `pname` VARCHAR(45),
    `colour` VARCHAR(45),
    PRIMARY KEY (`pid`)
);

CREATE TABLE `cp363_a1`.`catalog` (
    `sid` VARCHAR(45) NOT NULL,
    `pid` VARCHAR(45) NOT NULL,
    `cost` VARCHAR(45),
    PRIMARY KEY (`sid` , `pid`),
    FOREIGN KEY (`sid`)
        REFERENCES suppliers (`sid`),
    FOREIGN KEY (`pid`)
        REFERENCES parts (`pid`)
);

