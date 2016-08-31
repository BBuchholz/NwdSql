-- due tregarding sqlite, 
each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SyncDirection ( 
	SyncDirectionId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	SyncDirectionValue TEXT NOT NULL UNIQUE,
	SyncDirectionCreatedAt TEXT,
	SyncDirectionUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetSyncDirectionUpdatedAt
AFTER UPDATE ON SyncDirection
BEGIN
UPDATE SyncDirection 
	SET SyncDirectionUpdatedAt = CURRENT_TIMESTAMP
	WHERE SyncDirection.SyncDirectionId = NEW.SyncDirectionId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSyncDirectionCreatedAt 
AFTER INSERT ON SyncDirection
BEGIN
UPDATE SyncDirection 
	SET SyncDirectionCreatedAt = CURRENT_TIMESTAMP, 
		   SyncDirectionUpdatedAt = CURRENT_TIMESTAMP
	WHERE SyncDirection.SyncDirectionId = NEW.SyncDirectionId;
END