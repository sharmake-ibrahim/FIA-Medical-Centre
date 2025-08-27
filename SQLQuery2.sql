

CREATE TABLE Patient (
	PatientID INT IDENTITY(1,1)PRIMARY KEY NOT NULL,
	FirstName Varchar(20) NOT NULL,
	LastName Varchar(20) NOT NULL,
	DOB  DATE NOT NULL,
	Phone Varchar(15) NOT NULL,
	Gender Varchar(1) NOT NULL,
	CONSTRAINT CK_Patient CHECK ( Gender in('M', 'F', 'O')),
)


CREATE TABLE Staff (
	StaffID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FirstName Varchar(20) NOT NULL,
	LastName Varchar(20) NOT NULL,
	DOB  DATE NOT NULL,
	Gender Varchar(1) NOT NULL,
	CONSTRAINT CK_Staff CHECK ( Gender in('M', 'F', 'O')),
	DateJoined DATE NOT NULL, 
	DateLeft DATE NULL

)



CREATE TABLE StaffRole (
	staffRole INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	roleDesc  Varchar(20) NOT NULL
)


CREATE TABLE Charge (
chargeID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Amount  Decimal(5,2) CHECK (Amount > 0 AND amount < 99) NOT NULL
)