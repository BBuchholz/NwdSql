-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE File (
	FileId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	DeviceId INTEGER NOT NULL REFERENCES Device (DeviceId), 
	PathId INTEGER NOT NULL REFERENCES Path (PathId), 
	DisplayNameId INTEGER REFERENCES DisplayName (DisplayNameId), 
	FileDescription TEXT, 
	FileName TEXT,
	FileCreatedAt TEXT NOT NULL,
	FileUpdatedAt TEXT NOT NULL,  
	UNIQUE(DeviceId, PathId)
)

-- updated at trigger
CREATE TRIGGER SetFileUpdatedAt
AFTER UPDATE ON File
BEGIN
UPDATE File 
	SET FileUpdatedAt = CURRENT_TIMESTAMP
	WHERE File.FileId = NEW.FileId;
END

-- created at & updated at trigger
CREATE TRIGGER SetFileCreatedAt 
AFTER INSERT ON File
BEGIN
UPDATE File 
	SET FileCreatedAt = CURRENT_TIMESTAMP, 
		   FileUpdatedAt = CURRENT_TIMESTAMP
	WHERE File.FileId = NEW.FileId;
END