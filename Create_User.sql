CREATE USER 'readonly_user'@'%' IDENTIFIED BY 'readonly';
CREATE USER 'dataentry_user'@'%' IDENTIFIED BY 'dataentry';
GRANT SELECT ON UniversityHealthCareDB.* TO 'readonly_user'@'%';
GRANT SELECT, INSERT, UPDATE ON UniversityHealthCareDB.* TO 'dataentry_user'@'%';
GRANT ALL PRIVILEGES ON UniversityHealthCareDB.* TO 'admin'@'%';
FLUSH PRIVILEGES;