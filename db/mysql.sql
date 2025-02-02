
UPDATE `sqlite_sequence` SET `seq` = 0;

SELECT * FROM vehicles;
SELECT * FROM services;
SELECT * FROM locations;
SELECT * FROM vehicle_logs WHERE vehicle_id = 1;
SELECT * FROM vehicle_logs;

SELECT vehicle_logs.*, services.description, locations.name
FROM vehicle_logs, services, locations
LEFT JOIN 

SELECT miles_driven, quantity 
FROM vehicle_logs 
WHERE vehicle_id = 1 AND log_type = 1;
