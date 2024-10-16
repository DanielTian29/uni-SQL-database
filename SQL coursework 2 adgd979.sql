/*Student name: Daniel Tian
Student username: adgd979*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE adgd979_era ( 
    era_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    era_name VARCHAR(30) NOT NULL,
    duration VARCHAR(20) NOT NULL,
    country VARCHAR(30) NOT NULL,
    era_description VARCHAR(255)
    );

CREATE TABLE adgd979_display_piece(
    display_piece_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    display_piece_name VARCHAR(50) NOT NULL,
    fragile ENUM('Very Fragile', 'Fragile', 'Non-fragile') NOT NULL,
    display_description VARCHAR(255),
    era_id INTEGER NOT NULL,
    FOREIGN KEY (era_id) REFERENCES adgd979_era(era_id)
    );

CREATE TABLE adgd979_location (
    location_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    building_name VARCHAR(30) NOT NULL,
    room_number INTEGER(3) NOT NULL,
    building_description VARCHAR(100)
    );

CREATE TABLE adgd979_replica(
    replica_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quality VARCHAR(255),
    date_produced INTEGER NOT NULL,
    display_piece_id INTEGER NOT NULL,
    FOREIGN KEY (display_piece_id) REFERENCES adgd979_display_piece(display_piece_id)
    );

CREATE TABLE adgd979_staff (
    staff_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone_number CHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    job_role VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    gender ENUM('M','F','X') NOT NULL,
    qualification VARCHAR(255) NOT NULL,
    wage float(6) NOT NULL,
    manager_id INTEGER,
    FOREIGN KEY (manager_id) REFERENCES adgd979_staff(staff_id)
    );

CREATE TABLE adgd979_assignment(
    assignment_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    location_id INTEGER NOT NULL,
    staff_id INTEGER NOT NULL,
    display_piece_id INTEGER NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    start_date INTEGER NOT NULL,
    end_date INTEGER NOT NULL,
    FOREIGN KEY (location_id) REFERENCES adgd979_location(location_id),
    FOREIGN KEY (staff_id) REFERENCES adgd979_staff(staff_id),
    FOREIGN KEY (display_piece_id) REFERENCES adgd979_display_piece(display_piece_id)
    );




/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO adgd979_era (era_name, duration, country, era_description) 
VALUES 
('Renaissance', '1300-1700', 'Europe', 'Period of European cultural, artistic, political, and economic rebirth'),
('Edo Period', '1603-1868', 'Japan', 'Period between the Tokugawa shogunate and the Meiji Era'),
('Qing Dynasty', '1644-1912', 'China', 'Last imperial dynasty of China'),
('Ancient Egypt', '3100-332 BC', 'Egypt', 'Civilization of ancient North Africa'),
('Middle Ages', '500-1500', 'Europe', 'Period of European history between the fall of the Western Roman Empire and the Renaissance'),
('Roman Empire', '27 BC-476 AD', 'Italy', 'Post-Republican period of ancient Rome'),
('Indus Valley Civilization', '3300-1300 BC', 'South Asia', 'Bronze Age civilization in South Asia'),
('Aztec Empire', '1428-1521', 'Mexico', 'Pre-Columbian Mesoamerican civilization'),
('Byzantine Empire', '330-1453', 'Eastern Roman Empire', 'Continuation of the Roman Empire in the East'),
('Victorian Era', '1837-1901', 'United Kingdom', 'Period of Queen Victoria\'s reign in the UK'),
('Maya Civilization', '2000 BC-1697 AD', 'Mesoamerica', 'Mesoamerican civilization known for its advanced culture and architecture');

INSERT INTO adgd979_display_piece (display_piece_name, Fragile, display_description, era_id) 
VALUES 
('Mona Lisa', 'Very Fragile', 'Famous painting by Leonardo da Vinci', 1),
('The Great Wave off Kanagawa', 'Non-fragile', 'Woodblock print by Hokusai', 2),
('Qing Dynasty Porcelain Vase', 'Fragile', 'Exquisite porcelain vase from the Qing Dynasty', 3),
('Ancient Egyptian Pyramid', 'Very Fragile', 'Iconic pyramid from Ancient Egypt', 4),
('Medieval Castle', 'Non-fragile', 'Architectural marvel from the Middle Ages', 5),
('Roman Colosseum', 'Non-fragile', 'Historic amphitheater from the Roman Empire', 6),
('Indus Valley Clay Figurine', 'Non-fragile', 'Clay figurine from the Indus Valley Civilization', 7),
('Aztec Jade Mask', 'Fragile', 'Intricately carved jade mask from the Aztec Empire', 8),
('Byzantine Mosaic', 'Non-fragile', 'Beautiful mosaic art from the Byzantine Empire', 9),
('Victorian Era Pocket Watch', 'Fragile', 'Elegant pocket watch from the Victorian Era', 10),
('Maya Codex', 'Very Fragile', 'Ancient Maya manuscript', 11);

INSERT INTO adgd979_location (building_name, room_number, building_description)
VALUES 
('Historical Art Gallery', 101, 'Room with famous Renaissance art pieces'),
('Cultural Heritage Hall', 102, 'Gallery featuring Japanese and Hokusai prints'),
('Antiquities Wing', 103, 'Exhibition dedicated to Qing Dynasty artifacts'),
('Egyptian Exhibit Hall', 201, 'Displaying iconic Ancient Egyptian artifacts'),
('Medieval Architecture Wing', 202, 'Exhibit showcasing medieval architecture and artifacts'),
('Roman History Wing', 301, 'Housing the historic Roman Colosseum'),
('Indus Valley Wing', 302, 'Exhibition featuring artifacts from the Indus Valley Civilization'),
('Aztec Art Pavilion', 303, 'Gallery showcasing Aztec art and culture'),
('Byzantine Art Exhibition', 401, 'Exhibit dedicated to Byzantine art and mosaics'),
('Victorian Era Gallery', 501, 'Museum highlighting the Victorian Era and its artifacts'),
('Maya Civilization Section', 502, 'Exhibition exploring the ancient Maya civilization');

INSERT INTO adgd979_replica (quality, date_produced, display_piece_id)
VALUES
('High quality', 2022, 1),
('Low quality', 2021, 2),
('Medium quality', 2020, 3),
('High quality', 2023, 4),
('Low quality', 2019, 5),
('Medium quality', 2022, 6),
('High quality', 2021, 7),
('Low quality', 2023, 8),
('Medium quality', 2020, 9),
('High quality', 2023, 10),
('Low quality', 2021, 11);

INSERT INTO adgd979_staff (name, phone_number, email, job_role, address, gender, qualification, wage, manager_id)
VALUES 
('Ahmed El-Masri', '07123456789', 'ahmed.elmasri@gmail.com', 'Manager', '123 London Street, London', 'M', 'Art History', 30000, NULL),
('Natalia Petrov', '07123456790', 'natalia.petrov@yahoo.com', 'Manager', '456 London Avenue, London', 'F', 'Museum Studies', 65000, NULL),
('Ji-hoon Kim', '07123456791', 'jihoon.kim@outlook.com', 'Manager', '789 London Lane, London', 'X', 'Cultural Heritage', 70000, NULL),
('Hassan El-Masri', '07123456792', 'hassan.elmasri@hotmail.com', 'Curator', '321 London Road, London', 'M', 'Art History', 28000, 1),
('Elena Kuznetsova', '07123456793', 'elena.kuznetsova@gmail.com', 'Security', '654 London Boulevard, London', 'F', 'Security Management', 26000, 2),
('Wei Chen', '07123456794', 'wei.chen@yahoo.com', 'Guide', '987 London Drive, London', 'F', 'History', 25000, 3),
('Muhammad Al-Mansoori', '07123456795', 'muhammad.almansoori@outlook.com', 'Maintenance', '135 London Way, London', 'M', 'Facility Management', 24000, 1),
('Svetlana Ivanova', '07123456796', 'svetlana.ivanova@hotmail.com', 'Restorer', '246 London Place, London', 'F', 'Art Restoration', 27000, 2),
('Yoshihiro Tanaka', '07123456797', 'yoshihiro.tanaka@gmail.com', 'Educator', '369 London Square, London', 'M', 'Education', 26000, 3),
('Mei Li', '07123456798', 'mei.li@yahoo.com', 'Researcher', '147 London Park, London', 'F', 'Archaeology', 28000, 1),
('Sakima Onida', '07123456801', 'sakima.onida@example.com', 'Maintenance', '345 London Lane, London', 'M', 'Facility Management', 26000, 1);

INSERT INTO adgd979_assignment (location_id, staff_id, display_piece_id, start_time, end_time, start_date, end_date)
VALUES
(1, 1, 1, '08:30:00', '22:30:00', 20230201, 20230203),
(1, 2, 1, '09:15:00', '22:45:00', 20230202, 20230204),
(1, 3, 1, '10:00:00', '22:00:00', 20230203, 20230205),
(4, 4, 4, '10:45:00', '22:15:00', 20230204, 20230206),
(6, 5, 6, '06:30:00', '22:30:00', 20230205, 20230207),
(6, 6, 6, '07:45:00', '22:00:00', 20230206, 20230208),
(6, 7, 6, '08:00:00', '22:30:00', 20230207, 20230209),
(8, 8, 8, '09:30:00', '22:45:00', 20230208, 20230210),
(9, 9, 9, '06:15:00', '22:00:00', 20230209, 20230211),
(11, 10, 11, '07:30:00', '22:15:00', 20230210, 20230212),
(11, 11, 11, '08:45:00', '22:45:00', 20230211, 20230213);







/* SECTION 3 - UPDATE STATEMENTS */

