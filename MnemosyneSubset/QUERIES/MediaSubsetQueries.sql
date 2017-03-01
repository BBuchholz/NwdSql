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

--UPDATE_HASH_FOR_MEDIA_ID_X_Y
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
WHERE MediaPathValue = ?;

-- SELECT_MEDIA_TAG_ID_VALUE
SELECT MediaTagId, MediaTagValue
FROM MediaTag;

-- INSERT_MEDIA_TAG_X
INSERT OR IGNORE INTO MediaTag
	(MediaTagValue)
VALUES
	(?);

-- SELECT_MEDIA_TAG_ID_FOR_VALUE_X
SELECT MediaTagId 
FROM MediaTag
WHERE MediaTagValue = ?;

-- SELECT_MEDIA_WHERE_HASH_NOT_NULL_OR_WHITESPACE
SELECT MediaId, 
	   MediaFileName, 
	   MediaDescription, 
	   MediaHash
FROM Media
WHERE MediaHash IS NOT NULL AND trim(MediaHash, ' ') != '';

-- INSERT_OR_IGNORE_MEDIA_TAGGING_X_Y
INSERT OR IGNORE INTO MediaTagging
	(MediaId, MediaTagId)
VALUES
	(?, ?);

-- SELECT_TAGS_FOR_HASH
SELECT mt.MediaTagId,
	   mt.MediaTagValue,
	   mtg.MediaTaggingId,
	   mtg.MediaId,
	   mtg.MediaTaggingTaggedAt,
	   mtg.MediaTaggingUntaggedAt,
	   m.MediaHash
FROM MediaTag mt
JOIN MediaTagging mtg
ON mt.MediaTagId = mtg.MediaTagId
JOIN Media m
ON m.MediaId = mtg.MediaId
WHERE m.MediaHash = ?
AND (mtg.MediaTaggingUntaggedAt IS NULL 
   OR mtg.MediaTaggingUntaggedAt <= mtg.MediaTaggingTaggedAt);

-- UPDATE_MEDIA_TAGGING_TAGGED_UNTAGGED_WHERE_MEDIA_ID_AND_TAG_ID_W_X_Y_Z
UPDATE MediaTagging 
SET MediaTaggingTaggedAt = MAX(IFNULL(MediaTaggingTaggedAt, ''), ?),
	MediaTaggingUntaggedAt = MAX(IFNULL(MediaTaggingUntaggedAt, ''), ?)
WHERE MediaId = ? AND MediaTagId = ?; 

-- MNEMOSYNE_V5_SELECT_MEDIA_DEVICE_BY_DESC_X
SELECT MediaDeviceId, 
	   MediaDeviceDescription
FROM MediaDevice
WHERE MediaDeviceDescription = ?;

-- SELECT_DEVICE_PATHS_FOR_HASH_X
SELECT mp.MediaPathValue,
       md.MediaDeviceDescription,
       mdp.MediaDevicePathId,
       mdp.MediaId,
       mdp.MediaDeviceId,
       mdp.MediaPathId,
       mdp.MediaDevicePathVerifiedPresent,
       mdp.MediaDevicePathVerifiedMissing
FROM Media m
JOIN MediaDevicePath mdp
ON m.MediaId = mdp.MediaId
JOIN MediaDevice md
ON mdp.MediaDeviceId = md.MediaDeviceId
JOIN MediaPath mp
ON mp.MediaPathId = mdp.MediaPathId
WHERE m.MediaHash = ?;

-- SELECT_MEDIA_FOR_HASH_X
SELECT MediaId, 
	   MediaFileName, 
	   MediaDescription, 
	   MediaHash
FROM Media
WHERE MediaHash = ?

-- UPDATE_MEDIA_FILE_DESC_FOR_HASH_X_Y_Z
UPDATE Media 
SET MediaFileName = ?,
	MediaDescription = ?
WHERE MediaHash = ? 

-- INSERT_MEDIA_DEVICE_PATH_V_W_X_Y_Z
INSERT OR IGNORE INTO MediaDevicePath
	(
		MediaId,
		MediaDeviceId, 
		MediaPathId, 
		MediaDevicePathVerifiedPresent,
		MediaDevicePathVerifiedMissing
	)
VALUES
	(?, ?, ?, ?, ?);

-- UPDATE_MEDIA_DEVICE_PATH_V_W_X_Y_Z
UPDATE MediaDevicePath 
SET MediaDevicePathVerifiedPresent = MAX(IFNULL(MediaDevicePathVerifiedPresent, ''), ?),
	MediaDevicePathVerifiedMissing = MAX(IFNULL(MediaDevicePathVerifiedMissing, ''), ?)
WHERE MediaId = ? AND MediaDeviceId = ? AND MediaPathId = ?; 