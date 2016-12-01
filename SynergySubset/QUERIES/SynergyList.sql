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

-- Get item values by position for list id
SELECT si.SynergyItemId, 
	   si.SynergyItemValue, 
	   sli.SynergyListItemPosition
FROM SynergyListItem sli
JOIN SynergyItem si
ON sli.SynergyItemId = si.SynergyItemId
WHERE sli.SynergyListId = ? ;