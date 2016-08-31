-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SyncProfileDevice ( 
	SyncProfileDeviceId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	DeviceIdExt INTEGER NOT NULL REFERENCES Device (DeviceId), 
	DeviceIdHost INTEGER NOT NULL REFERENCES Device (DeviceId), 
	SyncProfileId INTEGER NOT NULL REFERENCES SyncProfile (SyncProfileId),
	SyncProfileDeviceCreatedAt TEXT,
	SyncProfileDeviceUpdatedAt TEXT,   
	UNIQUE(DeviceIdExt, DeviceIdHost, SyncProfileId) 
)

-- updated at trigger
CREATE TRIGGER SetSyncProfileDeviceUpdatedAt
AFTER UPDATE ON SyncProfileDevice
BEGIN
UPDATE SyncProfileDevice 
	SET SyncProfileDeviceUpdatedAt = CURRENT_TIMESTAMP
	WHERE SyncProfileDevice.SyncProfileDeviceId = NEW.SyncProfileDeviceId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSyncProfileDeviceCreatedAt 
AFTER INSERT ON SyncProfileDevice
BEGIN
UPDATE SyncProfileDevice 
	SET SyncProfileDeviceCreatedAt = CURRENT_TIMESTAMP, 
		   SyncProfileDeviceUpdatedAt = CURRENT_TIMESTAMP
	WHERE SyncProfileDevice.SyncProfileDeviceId = NEW.SyncProfileDeviceId;
END