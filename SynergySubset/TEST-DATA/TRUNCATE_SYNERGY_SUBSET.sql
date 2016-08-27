-- sqlite doesn't have a TRUNCATE statement proper
-- so we simply do a DELETE on each table in the 
-- SYNERGY SUBSET without a WHERE clause

DELETE FROM SynergyItem;
DELETE FROM SynergyList;
DELETE FROM SynergyListItem;
DELETE FROM SynergyToDo;