UPDATE adgd979_staff 
SET wage = 50000
WHERE name = 'Ahmed El-Masri';

UPDATE adgd979_assignment
SET staff_id = (SELECT staff_id FROM adgd979_staff WHERE name = 'Wei Chen')
WHERE staff_id = (SELECT staff_id FROM adgd979_staff WHERE name = 'Sakima Onida');






/* SECTION 4 - SINGLE TABLE SELECT STATEMENTS */

/* 1) List the staff ID with more than one assignment to do, and the number of assignments they have.*/

SELECT staff_id, COUNT(staff_id) AS 'number of assigments'
FROM adgd979_assignment
GROUP BY (staff_id)
HAVING COUNT(staff_id) > 1;

/* 2) List the names of the display pieces that are very fragile */

SELECT display_piece_name
FROM adgd979_display_piece
WHERE fragile = 'Very Fragile';


/* 3) List the name, the job role and qualifcations of the person that earns the most, male, female and person who identifies as other */

SELECT name, gender, wage, job_role, qualification 
FROM adgd979_staff
WHERE wage = (SELECT MAX(wage) FROM adgd979_staff WHERE gender = 'M') OR wage = (SELECT MAX(wage) FROM adgd979_staff WHERE gender = 'F') OR wage = (SELECT MAX(wage) FROM adgd979_staff WHERE gender = 'X');

