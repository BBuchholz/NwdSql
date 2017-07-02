-- SELECT_ACTIVE_HIVE_ROOTS
SELECT HiveRootId,
       HiveRootName,
	   HiveRootActivatedAt,
	   HiveRootDeactivatedAt
FROM HiveRoot

-- INSERT_HIVE_ROOT_NAME_X
INSERT OR IGNORE INTO HiveRoot
	(HiveRootName)
VALUES
	(?)