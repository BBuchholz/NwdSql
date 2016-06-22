-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE RhymeGroup (
	RhymeGroupId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	RhymeGroupCreatedAt TEXT NOT NULL, 
	RhymeGroupUpdatedAt TEXT NOT NULL 
)

-- updated at trigger
CREATE TRIGGER SetRhymeGroupUpdatedAt
AFTER UPDATE ON RhymeGroup
BEGIN
UPDATE RhymeGroup 
	SET RhymeGroupUpdatedAt = CURRENT_TIMESTAMP
	WHERE RhymeGroup.RhymeGroupId = NEW.RhymeGroupId;
END

-- created at & updated at trigger
CREATE TRIGGER SetRhymeGroupCreatedAt 
AFTER INSERT ON RhymeGroup
BEGIN
UPDATE RhymeGroup 
	SET RhymeGroupCreatedAt = CURRENT_TIMESTAMP, 
		   RhymeGroupUpdatedAt = CURRENT_TIMESTAMP
	WHERE RhymeGroup.RhymeGroupId = NEW.RhymeGroupId;
END