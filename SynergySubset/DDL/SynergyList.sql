-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SynergyList (
	SynergyListId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SynergyListName TEXT NOT NULL UNIQUE,
	SynergyListActivatedAt TEXT, 
	SynergyListShelvedAt TEXT,
	SynergyListCreatedAt TEXT,
	SynergyListUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetSynergyListUpdatedAt
AFTER UPDATE ON SynergyList
BEGIN
UPDATE SynergyList 
	SET SynergyListUpdatedAt = CURRENT_TIMESTAMP
	WHERE SynergyList.SynergyListId = NEW.SynergyListId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSynergyListCreatedAt 
AFTER INSERT ON SynergyList
BEGIN
UPDATE SynergyList 
	SET SynergyListCreatedAt = CURRENT_TIMESTAMP, 
		   SynergyListUpdatedAt = CURRENT_TIMESTAMP,
		   SynergyListActivatedAt = CURRENT_TIMESTAMP
	WHERE SynergyList.SynergyListId = NEW.SynergyListId;
END