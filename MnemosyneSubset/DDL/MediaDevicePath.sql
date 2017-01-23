-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE MediaDevicePath (
	MediaDevicePathId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	MediaId INTEGER NOT NULL REFERENCES Media (MediaId), 
	MediaDeviceId INTEGER NOT NULL REFERENCES MediaDevice (MediaDeviceId),
	MediaPathId INTEGER NOT NULL REFERENCES MediaPath (MediaPathId),
	MediaDevicePathCreatedAt TEXT,
	MediaDevicePathUpdatedAt TEXT, 
	UNIQUE(MediaId, MediaDeviceId, MediaPathId)
)

-- updated at trigger
CREATE TRIGGER SetMediaDevicePathUpdatedAt
AFTER UPDATE ON MediaDevicePath
BEGIN
UPDATE MediaDevicePath 
	SET MediaDevicePathUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaDevicePath.MediaDevicePathId = NEW.MediaDevicePathId;
END

-- created at & updated at trigger
CREATE TRIGGER SetMediaDevicePathCreatedAt 
AFTER INSERT ON MediaDevicePath
BEGIN
UPDATE MediaDevicePath 
	SET MediaDevicePathCreatedAt = CURRENT_TIMESTAMP, 
		   MediaDevicePathUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaDevicePath.MediaDevicePathId = NEW.MediaDevicePathId;
END