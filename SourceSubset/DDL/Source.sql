-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE Source (
	SourceId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SourceTypeId INTEGER NOT NULL REFERENCES SourceType (SourceTypeId),
	SourceAuthor TEXT,
	SourceDirector TEXT, 
	SourceTitle TEXT, 
	SourceYear TEXT, 
	SourceUrl TEXT, 
	SourceRetrievalDate TEXT, 
	SourceCreatedAt TEXT,
	SourceUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetSourceUpdatedAt
AFTER UPDATE ON Source
BEGIN
UPDATE Source 
	SET SourceUpdatedAt = CURRENT_TIMESTAMP
	WHERE Source.SourceId = NEW.SourceId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSourceCreatedAt 
AFTER INSERT ON Source
BEGIN
UPDATE Source 
	SET SourceCreatedAt = CURRENT_TIMESTAMP, 
		   SourceUpdatedAt = CURRENT_TIMESTAMP
	WHERE Source.SourceId = NEW.SourceId;
END