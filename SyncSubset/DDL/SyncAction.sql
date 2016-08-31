-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SyncAction ( 
	SyncActionId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	SyncActionValue TEXT NOT NULL UNIQUE,
	SyncActionCreatedAt TEXT,
	SyncActionUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetSyncActionUpdatedAt
AFTER UPDATE ON SyncAction
BEGIN
UPDATE SyncAction 
	SET SyncActionUpdatedAt = CURRENT_TIMESTAMP
	WHERE SyncAction.SyncActionId = NEW.SyncActionId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSyncActionCreatedAt 
AFTER INSERT ON SyncAction
BEGIN
UPDATE SyncAction 
	SET SyncActionCreatedAt = CURRENT_TIMESTAMP, 
		   SyncActionUpdatedAt = CURRENT_TIMESTAMP
	WHERE SyncAction.SyncActionId = NEW.SyncActionId;
END