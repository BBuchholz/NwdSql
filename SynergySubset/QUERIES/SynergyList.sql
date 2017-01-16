-- SYNERGY_V5_SELECT_ACTIVE_LISTS
SELECT SynergyListName 
FROM SynergyList 
WHERE SynergyListShelvedAt IS NULL 
   OR SynergyListActivatedAt >= SynergyListShelvedAt
ORDER BY SynergyListName;

-- SYNERGY_V5_SELECT_SHELVED_LISTS
SELECT SynergyListName 
FROM SynergyList 
WHERE SynergyListActivatedAt < SynergyListShelvedAt
ORDER BY SynergyListName;

-- Ensure List
INSERT OR IGNORE INTO SynergyList 
	(SynergyListName) 
VALUES 
	(?);

-- Get ID for ListName
SELECT SynergyListId 
FROM SynergyList 
WHERE SynergyListName = ? ;

-- Get ID and TimeStamps for ListName
SELECT SynergyListId, 
	   SynergyListActivatedAt, 
	   SynergyListShelvedAt 
FROM SynergyList 
WHERE SynergyListName = ? ;

-- Ensure SynergyItem
INSERT OR IGNORE INTO SynergyItem
	(SynergyItemValue)
VALUES
	(?);

-- SYNERGY_V5_SELECT_ID_FOR_ITEM_VALUE_X
SELECT SynergyItemId
FROM SynergyItem
WHERE SynergyItemValue = ? ;

-- SYNERGY_V5_SELECT_LIST_ITEM_ID_FOR_LIST_ID_ITEM_ID_X_Y
SELECT SynergyListItemId
FROM SynergyListItem
WHERE SynergyListId = ? 
AND SynergyItemId = ? ;

-- SYNERGY_V5_ENSURE_LIST_ITEM_POSITION_X_Y_Z
INSERT OR IGNORE INTO SynergyListItem
	(SynergyListId, 
	 SynergyItemId, 
	 SynergyListItemPosition)
VALUES
	(?, ?, ?);

-- SYNERGY_V5_SELECT_ITEM_VALUES_BY_POSITION_FOR_LIST_ID_X
SELECT si.SynergyItemId, 
	   si.SynergyItemValue, 
	   sli.SynergyListItemPosition
FROM SynergyListItem sli
JOIN SynergyItem si
ON sli.SynergyItemId = si.SynergyItemId
WHERE sli.SynergyListId = ? ;

-- SYNERGY_V5_SELECT_ITEM_VALUES_BY_POSITION_FOR_LIST_ID_X
SELECT si.SynergyItemId, 
	   si.SynergyItemValue, 
	   sli.SynergyListItemPosition,
	   sli.SynergyListItemId,
	   std.SynergyToDoId,
	   std.SynergyToDoActivatedAt,
	   std.SynergyToDoCompletedAt,
	   std.SynergyToDoArchivedAt
FROM SynergyListItem sli
JOIN SynergyItem si
ON sli.SynergyItemId = si.SynergyItemId
LEFT JOIN SynergyToDo std
ON sli.SynergyListItemId = std.SynergyListItemId
WHERE sli.SynergyListId = ?  
ORDER BY sli.SynergyListItemPosition;

-- SYNERGY_V5_LIST_UPDATE_ACTIVATE_AT_SHELVED_AT_FOR_LIST_NAME
UPDATE SynergyList 
SET SynergyListActivatedAt = MAX(IFNULL(SynergyListActivatedAt, ''), ?),
	SynergyListShelvedAt = MAX(IFNULL(SynergyListShelvedAt, ''), ?)
WHERE SynergyListName = ?; 

-- SYNERGY_V5_UPDATE_POSITION_FOR_LIST_ITEM_ID_X_Y
UPDATE SynergyListItem
SET SynergyListItemPosition = ?
WHERE SynergyListItemId = ? ;

-- SYNERGY_V5_ENSURE_TO_DO_FOR_LIST_ITEM_ID_ID_AC_CO_AR
INSERT OR IGNORE INTO SynergyToDo 
	(SynergyListItemId,
	 SynergyToDoActivatedAt,
	 SynergyToDoCompletedAt,
	 SynergyToDoArchivedAt) 
VALUES 
	(?, ?, ?, ?);

-- SYNERGY_V5_UPDATE_TO_DO_WHERE_LIST_ITEM_ID_AC_CO_AR_ID
UPDATE SynergyToDo 
SET SynergyToDoActivatedAt = MAX(IFNULL(SynergyToDoActivatedAt, ''), ?),
	SynergyToDoCompletedAt = MAX(IFNULL(SynergyToDoCompletedAt, ''), ?),
	SynergyToDoArchivedAt = MAX(IFNULL(SynergyToDoArchivedAt, ''), ?)
WHERE SynergyListItemId = ?; 

-- SYNERGY_V5_SELECT_LIST_NAMES_WITH_ITEM_COUNTS
SELECT sl.SynergyListName, COUNT(sli.SynergyListItemId) AS 'Count'
FROM SynergyList sl
LEFT JOIN SynergyListItem sli
ON sl.SynergyListId = sli.SynergyListId
LEFT JOIN SynergyToDo std
ON sli.SynergyListItemId = std.SynergyListItemId
WHERE (sl.SynergyListShelvedAt IS NULL 
   OR sl.SynergyListActivatedAt >= sl.SynergyListShelvedAt)
AND (std.SynergyToDoId IS NULL 
	OR (std.SynergyToDoActivatedAt >= std.SynergyToDoCompletedAt
		AND std.SynergyToDoActivatedAt >= std.SynergyToDoArchivedAt)
	)
GROUP BY sl.SynergyListName
ORDER BY sl.SynergyListName;

-- SYNERGY_V5_SELECT_LIST_NAMES_WITH_ITEM_COUNTS_NEW
SELECT sl.SynergyListName, SUM(
	CASE 
		WHEN std.SynergyToDoId IS NULL THEN 1
		WHEN std.SynergyToDoActivatedAt >= std.SynergyToDoCompletedAt
			AND std.SynergyToDoActivatedAt >= std.SynergyToDoArchivedAt
		THEN 1
		ELSE 0
	END
) AS 'Count'
FROM SynergyList sl
LEFT JOIN SynergyListItem sli
ON sl.SynergyListId = sli.SynergyListId
LEFT JOIN SynergyToDo std
ON sli.SynergyListItemId = std.SynergyListItemId
WHERE (sl.SynergyListShelvedAt IS NULL 
   OR sl.SynergyListActivatedAt >= sl.SynergyListShelvedAt)
GROUP BY sl.SynergyListName
ORDER BY sl.SynergyListName;
