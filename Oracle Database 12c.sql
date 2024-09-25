DROP TABLE Bills CASCADE CONSTRAINTS;
DROP TABLE Treatment CASCADE CONSTRAINTS;
DROP TABLE Appointment CASCADE CONSTRAINTS;
DROP TABLE Dentist CASCADE CONSTRAINTS;
DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE AddressInfo CASCADE CONSTRAINTS;

CREATE TABLE Dentist (
    DentistID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(12) NOT NULL, -- Format ###-###-####
    Email VARCHAR(100) NOT NULL,
    Specialization VARCHAR(25)
);

CREATE TABLE AddressInfo (
    Address VARCHAR(255) PRIMARY KEY,
    Street VARCHAR(255),
    City VARCHAR(255),
    Province VARCHAR(2),
    PostalCode VARCHAR(6)
);

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    DateOfBirth DATE,
    Address VARCHAR(255),
    MedicalHistory VARCHAR(255) NOT NULL,
    FOREIGN KEY (Address) REFERENCES AddressInfo(Address)
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DentistID INT,
    Appointment_Time VARCHAR(4), -- format #:##
    Appointment_Date DATE,
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DentistID) REFERENCES Dentist(DentistID)
);

CREATE TABLE Treatment (
    TreatmentID INT PRIMARY KEY,
    AppointmentID INT,
    PatientID INT,
    DentistID INT, 
    Type VARCHAR(25),
    Cost DECIMAL(10, 2),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DentistID) REFERENCES Dentist(DentistID)
);

CREATE TABLE Bills (
    BillID INT PRIMARY KEY,
    PatientID INT,
    TreatmentID INT, 
    AmountPaid DECIMAL(10, 2),
    AmountDue DECIMAL(10, 2),
    PaidDate DATE, 
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID)
);

INSERT INTO Dentist (DentistID, FirstName, LastName, Phone, Email, Specialization)
VALUES (1, 'John', 'Doe', '111-111-1111', 'john.doe@gmail.com', 'Orthodontist');

SELECT * FROM Dentist;

INSERT INTO AddressInfo (Address, Street, City, Province, PostalCode)
VALUES ('123 Jane St', 'Jane St', 'Toronto', 'ON', 'G5U8K9');

SELECT * FROM AddressInfo;

INSERT INTO Patient (PatientID, FirstName, LastName, Phone, Email, DateOfBirth, Address, MedicalHistory)
VALUES (1, 'Jane', 'Smith', '111-111-1111', 'jane.smith@example.com', TO_DATE('2024-09-25', 'YYYY-MM-DD'), '123 Jane St', 'None');

SELECT * FROM Patient;

INSERT INTO Appointment (AppointmentID, PatientID, DentistID, Appointment_Time, Appointment_Date, Reason)
VALUES (1, 1, 1, '9:00', TO_DATE('2024-09-25', 'YYYY-MM-DD'), 'Routine Checkup');

SELECT * FROM Appointment;

INSERT INTO Treatment (TreatmentID, AppointmentID, PatientID, DentistID, Type, Cost)
VALUES (1, 1, 1, 1, 'Cleaning', 1.00);

SELECT * FROM Treatment;

INSERT INTO Bills (BillID, PatientID, TreatmentID, AmountPaid, AmountDue, PaidDate)
VALUES (1, 1, 1, 1.00, 1.00, TO_DATE('2024-09-25', 'YYYY-MM-DD'));

SELECT * FROM Bills;




