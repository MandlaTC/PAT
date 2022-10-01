-- Active: 1663787280064@@127.0.0.1@3306@testDB

CREATE TABLE
    IF NOT EXISTS user (
        userID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        userName VARCHAR(255),
        userSurname VARCHAR(255),
        userEmail VARCHAR(255),
        userGender CHAR(1),
        userDOB VARCHAR(10),
        userAddress VARCHAR(255),
        userCountryOfBirth VARCHAR(255),
        isAdmin BOOLEAN
    );

INSERT INTO
    USER(
        userName,
        userSurname,
        userEmail,
        userGender,
        userDOB,
        userAddress,
        userCountryOfBirth,
        isAdmin
    )
VALUES (
        "Mandla T",
        "Chavarika",
        "mandlac12@gmail.com",
        'M',
        "2001-01-12",
        "Joburg",
        "South Africa",
        0
    );

CREATE TABLE
    IF NOT EXISTS merchandise (
        merchID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        merchandiseName VARCHAR(255),
        merchaniseStock INT
    );

CREATE TABLE
    IF NOT EXISTS refund (
        refundID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        merchID INT,
        dateOfRefund DATE,
        FOREIGN KEY (merchID) REFERENCES merchandise(merchID)
    );

CREATE TABLE
    IF NOT EXISTS receipt (
        receiptID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        userID INT,
        dateOfPurchase DATE,
        FOREIGN KEY (userID) REFERENCES user(userID)
    );

CREATE TABLE
    IF NOT EXISTS battleOFTheBands(
        bandID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        bandFee INT
    );

CREATE TABLE
    IF NOT EXISTS bandMembers(
        memberID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        bandID INT,
        memberName VARCHAR(255),
        memberSurname VARCHAR(255),
        dob VARCHAR(255),
        hasCriminalRecord TINYINT,
        FOREIGN KEY (bandID) REFERENCES battleOfTheBands(bandID)
    );

CREATE TABLE
    IF NOT EXISTS rankings(
        rankID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        ranking INT,
        bandID INT,
        FOREIGN KEY (bandID) REFERENCES battleOfTheBands(bandID)
    );