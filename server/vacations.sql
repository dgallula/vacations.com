create database vacations;


use vacations;


CREATE TABLE users (
id   INT NOT NULL AUTO_INCREMENT ,
firstname VARCHAR(255) not null,
familyName varchar(255) not null,
email varchar(255)unique not null,
username varchar(255)  not null,
password varchar(255) unique not null ,
role varchar(255) not null,
PRIMARY KEY (id)
);


INSERT INTO users (firstName, familyName, email, username, password, role)
VALUES
('Elie', 'Zenou', 'elie@gmail.com','elie', 'elie1234', 'user') ,
('david', 'gallula', 'dgallula@gmail.com','dgallula', 'david1234', 'admin' );


CREATE TABLE admin (
id   INT NOT NULL AUTO_INCREMENT ,
firstname VARCHAR(255) not null,
familyName varchar(255) not null,
email varchar(255)unique not null,
username varchar(255)  not null,
password varchar(255) unique not null ,
role varchar(255) not null,
PRIMARY KEY (id)
);


INSERT INTO admin (firstName, familyName, email, username, password, role)
VALUES
('david', 'gallula', 'dgallula@gmail.com','dgallula', 'david1234', 'admin' );


CREATE TABLE vacations (
id   INT NOT NULL AUTO_INCREMENT ,
descriptions VARCHAR(255) not null,
cityName VARCHAR(255) not null,
country VARCHAR(255) not null,
img VARCHAR(255) not null,
price int not null,
DateFrom datetime not null,
DateUntil datetime not null,
userId int not null,
PRIMARY KEY (id),
FOREIGN KEY(userId) REFERENCES users(id)
);

INSERT INTO vacations ( descriptions, cityName, country, img, price, dateFrom, dateUntil, userId)
VALUES

('Paris', 'France','Paris la ville des amoureux','Paris.jpej', 499, '2022-06-23', '2022-06-23',  1),
('Madrid' ,'Espagne','Viva espagna','Madrid.jpej', 399, '2020-07-23', '2022-07-23', 2),
('Courchevelle','France','La montagne , ça vous gagne','Courchevelle.jpej', 699, '2022-08-23', '2022-08-23', 1);


CREATE TABLE follow (
id   INT NOT NULL AUTO_INCREMENT ,
userId int not null,
vacationId int not null,
followers int not null,
PRIMARY KEY (id),
FOREIGN KEY(userId) REFERENCES users(id),
FOREIGN KEY(vacationId) REFERENCES vacations(id)
);

INSERT INTO follow ( userId, vacationId,followers)
VALUES
(1,1,5000),
(2,2,4000),
(1,3,6000);

CREATE TABLE followedVacations (
    id INT AUTO_INCREMENT NOT NULL,
    userID INT NOT NULL,
    vacationID INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(userId) REFERENCES users(id),
    FOREIGN KEY(vacationId) REFERENCES vacations(id)
);


INSERT INTO followedVacations ( userId, vacationId)
VALUES
(1,1),
(2,2),
(1,3);



select* from vacations join follow;

SELECT followers FROM follow;

SELECT vacationId, COUNT(userId) AS followers FROM follow
      GROUP BY vacationId;
      
select *from users;

select * from followedVacations;

select * from follow;



 select * from follow;
 
 select followers from follow where userId = 1;
 
select * from vacations;

select * from users;

SELECT * FROM users where role= 'admin';

SELECT *
FROM vacations;


select vacations.*,Count(follow.vacationId) As numberVacations from Follow 
left join vacations on follow.vacationId = vacations.Id 
where exists ( select * from follow where vacations.id = follow.vacationId and follow.userId )
group by vacations.cityName;

select followers from follow