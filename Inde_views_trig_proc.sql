-- Create an Index
CREATE INDEX idx_patient_id ON Patients (PatientID);

-- Create a View
CREATE VIEW PatientSummary AS
SELECT 
    Patients.PatientID, 
    Patients.Name, 
    COUNT(MedicalRecords.RecordID) AS RecordCount
FROM 
    Patients
LEFT JOIN Appointments ON Patients.PatientID = Appointments.PatientID
LEFT JOIN MedicalRecords ON Appointments.AppointmentID = MedicalRecords.AppointmentID
GROUP BY 
    Patients.PatientID, 
    Patients.Name;

-- Create a Trigger
CREATE TRIGGER LogPatientUpdates
AFTER UPDATE ON Patients
FOR EACH ROW
BEGIN
  INSERT INTO PatientUpdatesLog (PatientID, UpdatedAt)
  VALUES (NEW.PatientID, NOW())
END//

-- Create a Stored Procedure
DELIMITER //
CREATE PROCEDURE GetPatientDetails(IN patientID INT)
BEGIN
  SELECT * FROM Patients WHERE PatientID = patientID;
END //
DELIMITER ;

-- Call the procedure
 CALL GetPatientDetails(1);
 