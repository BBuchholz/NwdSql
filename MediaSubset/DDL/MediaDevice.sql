-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE Device (
	MediaDeviceId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	MediaDeviceDescription TEXT NOT NULL UNIQUE,
	MediaDeviceCreatedAt TEXT,
	MediaDeviceUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetMediaDeviceUpdatedAt
AFTER UPDATE ON MediaDevice
BEGIN
UPDATE MediaDevice 
	SET MediaDeviceUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaDevice.MediaDeviceId = NEW.MediaDeviceId;
END

-- created at & updated at trigger
CREATE TRIGGER SetMediaDeviceCreatedAt 
AFTER INSERT ON MediaDevice
BEGIN
UPDATE MediaDevice 
	SET MediaDeviceCreatedAt = CURRENT_TIMESTAMP, 
		   MediaDeviceUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaDevice.MediaDeviceId = NEW.MediaDeviceId;
END