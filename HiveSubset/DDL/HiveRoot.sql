-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE HiveRoot (
	HiveRootId INTEGER NOT NULL PRIMARY KEY UNIQUE,
	HiveRootName TEXT NOT NULL UNIQUE,
	HiveRootActivatedAt TEXT,
	HiveRootDeactivatedAt TEXT, 
	HiveRootCreatedAt TEXT,
	HiveRootUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetHiveRootUpdatedAt
AFTER UPDATE ON HiveRoot
BEGIN
UPDATE HiveRoot 
	SET HiveRootUpdatedAt = CURRENT_TIMESTAMP
	WHERE HiveRoot.HiveRootId = NEW.HiveRootId;
END

-- created at & updated at trigger
CREATE TRIGGER SetHiveRootCreatedAt 
AFTER INSERT ON HiveRoot
BEGIN
UPDATE HiveRoot 
	SET HiveRootCreatedAt = CURRENT_TIMESTAMP, 
		   HiveRootUpdatedAt = CURRENT_TIMESTAMP
	WHERE HiveRoot.HiveRootId = NEW.HiveRootId;
END