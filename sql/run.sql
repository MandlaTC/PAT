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
        "Mandla",
        "Chavarika",
        "mandlac12@gmail.com",
        'M',
        "2001-01-12",
        "Joburg",
        "South Africa",
        0
    );