/* 4) List the name, phone number, and email of every staff member with the last name "El-Masri" */

SELECT name, phone_number, email
FROM adgd979_staff
WHERE name LIKE "% El-Masri";

/* 5) List the names of the managers */

SELECT name
FROM adgd979_staff
WHERE manager_id IS NULL;

/* 6) What is the average wage of a manager */

SELECT ROUND(AVG(wage)) AS 'average wage for manager'
FROM adgd979_staff
WHERE job_role = 'Manager';






/* SECTION 5 MULTIPLE TABLE SELECT STATEMENTS*/

/* 1) List the room number, the time and the dates the shifts start and end for staff memeber "Wei Chen"*/

SELECT room_number AS 'room number', start_time AS 'shift start', end_time AS 'shift end', start_date AS 'First day', end_date AS 'Last day'
FROM adgd979_assignment
INNER JOIN adgd979_location
ON adgd979_location.location_id = adgd979_assignment.location_id
WHERE staff_id = (SELECT staff_id FROM adgd979_staff WHERE name = 'Wei Chen');

/* 2) List the name, starting shift time and date for all the staff that start between 6 am and 8 am */

SELECT name, start_time AS 'shift start time', start_date AS 'shift start date'
FROM adgd979_assignment
INNER JOIN adgd979_staff
ON adgd979_assignment.staff_id = adgd979_staff.staff_id
WHERE start_time >= '06:00:00' AND start_time <= '08:00:00';

/* 3) List the item displayed in the 'Aztec Art Pavilion', the room number it's displayed in, and the quality of the replica */

SELECT display_piece_name, display_description, quality, building_name, room_number
FROM adgd979_location
INNER JOIN adgd979_assignment ON adgd979_location.location_id = adgd979_assignment.location_id
INNER JOIN adgd979_display_piece ON adgd979_assignment.display_piece_id = adgd979_display_piece.display_piece_id
INNER JOIN adgd979_replica ON adgd979_replica.display_piece_id = adgd979_display_piece.display_piece_id
WHERE building_name = 'Aztec Art Pavilion';

/* 4) Find the person, and their contact details, who starts at 8:30 */

SELECT name
FROM adgd979_staff
WHERE staff_id = (SELECT staff_id FROM adgd979_assignment WHERE start_time = '08:30:00');

/* 5) Order ascendingly, the duration that people work */

SELECT name, SEC_TO_TIME((HOUR(end_time)*3600 + MINUTE(end_time)*60 + SECOND(end_time)) - (HOUR(start_time)*3600 + MINUTE(start_time)*60 + SECOND(start_time))) AS 'Shift time', start_date, end_date
FROM adgd979_assignment
INNER JOIN adgd979_staff ON adgd979_assignment.staff_id = adgd979_staff.staff_id
ORDER BY SEC_TO_TIME((HOUR(end_time)*3600 + MINUTE(end_time)*60 + SECOND(end_time)) - (HOUR(start_time)*3600 + MINUTE(start_time)*60 + SECOND(start_time))) DESC;

/* 6) List the rooms that have assignments */

SELECT DISTINCT room_number
FROM adgd979_staff
INNER JOIN adgd979_assignment ON adgd979_assignment.staff_id = adgd979_staff.staff_id
INNER JOIN adgd979_location ON adgd979_assignment.location_id = adgd979_location.location_id;


/* SECTION 6 - DELETE ROWS 

DELETE FROM adgd979_assignment WHERE staff_id = (SELECT staff_id FROM adgd979_staff WHERE name = 'Elena Kuznetsova')

DELETE FROM adgd979_replica WHERE display_piece_id = (SELECT display_piece_id FROM adgd979_display_piece WHERE display_piece_name = 'Mona Lisa');

*/

/* SECTION 7 DROP TABLES

DROP TABLE adgd979_assignment,adgd979_staff,adgd979_replica,adgd979_location,adgd979_display_piece,adgd979_era;

*/