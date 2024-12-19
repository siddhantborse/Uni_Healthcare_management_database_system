# University Healthcare Database System

A comprehensive MySQL-based database schema designed to streamline operations within a university healthcare system. This project provides a robust data management framework with user roles, data access permissions, views, triggers, and stored procedures. The schema supports essential healthcare operations by incorporating well-structured tables and advanced SQL functionalities.

---

## 📋 Features

### **Database Structure**
- **Database Name:** `UniversityHealthCareDB`
- **Core Tables:**
  - **Patients**: Stores patient information and medical history.
  - **Doctors**: Manages doctor details and availability.
  - **Appointments**: Tracks patient-doctor interactions and schedules.
  - **MedicalRecords**: Maintains diagnoses, prescriptions, and lab results.
  - **Departments**: Organizes hospital departments with location and contact details.
  - **Staff**: Tracks staff information, roles, and departmental affiliations.
  - **Billing**: Handles appointment-related financial transactions.
  - **Pharmacy**: Manages pharmacies and stocked medications.
  - **Labs**: Tracks labs for diagnostic services.

---

### **🔑 User Roles and Permissions**
1. **`readonly_user`**: View-only access.
2. **`dataentry_user`**: View, insert, and update permissions.
3. **`admin`**: Full access to the database.

---

### **⚙️ Advanced Functionalities**
- **Indexing:**
  - Optimized queries with an index on `PatientID`.
  
- **Views:**
  - `PatientSummary`: Provides a summary of patients and their medical record counts.
  
- **Triggers:**
  - `LogPatientUpdates`: Logs updates to patient data into the `PatientUpdatesLog` table.
  
- **Stored Procedures:**
  - `GetPatientDetails`: Simplifies fetching detailed patient information using a patient ID.

---

## 🚀 How to Use

1. **Set Up the Database:**
   ```sql
   CREATE DATABASE UniversityHealthCareDB;
   USE UniversityHealthCareDB;
## 🚀 How to Use

### Use the provided SQL scripts to create tables and populate data.

---

### **Create User Roles**
```sql
CREATE USER 'readonly_user'@'%' IDENTIFIED BY 'readonly';
CREATE USER 'dataentry_user'@'%' IDENTIFIED BY 'dataentry';
GRANT SELECT ON UniversityHealthCareDB.* TO 'readonly_user'@'%';
GRANT SELECT, INSERT, UPDATE ON UniversityHealthCareDB.* TO 'dataentry_user'@'%';
GRANT ALL PRIVILEGES ON UniversityHealthCareDB.* TO 'admin'@'%';
FLUSH PRIVILEGES;


CREATE VIEW PatientSummary AS
SELECT 
    Patients.PatientID, 
    Patients.Name, 
    COUNT(MedicalRecords.RecordID) AS RecordCount
FROM Patients
LEFT JOIN Appointments ON Patients.PatientID = Appointments.PatientID
LEFT JOIN MedicalRecords ON Appointments.AppointmentID = MedicalRecords.AppointmentID
GROUP BY Patients.PatientID, Patients.Name;


CREATE TRIGGER LogPatientUpdates
AFTER UPDATE ON Patients
FOR EACH ROW
BEGIN
  INSERT INTO PatientUpdatesLog (PatientID, UpdatedAt)
  VALUES (NEW.PatientID, NOW());
END;


DELIMITER //
CREATE PROCEDURE GetPatientDetails(IN patientID INT)
BEGIN
  SELECT * FROM Patients WHERE PatientID = patientID;
END //
DELIMITER ;

You can copy and paste this directly into your GitHub `README.md` file, and it will display properly formatted SQL code blocks.



## 📚 Use Cases

- **Hospital Management:** Efficiently track patient data, appointments, and billing.  
- **Academic Projects:** Demonstrates advanced database design principles.  
- **Data Analysis:** Provides a structure for extracting meaningful insights from healthcare data.  

---

## 🌟 Contributions

Feel free to fork this repository, create issues, or submit pull requests. Suggestions for improving the schema and functionality are always welcome.  

---

## 📧 Contact

If you have questions or need support, please reach out via the **Issues** section or email the repository owner.  

---

## 🛠️ Technologies Used

- **Database:** MySQL  
- **Languages:** SQL  
