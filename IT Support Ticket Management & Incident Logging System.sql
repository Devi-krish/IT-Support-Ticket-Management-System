SHOW DATABASES;
CREATE DATABASE it_support;
USE  it_support;

-- USER TABLE
CREATE TABLE users(
user_id INT AUTO_INCREMENT PRIMARY KEY,
user_name varchar(100),
email varchar(100),
department varchar(100)
);

-- TICKET TABLE 
CREATE TABLE tickets (
ticket_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
issue_type varchar(50),
priority varchar(20),
status varchar(20),
created_date Date,
foreign key (user_id) references users(user_id)
);

-- INCIDENT LOG TABLE 
CREATE TABLE incident_logs (
log_id INT AUTO_INCREMENT PRIMARY KEY ,
ticket_id INT ,
description VARCHAR(255),
logged_date DATE,
foreign key (ticket_id) REFERENCES tickets(ticket_id)
);

insert into users(user_name,email,department) values('Ravi Kumar','ravi@gmail.com','HR');
insert into tickets(user_id,issue_type,priority,status,created_date) values(
1,'System Issue','High','Open',curdate()
);
INSERT INTO incident_logs(ticket_id,description,logged_date) values(1,'Lpatop not booting',curdate());






-- TO VIEW ALL TICKETS
select * from tickets;

-- TO VIEW OPEN INCIDENTS 
select ticket_id,issue_type,priority
from tickets
where status = 'open';

-- DAILY INCIDENT REPORT
select * from incident_logs
where logged_date = curdate();

-- TICKETS WITH USER DETAILS
select u.user_name ,t.issue_type,t.status
from users u 
join tickets t on u.user_id = t.user_id;