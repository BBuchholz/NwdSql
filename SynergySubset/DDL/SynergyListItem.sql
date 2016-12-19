-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SynergyListItem (
	SynergyListItemId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SynergyListId INTEGER NOT NULL REFERENCES SynergyList (SynergyListId), 
	SynergyItemId INTEGER NOT NULL REFERENCES SynergyItem (SynergyItemId), 
	SynergyListItemPosition INTEGER, 
	SynergyListItemCreatedAt TEXT,
	SynergyListItemUpdatedAt TEXT, 
	UNIQUE(SynergyListId, SynergyItemId)
)

-- updated at trigger
CREATE TRIGGER SetSynergyListItemUpdatedAt
AFTER UPDATE ON SynergyListItem
BEGIN
UPDATE SynergyListItem 
	SET SynergyListItemUpdatedAt = CURRENT_TIMESTAMP
	WHERE SynergyListItem.SynergyListItemId = NEW.SynergyListItemId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSynergyListItemCreatedAt 
AFTER INSERT ON SynergyListItem
BEGIN
UPDATE SynergyListItem 
	SET SynergyListItemCreatedAt = CURRENT_TIMESTAMP, 
		   SynergyListItemUpdatedAt = CURRENT_TIMESTAMP
	WHERE SynergyListItem.SynergyListItemId = NEW.SynergyListItemId;
END