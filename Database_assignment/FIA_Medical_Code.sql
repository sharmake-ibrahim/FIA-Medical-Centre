

CREATE TABLE StaffRole (
	RoleID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	RoleDesc Varchar(20) NOT NULL,

);



CREATE TABLE Staff (
	StaffID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FirstName Varchar(20) NOT NULL,
	LastName Varchar(20) NOT NULL,
	RoleID INT NOT NULL,
	Gender Varchar(1) NOT NULL,
	DateJoined DATE NOT NULL, 
	DateLeft DATE NULL,

	CONSTRAINT ck_staff_gender CHECK( Gender in ('M', 'F', 'O')),
	CONSTRAINT FK_roleID FOREIGN KEY(RoleID) REFERENCES StaffRole(RoleID)

);



CREATE TABLE Patient (
	PatientID  INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FirstName Varchar(20) NOT NULL,
	LastName Varchar(20) NOT NULL,
	DOB DATE NOT NULL,
	Phone Varchar(15) NOT NULL,
	StaffID INT NOT NULL,
	Gender Varchar(1),
		CONSTRAINT ck_patient_gender CHECK( Gender in ('M', 'F', 'O')),
		CONSTRAINT FK_staffID FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
);





CREATE TABLE Speciality (
	SpecialityID   INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	SpecName Varchar(30) NOT NULL,
	SpecNotes Varchar(100) NULL


);




CREATE TABLE Charge (
	ChargeID   INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	ChrgDescription Varchar(80) NOT NULL,
	Duration INT NOT NULL,
	HourlyRate INT NOT NULL,

	CONSTRAINT CK_duration CHECK ( Duration <= 60 ),
	CONSTRAINT CK_hourlyrate CHECK ( HourlyRate <= 399)
);


CREATE TABLE StaffSpeciality (
	StaffID INT NOT NULL,
	SpecialityID INT NOT NULL,
	DateQualified DATE NOT NULL,
	ValidTillDate DATE NOT NULL,
	Details Varchar(100) NOT NULL,
	
	CONSTRAINT PK_Staff_Specaility PRIMARY KEY (StaffID, SpecialityID),

	CONSTRAINT FK_Staff FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),

    CONSTRAINT FK_Speciality FOREIGN KEY (SpecialityID) REFERENCES Speciality(SpecialityID)
);

select * from StaffSpeciality



CREATE TABLE Consultation (
	ConsultationID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	ChargeID INT NOT NULL,
	StaffID INT NOT NULL,
	DateConsulted DATE NOT NULL,
	StartTime TIME(4),
	PatientID INT NOT NULL,
	
	CONSTRAINT fk_chrgeId FOREIGN KEY (ChargeID) REFERENCES Charge(ChargeID),
	CONSTRAINT fk_staff_id FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
	CONSTRAINT fk_patientId FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)


);




INSERT INTO StaffRole (RoleDesc) VALUES 

('GP'),
('Receptionnist'),
('Adminstrator'),
('Registered Nurse'),
('Enrolled Nurse'),
('Nurse Practitioner')
	
	


INSERT INTO Staff (FirstName, LastName, RoleID, Gender, DateJoined, DateLeft ) VALUES

('Homer', 'Robbins', 1, 'M', '2015-04-21', NULL),
('Marge', 'Johnson', 2, 'F', '2015-04-27', NULL),
('Patty', 'Reyes', 2, 'F', '2016-03-23', NULL),
('Selma', 'Bouvier', 3, 'F', '2016-03-27', NULL),
('Ned', 'Flanders', 4, 'M', '2016-10-18', NULL),
('Lisa', 'Simpson', 1, 'F', '2016-12-04', NULL),
('Disco', 'Stu', 5, 'M', '2018-03-27', '2018-08-17'),
('sharma', 'ibrahim', 6, 'M', '2025-09-7', NULL);




INSERT INTO Patient (FirstName, LastName, DOB, Gender,	StaffID,  Phone) VALUES 

('Caroline', 'Smith', '1981-06-21', 'F', 1,'0271234567'),
('James', 'Miller', '1972-05-23', 'M', 6, '02212344567'),
('Sarah', 'Walker', '1991-04-09', 'F', 6, '0211234567'),
('Sam', 'Paul', '1988-01-18', 'M', 1, '0272345678'),
('Jack', 'Johnson', '1974-10-26', 'M', 1, '0272345678');






INSERT INTO Speciality ( SpecName, SpecNotes) VALUES 

('GP License', 'General GP consultation; can perform minor surgeries e.g removing models'),
('Registered Surgeon','Qualified General Surgeon'),
('Renew License','Renewed License'),
('Training','Intern under training'),
('Practitioner','Able to administer prescriptions, vaccinations, blood tests, etc.')





INSERT INTO Charge (ChrgDescription, Duration, HourlyRate) VALUES 

('General GP consultation for registered patients', 30, 55),
('General GP consultation for casual patients', 30, 90),
('Emergency medical care for registered or casual patients', 30, 0),
('Vaccination or Test collection for registered patients', 15, 0),
('Vaccination or Test collection for casual patients', 15, 40),
('Repeat prescription', 5, 5);




INSERT INTO Consultation ( ChargeID, StaffID,DateConsulted, StartTime , PatientID)
VALUES
(2, 1, '2018-09-01', '08:30', 2),
(5, 3, '2018-09-04', '09:45', 3),
(5, 7, '2018-09-06', '09:45', 4),
(6, 7, '2018-09-07', '10:30', 3),
(4, 5, '2018-09-08', '10:45', 5);



INSERT INTO StaffSpeciality ( StaffID, SpecialityID, DateQualified, ValidTillDate, Details ) VALUES


(1 ,3, '2014-04-23', '2025-04-23', 'license renewed until 2026-3-31'),
(1,4, '2016-05-14', '2027-11-14', 'Intern on rotation in surgical unit'),
(3,4, '2015-08-01', '2025-07-31', 'Intern on rotation in medical unit'),
(6,1, '2015-08-01', '2026-08-31', 'General GP'),
(7,4, '2018-09-03', '2025-06-30', 'Intern n rotation with GP');





SELECT * FROM StaffRole

SELECT * FROM Staff

SELECT * FROM Patient 

SELECT * FROM Speciality

SELECT * FROM Charge

SELECT * FROM Consultation

SELECT * FROM StaffSpeciality

