Create database universityhealthcaredb;
Use universityhealthcaredb;
-- Patients Table
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Contact VARCHAR(50),
    MedicalHistory TEXT
);

-- Doctors Table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Availability BOOLEAN DEFAULT TRUE
);

-- Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Purpose TEXT,
    PatientID INT,
    DoctorID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Medical Records Table
CREATE TABLE MedicalRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    Diagnoses TEXT,
    Prescriptions TEXT,
    LabResults TEXT,
    AppointmentID INT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Phone VARCHAR(15)
);

-- Staff Table
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(100),
    DepartmentID INT,
    Phone VARCHAR(15),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Billing Table
CREATE TABLE Billing (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    DateIssued DATE,
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

-- Pharmacy Table
CREATE TABLE Pharmacy (
    PharmacyID INT AUTO_INCREMENT PRIMARY KEY,
    PharmacyName VARCHAR(100),
    Location VARCHAR(100),
    Phone VARCHAR(15)
);

-- Medications Table
CREATE TABLE Medications (
    MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50),
    Dosage VARCHAR(50),
    PharmacyID INT,
    FOREIGN KEY (PharmacyID) REFERENCES Pharmacy(PharmacyID)
);

-- Labs Table
CREATE TABLE Labs (
    LabID INT AUTO_INCREMENT PRIMARY KEY,
    LabName VARCHAR(100),
    Location VARCHAR(100),
    Phone VARCHAR(15)
);

-- Junction Table for Labs and Appointments (Many-to-Many)
CREATE TABLE AppointmentLabs (
    AppointmentID INT,
    LabID INT,
    PRIMARY KEY (AppointmentID, LabID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
    FOREIGN KEY (LabID) REFERENCES Labs(LabID)
);

