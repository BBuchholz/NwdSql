-- Select Active
SELECT SynergyListName 
FROM SynergyList 
WHERE SynergyListShelvedAt IS NULL 
   OR SynergyListActivatedAt > SynergyListShelvedAt;

-- Ensure List
INSERT OR IGNORE INTO SynergyList 
	(SynergyListName, SynergyListActivatedAt) 
VALUES 
	(?, CURRENT_TIMESTAMP);