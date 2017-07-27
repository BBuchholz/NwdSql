-- SELECT_ACTIVE_HIVE_ROOTS
SELECT HiveRootId,
       HiveRootName,
	   HiveRootActivatedAt,
	   HiveRootDeactivatedAt
FROM HiveRoot
WHERE IFNULL(HiveRootActivatedAt, '') >= IFNULL(HiveRootDeactivatedAt, '')

-- SELECT_DEACTIVATED_HIVE_ROOTS
SELECT HiveRootId,
       HiveRootName,
	   HiveRootActivatedAt,
	   HiveRootDeactivatedAt
FROM HiveRoot
WHERE IFNULL(HiveRootActivatedAt, '') < IFNULL(HiveRootDeactivatedAt, '')

-- SELECT_HIVE_ROOT_ID_FOR_NAME_X
SELECT HiveRootId
FROM HiveRoot
WHERE HiveRootName = ? 

-- INSERT_HIVE_ROOT_NAME_X
INSERT OR IGNORE INTO HiveRoot
	(HiveRootName)
VALUES
	(?)

-- HIVE_ROOT_UPDATE_ACTIVATE_AT_DEACTIVATED_AT_FOR_NAME_X_Y_Z
UPDATE HiveRoot 
SET HiveRootActivatedAt = MAX(IFNULL(HiveRootActivatedAt, ''), ?),
	HiveRootDeactivatedAt = MAX(IFNULL(HiveRootDeactivatedAt, ''), ?)
WHERE HiveRootName = ?; 

-- HIVE_ROOT_SELECT_ID_ACTIVATED_AT_DEACTIVATED_AT_FOR_NAME
SELECT HiveRootId, 
	   HiveRootActivatedAt, 
	   HiveRootDeactivatedAt 
FROM HiveRoot 
WHERE HiveRootName = ? ;