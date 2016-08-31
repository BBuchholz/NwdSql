-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SyncMap ( 
	SyncMapId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	SyncProfileId INTEGER NOT NULL REFERENCES SyncProfile (SyncProfileId), 
	PathIdSource INTEGER NOT NULL REFERENCES Path (PathId), 
	PathIdDestination INTEGER NOT NULL REFERENCES Path (PathId), 
	SyncDirectionId INTEGER NOT NULL REFERENCES SyncDirection (SyncDirectionId), 
	SyncActionIdDefault INTEGER NOT NULL REFERENCES SyncAction (SyncActionId), 
	SyncMapCreatedAt TEXT,
	SyncMapUpdatedAt TEXT,
	UNIQUE(SyncProfileId, PathIdSource, PathIdDestination, SyncDirectionId) 
)

-- updated at trigger
CREATE TRIGGER SetSyncMapUpdatedAt
AFTER UPDATE ON SyncMap
BEGIN
UPDATE SyncMap 
	SET SyncMapUpdatedAt = CURRENT_TIMESTAMP
	WHERE SyncMap.SyncMapId = NEW.SyncMapId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSyncMapCreatedAt 
AFTER INSERT ON SyncMap
BEGIN
UPDATE SyncMap 
	SET SyncMapCreatedAt = CURRENT_TIMESTAMP, 
		   SyncMapUpdatedAt = CURRENT_TIMESTAMP
	WHERE SyncMap.SyncMapId = NEW.SyncMapId;
END