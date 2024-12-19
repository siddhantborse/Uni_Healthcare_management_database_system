-- Insert sample data into Patients table
INSERT INTO Patients (Name, Age, Contact, MedicalHistory) VALUES
('John Doe', 30, '123-456-7890', 'None'),
('Jane Smith', 45, '987-654-3210', 'Diabetes'),
('Alice Brown', 29, '555-555-5555', 'Hypertension'),
('Michael Johnson', 50, '321-654-0987', 'Asthma'),
('Emily Davis', 40, '111-222-3333', 'Arthritis'),
('Chris Evans', 32, '444-555-6666', 'None'),
('Sophia Lee', 25, '777-888-9999', 'Migraine'),
('Daniel Brown', 60, '123-789-4560', 'Hypertension');

-- Insert sample data into Doctors table
INSERT INTO Doctors (Name, Specialization, Availability) VALUES
('Dr. Alan Grant', 'Cardiology', TRUE),
('Dr. Ellie Sattler', 'Pediatrics', TRUE),
('Dr. Ian Malcolm', 'Orthopedics', FALSE),
('Dr. Sarah Connor', 'Neurology', TRUE),
('Dr. Henry Wu', 'Dermatology', TRUE),
('Dr. Clara Oswald', 'General Medicine', FALSE),
('Dr. Robert Smith', 'Surgery', TRUE),
('Dr. Megan Hart', 'Ophthalmology', TRUE);

-- Insert sample data into Departments table
INSERT INTO Departments (DepartmentName, Location, Phone) VALUES
('Cardiology', 'Building A', '111-111-1111'),
('Pediatrics', 'Building B', '222-222-2222'),
('Orthopedics', 'Building C', '333-333-3333'),
('Neurology', 'Building D', '444-444-4444'),
('Dermatology', 'Building E', '555-555-5555'),
('General Medicine', 'Building F', '666-666-6666'),
('Surgery', 'Building G', '777-777-7777'),
('Ophthalmology', 'Building H', '888-888-8888');

-- Insert sample data into Staff table
INSERT INTO Staff (Name, Position, DepartmentID, Phone) VALUES
('Nurse Amy', 'Nurse', 1, '444-444-4444'),
('Technician Bob', 'Lab Technician', 2, '555-555-5555'),
('Receptionist Carol', 'Receptionist', 3, '666-666-6666'),
('Technician David', 'Lab Technician', 4, '555-666-7777'),
('Nurse Emily', 'Nurse', 5, '999-888-7777'),
('Technician George', 'Lab Technician', 2, '222-333-4444'),
('Receptionist Jenny', 'Receptionist', 1, '333-444-5555'),
('Pharmacist Luke', 'Pharmacist', 3, '888-777-6666');

-- Insert sample data into Appointments table
INSERT INTO Appointments (Date, Time, Purpose, PatientID, DoctorID) VALUES
('2023-12-01', '09:00:00', 'Routine Checkup', 1, 1),
('2023-12-02', '10:30:00', 'Follow-up Visit', 2, 2),
('2023-12-03', '14:00:00', 'Specialist Consultation', 3, 3),
('2023-12-04', '09:30:00', 'Neurology Consultation', 4, 4),
('2023-12-05', '11:00:00', 'Skin Check', 5, 5),
('2023-12-06', '15:00:00', 'Follow-up Neurology', 1, 4),
('2023-12-07', '08:00:00', 'Migraine Treatment', 2, 4),
('2023-12-08', '13:00:00', 'Eye Checkup', 3, 8);

-- Insert sample data into MedicalRecords table
INSERT INTO MedicalRecords (Diagnoses, Prescriptions, LabResults, AppointmentID) VALUES
('Mild Cold', 'Paracetamol', 'Normal', 1),
('Diabetes Management', 'Insulin', 'Elevated Glucose Levels', 2),
('Fracture', 'Painkillers', 'X-Ray Attached', 3),
('Asthma', 'Inhaler', 'Normal', 4),
('Skin Rash', 'Cortisone Cream', 'Allergy Detected', 5),
('Migraine', 'Painkillers', 'Normal', 6),
('Hypertension', 'Blood Pressure Meds', 'Elevated BP', 7),
('Blurred Vision', 'Eye Drops', 'Eye Test Results Attached', 8);

-- Insert sample data into Billing table
INSERT INTO Billing (AppointmentID, Amount, DateIssued, PaymentStatus) VALUES
(1, 150.00, '2023-12-01', 'Paid'),
(2, 200.00, '2023-12-02', 'Pending'),
(3, 300.00, '2023-12-03', 'Paid'),
(4, 250.00, '2023-12-04', 'Paid'),
(5, 180.00, '2023-12-05', 'Pending'),
(6, 220.00, '2023-12-06', 'Paid'),
(7, 300.00, '2023-12-07', 'Pending'),
(8, 120.00, '2023-12-08', 'Paid');

-- Insert sample data into Pharmacy table
INSERT INTO Pharmacy (PharmacyName, Location, Phone) VALUES
('City Pharmacy', 'Downtown', '777-777-7777'),
('HealthMed Pharmacy', 'Uptown', '888-888-8888'),
('Community Pharmacy', 'Midtown', '333-555-7777'),
('QuickMed Pharmacy', 'Suburb', '444-666-8888'),
('Wellness Pharmacy', 'City Center', '555-777-9999');

-- Insert sample data into Medications table
INSERT INTO Medications (Name, Type, Dosage, PharmacyID) VALUES
('Aspirin', 'Pain Relief', '500mg', 1),
('Amoxicillin', 'Antibiotic', '250mg', 2),
('Metformin', 'Diabetes', '850mg', 1),
('Ibuprofen', 'Pain Relief', '400mg', 3),
('Cetirizine', 'Allergy Relief', '10mg', 2),
('Omeprazole', 'Acid Reflux', '20mg', 1),
('Losartan', 'Hypertension', '50mg', 1),
('Clarithromycin', 'Antibiotic', '500mg', 3);

-- Insert sample data into Labs table
INSERT INTO Labs (LabName, Location, Phone) VALUES
('City Lab', 'Downtown', '999-999-9999'),
('Health Diagnostics', 'Uptown', '000-000-0000'),
('Advanced Diagnostics', 'Midtown', '666-777-8888'),
('Prime Labs', 'Downtown', '777-888-9999'),
('HealthCare Labs', 'Suburb', '888-999-0000');

-- Insert sample data into AppointmentLabs table (junction table)
INSERT INTO AppointmentLabs (AppointmentID, LabID) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 3),
(6, 1),
(7, 2),
(8, 3);
