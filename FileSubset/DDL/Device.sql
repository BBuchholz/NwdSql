-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE Device (
	DeviceId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	DeviceDescription TEXT NOT NULL UNIQUE,
	DeviceCreatedAt TEXT,
	DeviceUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetDeviceUpdatedAt
AFTER UPDATE ON Device
BEGIN
UPDATE Device 
	SET DeviceUpdatedAt = CURRENT_TIMESTAMP
	WHERE Device.DeviceId = NEW.DeviceId;
END

-- created at & updated at trigger
CREATE TRIGGER SetDeviceCreatedAt 
AFTER INSERT ON Device
BEGIN
UPDATE Device 
	SET DeviceCreatedAt = CURRENT_TIMESTAMP, 
		   DeviceUpdatedAt = CURRENT_TIMESTAMP
	WHERE Device.DeviceId = NEW.DeviceId;
END