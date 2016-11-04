-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE Tag (
	TagId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	TagValue TEXT NOT NULL UNIQUE,
	TagCreatedAt TEXT,
	TagUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetTagUpdatedAt
AFTER UPDATE ON Tag
BEGIN
UPDATE Tag 
	SET TagUpdatedAt = CURRENT_TIMESTAMP
	WHERE Tag.TagId = NEW.TagId;
END

-- created at & updated at trigger
CREATE TRIGGER SetTagCreatedAt 
AFTER INSERT ON Tag
BEGIN
UPDATE Tag 
	SET TagCreatedAt = CURRENT_TIMESTAMP, 
		   TagUpdatedAt = CURRENT_TIMESTAMP
	WHERE Tag.TagId = NEW.TagId;
END