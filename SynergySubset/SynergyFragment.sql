-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SynergyFragment (
	SynergyFragmentId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SynergyListId INTEGER NOT NULL REFERENCES SynergyList (SynergyListId), 
	SynergyItemId INTEGER NOT NULL REFERENCES SynergyItem (SynergyItemId),
	SynergyFragmentCreatedAt TEXT,
	SynergyFragmentUpdatedAt TEXT, 
	UNIQUE(SynergyListId, SynergyItemId, SynergyFragmentCreatedAt)
)

-- updated at trigger
CREATE TRIGGER SetSynergyFragmentUpdatedAt
AFTER UPDATE ON SynergyFragment
BEGIN
UPDATE SynergyFragment 
	SET SynergyFragmentUpdatedAt = CURRENT_TIMESTAMP
	WHERE SynergyFragment.SynergyFragmentId = NEW.SynergyFragmentId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSynergyFragmentCreatedAt 
AFTER INSERT ON SynergyFragment
BEGIN
UPDATE SynergyFragment 
	SET SynergyFragmentCreatedAt = CURRENT_TIMESTAMP, 
		   SynergyFragmentUpdatedAt = CURRENT_TIMESTAMP
	WHERE SynergyFragment.SynergyFragmentId = NEW.SynergyFragmentId;
END