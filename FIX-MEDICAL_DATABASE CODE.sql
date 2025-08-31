

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
	roleDesc  Varchar(20) NOT NULL, 
	CONSTRAINT CK_staffRole CHECK( roleDesc in ('GP', 'Receptionist', 
	'Administrator', 'Registered Nurse', 'Enrolled Nurse', 'Nurse Practitioner'))
)


CREATE TABLE Charge (
chargeID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Amount  Decimal(5,2) CHECK (Amount > 0 AND amount < 99) NOT NULL
)



CREATE TABLE Speciality (
	specialityID INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
	specialityName Varchar(30)


)


CREATE TABLE Staff_Speciality (
	StaffID INT NOT NULL,
	SpecialityID INT NOT NULL,
	DateQualified DATE NOT NULL,
    ValidUntilDate DATE DEFAULT '2050-12-31',
	
	CONSTRAINT PK_Staff_speciality  PRIMARY KEY( StaffID, specialityID ),
	CONSTRAINT FK_STAFF FOREIGN KEY (staffID) REFERENCES Staff(StaffID),
	CONSTRAINT FK_Specaility FOREIGN KEY (specialityID) REFERENCES Speciality(specialityID),

);




CREATE TABLE Consultation (
    consultationID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    ChargeID INT NOT NULL,
    staffID INT NOT NULL,
    DateConsulted DATE NOT NULL,
   StartTime DECIMAL(4,2) NOT NULL,
    PatientID INT NOT NULL,

    CONSTRAINT FKstaff FOREIGN KEY (staffID) REFERENCES Staff(StaffID),
    CONSTRAINT FKcharge FOREIGN KEY (ChargeID) REFERENCES Charge(ChargeID),
    CONSTRAINT FKpatient FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

