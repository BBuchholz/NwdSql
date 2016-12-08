-- Select Active
SELECT SynergyListName 
FROM SynergyList 
WHERE SynergyListShelvedAt IS NULL 
   OR SynergyListActivatedAt > SynergyListShelvedAt;

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

-- Get ID for SynergyItem
SELECT SynergyItemId
FROM SynergyItem
WHERE SynergyItemValue = ? ;

-- Ensure SynergyListItem
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