-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SynergyToDo (
	SynergyToDoId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SynergyListId INTEGER NOT NULL REFERENCES SynergyList (SynergyListId), 
	SynergyItemId INTEGER NOT NULL REFERENCES SynergyItem (SynergyItemId),
	SynergyToDoActivatedAt TEXT NOT NULL,
	SynergyToDoCompletedAt TEXT,
	SynergyToDoArchivedAt TEXT,
	SynergyToDoCreatedAt TEXT NOT NULL,
	SynergyToDoUpdatedAt TEXT NOT NULL, 
	UNIQUE(SynergyListId, SynergyItemId, SynergyToDoCreatedAt)
)

-- updated at trigger
CREATE TRIGGER SetSynergyToDoUpdatedAt
AFTER UPDATE ON SynergyToDo
BEGIN
UPDATE SynergyToDo 
	SET SynergyToDoUpdatedAt = CURRENT_TIMESTAMP
	WHERE SynergyToDo.SynergyToDoId = NEW.SynergyToDoId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSynergyToDoCreatedAt 
AFTER INSERT ON SynergyToDo
BEGIN
UPDATE SynergyToDo 
	SET SynergyToDoCreatedAt = CURRENT_TIMESTAMP, 
		   SynergyToDoUpdatedAt = CURRENT_TIMESTAMP,
		   SynergyToDoActivatedAt = CURRENT_TIMESTAMP
	WHERE SynergyToDo.SynergyToDoId = NEW.SynergyToDoId;
END