-- INSERT_DEVICE_ID_PATH_INTO_MEDIA_ROOT
INSERT OR IGNORE INTO MediaRoot
	(MediaDeviceId, MediaRootPath)
VALUES
	(?, ?);

-- INSERT_INTO_MEDIA_DEVICE
INSERT OR IGNORE INTO MediaDevice
	(MediaDeviceDescription)
VALUES
	(?);

-- SELECT_MEDIA_DEVICE_ID
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

-- INSERT_MEDIA_PATH_X
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
COLLATE NOCASE;

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
WHERE MediaTagValue = ? 
COLLATE NOCASE;

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

-- MNEMOSYNE_V5_GET_ACTIVE_TAGS_FOR_PATHS_FOR_DEVICE_NAME_X
SELECT mt.MediaTagValue, 
	   mp.MediaPathValue
FROM MediaPath mp
JOIN MediaDevicePath mdp
ON mp.MediaPathId = mdp.MediaPathId
JOIN MediaDevice md
ON mdp.MediaDeviceId = md.MediaDeviceId
JOIN Media m
ON mdp.MediaId = m.MediaId
JOIN MediaTagging mtg
ON m.MediaId = mtg.MediaId
JOIN MediaTag mt
ON mtg.MediaTagId = mt.MediaTagId  
WHERE md.MediaDeviceDescription = ?
AND mtg.MediaTaggingTaggedAt >= mtg.MediaTaggingUntaggedAt;

-- UPDATE_MEDIA_FILE_NAME_FOR_HASH_X_Y
UPDATE Media
SET MediaFileName = ?
WHERE MediaHash = ?;

-- UPDATE_MEDIA_DESCRIPTION_FOR_HASH_X_Y
UPDATE Media
SET MediaDescription = ?
WHERE MediaHash = ?;

-- SELECT_MEDIA_TAGGINGS_FOR_HASH_X
SELECT mt.MediaTagId, 
	   mtg.MediaTaggingId, 
	   m.MediaId, 
	   mt.MediaTagValue, 
	   m.MediaHash, 
	   mtg.MediaTaggingTaggedAt, 
	   mtg.MediaTaggingUntaggedAt
FROM Media m
JOIN MediaTagging mtg
ON m.MediaId = mtg.MediaId
JOIN MediaTag mt
ON mtg.MediaTagId = mt.MediaTagId
WHERE m.MediaHash = ?
COLLATE NOCASE

-- SELECT_MEDIA_DEVICE_PATHS_FOR_MEDIA_ID_X
SELECT mdp.MediaDevicePathId,
	   m.MediaId,
	   md.MediaDeviceId,
	   mp.MediaPathId,
	   mp.MediaPathValue,
	   md.MediaDeviceDescription,
	   mdp.MediaDevicePathVerifiedPresent,
	   mdp.MediaDevicePathVerifiedMissing
FROM Media m
JOIN MediaDevicePath mdp
ON m.MediaId = mdp.MediaId
JOIN MediaPath mp
ON mp.MediaPathId = mdp.MediaPathId
JOIN MediaDevice md
ON md.MediaDeviceId = mdp.MediaDeviceId
WHERE m.MediaId = ?

-- INSERT_OR_IGNORE_MEDIA_DEVICE_PATH_X_Y_Z
INSERT OR IGNORE INTO MediaDevicePath
	(MediaId, MediaDeviceId, MediaPathId)
VALUES
	(?, ?, ?);

--SELECT_MEDIA_WITH_DEVICE_PATHS_FOR_TAG_ID_X
SELECT m.MediaHash,
	   md.MediaDeviceDescription,
	   mp.MediaPathValue  
FROM MediaTagging mtg
JOIN MediaTag mt
ON mt.MediaTagId = mtg.MediaTagId
JOIN Media m
ON mtg.MediaId = m.MediaId
JOIN MediaDevicePath mdp
ON mdp.MediaId = m.MediaId
JOIN MediaDevice md
ON md.MediaDeviceId = mdp.MediaDeviceId
JOIN MediaPath mp 
ON mp.MediaPathId = mdp.MediaPathId
WHERE mt.MediaTagId = ? 
	
-- GET_PATH_TAGS_FOR_DEVICE_NAME_X
SELECT mt.MediaTagValue,
	   mp.MediaPathValue
FROM MediaTag mt
JOIN MediaTagging mtg
ON mt.MediaTagId = mtg.MediaTagId
JOIN Media m
ON mtg.MediaId = m.MediaId
JOIN MediaDevicePath mdp
ON m.MediaId = mdp.MediaId
JOIN MediaPath mp
ON mp.MediaPathId = mdp.MediaPathId
JOIN MediaDevice md 
ON mdp.MediaDeviceId = md.MediaDeviceId
WHERE md.MediaDeviceDescription = ?
AND IFNULL(mtg.MediaTaggingTaggedAt, '') >= IFNULL(mtg.MediaTaggingUntaggedAt, '')

-- GET_PATH_TAGS_FOR_ALL_DEVICES
SELECT mt.MediaTagValue,
	   mp.MediaPathValue
FROM MediaTag mt
JOIN MediaTagging mtg
ON mt.MediaTagId = mtg.MediaTagId
JOIN Media m
ON mtg.MediaId = m.MediaId
JOIN MediaDevicePath mdp
ON m.MediaId = mdp.MediaId
JOIN MediaPath mp
ON mp.MediaPathId = mdp.MediaPathId
JOIN MediaDevice md 
ON mdp.MediaDeviceId = md.MediaDeviceId
WHERE  IFNULL(mtg.MediaTaggingTaggedAt, '') >= IFNULL(mtg.MediaTaggingUntaggedAt, '')

-- SELECT_MEDIA_HASH_FOR_MEDIA_PATH
SELECT m.MediaHash 
FROM MediaPath mp
JOIN MediaDevicePath mdp
ON mp.MediaPathId = mdp.MediaPathId
JOIN Media m
ON mdp.MediaId = m.MediaId
WHERE mp.MediaPathValue = ? ;

-- SELECT_MEDIA_DEVICE_DESCRIPTION_FOR_MEDIA_PATH
SELECT md.MediaDeviceDescription 
FROM MediaPath mp
JOIN MediaDevicePath mdp
ON mp.MediaPathId = mdp.MediaPathId
JOIN MediaDevice md
ON mdp.MediaDeviceId = md.MediaDeviceId
WHERE mp.MediaPathValue = ? ;

-- SELECT_MEDIA_PATH_AND_HASH_WHERE_PATH_ENDS_WITH_X
SELECT 
    mp.MediaPathValue,
    m.MediaHash
FROM MediaPath mp
JOIN MediaDevicePath mdp 
ON mp.MediaPathId = mdp.MediaPathId
JOIN Media m
ON m.MediaId = mdp.MediaId
WHERE mp.MediaPathValue LIKE ? ;