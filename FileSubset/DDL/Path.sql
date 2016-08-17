-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE Path (
	PathId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	PathValue TEXT NOT NULL UNIQUE,
	PathCreatedAt TEXT,
	PathUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetPathUpdatedAt
AFTER UPDATE ON Path
BEGIN
UPDATE Path 
	SET PathUpdatedAt = CURRENT_TIMESTAMP
	WHERE Path.PathId = NEW.PathId;
END

-- created at & updated at trigger
CREATE TRIGGER SetPathCreatedAt 
AFTER INSERT ON Path
BEGIN
UPDATE Path 
	SET PathCreatedAt = CURRENT_TIMESTAMP, 
		   PathUpdatedAt = CURRENT_TIMESTAMP
	WHERE Path.PathId = NEW.PathId;
END