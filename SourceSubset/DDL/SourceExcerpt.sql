-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SourceExcerpt (
	SourceExcerptId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SourceId INTEGER NOT NULL REFERENCES Source (SourceId),
	SourceExcerptValue TEXT,
	SourceExcerptPages TEXT, 
	SourceExcerptBeginTime TEXT, 
	SourceExcerptEndTime TEXT, 
	SourceExcerptCreatedAt TEXT,
	SourceExcerptUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetSourceExcerptUpdatedAt
AFTER UPDATE ON SourceExcerpt
BEGIN
UPDATE SourceExcerpt 
	SET SourceExcerptUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceExcerpt.SourceExcerptId = NEW.SourceExcerptId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSourceExcerptCreatedAt 
AFTER INSERT ON SourceExcerpt
BEGIN
UPDATE SourceExcerpt 
	SET SourceExcerptCreatedAt = CURRENT_TIMESTAMP, 
		   SourceExcerptUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceExcerpt.SourceExcerptId = NEW.SourceExcerptId;
END