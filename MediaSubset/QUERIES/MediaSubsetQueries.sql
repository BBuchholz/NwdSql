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

-- INSERT_PATH
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
		(SELECT MediaId FROM Media WHERE MediaFileName = ? AND MediaHash IS NULL LIMIT 1),
		?,
		(SELECT MediaPathId FROM MediaPath WHERE MediaPathValue = ? LIMIT 1)
	)


-- SELECT_PATH_FOR_DEVICE_ID_LIKE_ROOT_PATH_X_Y
SELECT -- IN PROGRESS	