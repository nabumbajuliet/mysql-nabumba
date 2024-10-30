-- Active: 1728711505202@@127.0.0.1@3306@farmer
SHOW TABLES;
CREATE TABLE farmer(
    farmerID INT AUTO_INCREMENT,
    fname VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    conatct VARCHAR(20),
    PRIMARY KEY(farmerID)
);
CREATE TABLE crop(
    cropID INT AUTO_INCREMENT,
    cropname VARCHAR(50) NOT NULL,
    ctype VARCHAR(45),
    season VARCHAR(45),
    PRIMARY KEY(cropID)
);
CREATE TABLE farmer_crop(
    farmerID INT,
    cropID INT,
    area_cultivated FLOAT,
    yield INT,
    PRIMARY KEY(farmerID,cropID),
    FOREIGN KEY(farmerID) REFERENCES farmer(farmerID),
    FOREIGN KEY(cropID) REFERENCES crop(cropID)
);
ALTER TABLE farmer
ADD Email VARCHAR(50);
DESCRIBE farmer;
ALTER TABLE farmer
    DROP Email;
    CREATE TABLE user(
        userID INT PRIMARY KEY,
        uname VARCHAR(45)
    );
    DROP TABLE user;
    INSERT INTO farmer(fname,address,conatct)
    VALUES("john kyambadde","kibinge village","0753464454"),
    ("sarah nambi","kawanga town","0754598449"),
    ("paul okello","lwengo district","0745397594");
    SELECT*FROM farmer;