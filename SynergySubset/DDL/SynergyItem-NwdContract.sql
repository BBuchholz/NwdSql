-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
"CREATE TABLE SynergyItem ("
+ "	SynergyItemId INTEGER NOT NULL PRIMARY KEY UNIQUE,  "
+ "	SynergyItemValue TEXT NOT NULL UNIQUE, "
+ "	SynergyItemCreatedAt TEXT, "
+ "	SynergyItemUpdatedAt TEXT "
+ ") "

"CREATE TRIGGER SetSynergyItemUpdatedAt "
+ "AFTER UPDATE ON SynergyItem "
+ "BEGIN "
+ "UPDATE SynergyItem  "
+ "	SET SynergyItemUpdatedAt = CURRENT_TIMESTAMP "
+ "	WHERE SynergyItem.SynergyItemId = NEW.SynergyItemId; "
+ "END "

"CREATE TRIGGER SetSynergyItemCreatedAt  "
+ "AFTER INSERT ON SynergyItem "
+ "BEGIN "
+ "UPDATE SynergyItem  "
+ "	SET SynergyItemCreatedAt = CURRENT_TIMESTAMP,  "
+ "		   SynergyItemUpdatedAt = CURRENT_TIMESTAMP "
+ "	WHERE SynergyItem.SynergyItemId = NEW.SynergyItemId; "
+ "END "