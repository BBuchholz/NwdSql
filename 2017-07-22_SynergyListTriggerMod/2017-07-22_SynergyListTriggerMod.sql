-- remove old trigger
DROP TRIGGER IF EXISTS SetSynergyListCreatedAt

-- NEW created at & updated at trigger
CREATE TRIGGER SetSynergyListCreatedAt 
AFTER INSERT ON SynergyList
BEGIN
UPDATE SynergyList 
	SET SynergyListCreatedAt = CURRENT_TIMESTAMP, 
		   SynergyListUpdatedAt = CURRENT_TIMESTAMP
	WHERE SynergyList.SynergyListId = NEW.SynergyListId;
END