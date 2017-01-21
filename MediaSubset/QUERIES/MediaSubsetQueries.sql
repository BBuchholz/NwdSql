-- INSERT MediaRoot
INSERT OR IGNORE INTO MediaRoot
	(MediaDeviceId, MediaRootPath)
VALUES
	(?, ?);

-- INSERT MediaDevice
INSERT OR IGNORE INTO MediaDevice
	(MediaDeviceDescription)
VALUES
	(?);

-- SELECT MediaDeviceId
SELECT MediaDeviceId
FROM MediaDevice
WHERE MediaDeviceDescription = ? ;

-- SELECT ALL FROM MediaDevice
SELECT MediaDeviceId, MediaDeviceDescription
FROM MediaDevice;

-- SELECT ALL FROM MediaRoot for MediaDeviceId
SELECT MediaRootId, MediaRootPath
FROM MediaRoot
WHERE MediaDeviceId = ? ;

-- INSERT_MEDIA_PATH
INSERT OR IGNORE INTO MediaPath
	(MediaPathValue)
VALUES
	(?);

-- INSERT_MEDIA_FILE_NAME
INSERT OR IGNORE INTO Media
	(MediaFileName)
VALUES
	(?);

-- INSERT_MEDIA_DEVICE_PATH_FILENAME_DEVICEID_PATH_X_Y_Z
INSERT OR IGNORE INTO MediaDevicePath
	(MediaId, MediaDeviceId, MediaPathId)
VALUES
	(
		(SELECT m.MediaId FROM Media m LEFT JOIN MediaDevicePath mdp ON m.MediaId = mdp.MediaId WHERE m.MediaFileName = ? AND m.MediaHash IS NULL AND mdp.MediaDeviceId IS NULL LIMIT 1),
		?,
		(SELECT MediaPathId FROM MediaPath WHERE MediaPathValue = ? LIMIT 1)
	)

-- SELECT_PATH_FOR_DEVICE_ID_LIKE_ROOT_PATH_X_Y
SELECT mp.MediaPathValue 
FROM MediaPath mp 
JOIN MediaDevicePath mdp 
ON mp.MediaPathId = mdp.MediaPathId
WHERE mdp.MediaDeviceId = ?
AND mp.MediaPathValue LIKE ? || '%';

-- INSERT_MEDIA_HASH_X
INSERT OR IGNORE INTO Media
	(MediaHash)
VALUES
	(?);

-- SELECT_MEDIA_ID_FOR_HASH_X
SELECT MediaId 
FROM Media
WHERE MediaHash = ?

--UPDATE_HASH_FOR_MEDIA_ID
UPDATE Media 
SET MediaHash = ? 
WHERE MediaId = ? 

--INSERT_MEDIA_DEVICE_PATH
INSERT OR IGNORE INTO MediaDevicePath
	(MediaId, MediaDeviceId, MediaPathId)
VALUES
	(?, ?, ?);

-- SELECT_MEDIA_PATH_ID_FOR_PATH_X
SELECT MediaPathId 
FROM MediaPath 
WHERE MediaPathValue = ?