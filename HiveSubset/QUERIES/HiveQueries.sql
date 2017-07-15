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